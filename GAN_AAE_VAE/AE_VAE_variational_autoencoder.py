# -*- coding: utf-8 -*-
"""
Created on Mon Sep  7 19:40:16 2020

@author: ricardo

O'relly "Hands-on Machine Learning with Scikit-Learn, Keras, and Tensorflow"
O'relly "精通機器學習"
Page 565

"""

from tensorflow import keras
from tensorflow.keras import backend as K
import cv2
import matplotlib.pyplot as plt
import numpy as np
import os
import random
import tensorflow as tf

# import written packages
import MNIST_reader
import image_data_manipulation


''' Prepare image trainging dataset with regularization '''
# image_dir = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/trainingSample/'
# # image_dir = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MVTec_Anomaly_Detection_Dataset_(MVTec AD)/screw/train/good/'
# X_train, X_valid, X_test = image_data_manipulation.prep_image_data(image_dir)


''' Import MNIST dataset '''
# training_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/train-images.idx3-ubyte'
# training_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/train-labels.idx1-ubyte'
# test_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/t10k-images.idx3-ubyte'
# test_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/t10k-labels.idx1-ubyte'

# mnist_dataloader = MNIST_reader.MnistDataloader(training_images_filepath, training_labels_filepath, test_images_filepath, test_labels_filepath)
# (X_train_raw, y_train), (X_test, y_test) = mnist_dataloader.load_data()

# # adjust data to numpy array and regularize them
# X_train = np.array(X_train_raw[:40000]) / 255.0
# X_valid = np.array(X_train_raw[40000:])  / 255.0
# X_test = np.array(X_test)  / 255.0

# # shuffle the data
# # random.shuffle(X_train)
# # random.shuffle(X_valid)
# # random.shuffle(X_test)

''' Import Fashion MNIST dataset '''
training_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/train-images-idx3-ubyte'
training_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/train-labels-idx1-ubyte'
test_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/t10k-images-idx3-ubyte'
test_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/t10k-labels-idx1-ubyte'

mnist_dataloader = MNIST_reader.MnistDataloader(training_images_filepath, training_labels_filepath, test_images_filepath, test_labels_filepath)
(X_train_raw, y_train), (X_test, y_test) = mnist_dataloader.load_data()



# adjust data to numpy array and regularize them
X_train = np.array(X_train_raw[:int(len(X_train_raw) * 0.8)]) / 255.0
X_valid = np.array(X_train_raw[int(len(X_train_raw) * 0.8):])  / 255.0
X_test = np.array(X_test)  / 255.0

# shuffle the data
random.shuffle(X_train)
random.shuffle(X_valid)
random.shuffle(X_test)


''' 
Variational Autoencoder
'''

''' Variational Sampling Class '''
# https://stackoverflow.com/questions/9663562/what-is-the-difference-between-init-and-call
# https://www.tensorflow.org/api_docs/python/tf/keras/backend/random_normal
class Sampling(keras.layers.Layer):
    def __call__(self, inputs):
        mean, log_var = inputs
        # Gaussian distribution noise * Variance + Mean
        return K.random_normal(tf.shape(log_var)) * K.exp(log_var / 2) + mean
    
# create variational autoencoder with keras functional 
# difine size of latent space
coding_size = 10
input_shape = (28, 28)

# encoder part
inputs = keras.layers.Input(shape=input_shape)
z = keras.layers.Flatten()(inputs)
z = keras.layers.Dense(150, activation='selu')(z)
z = keras.layers.Dense(100, activation='selu')(z)

codings_mean = keras.layers.Dense(coding_size)(z)
codings_log_var = keras.layers.Dense(coding_size)(z)

# create coding from codings_mean and codings_log_var
codings = Sampling()([codings_mean, codings_log_var])
variational_encoder = keras.Model(
    inputs=[inputs],
    outputs=[codings_mean, codings_log_var, codings])

# decoder part
decoder_inputs = keras.layers.Input(shape=[coding_size])
x = keras.layers.Dense(100, activation='selu')(decoder_inputs)
x = keras.layers.Dense(150, activation='selu')(x)
x = keras.layers.Dense(input_shape[0] * input_shape[1], activation='sigmoid')(x)
outputs = keras.layers.Reshape(input_shape)(x)

variational_decoder = keras.Model(
    inputs=[decoder_inputs],
    outputs=[outputs])

# combine encoder and decoder
_, _, codings = variational_encoder(inputs)
reconstruction = variational_decoder(codings)
variational_ae = keras.Model(inputs=[inputs], outputs=[reconstruction])

''' Loss Fuction '''
# https://stackoverflow.com/questions/54126451/what-does-axis-1-2-3-mean-in-k-sum-in-keras-backend
latent_loss = -0.5 * K.sum(1 + codings_log_var - K.exp(codings_log_var) - K.square(codings_mean),
                           axis=-1)
variational_ae.add_loss(K.mean(latent_loss) / float(input_shape[0] * input_shape[1]))

# compile the model
variational_ae.compile(loss='binary_crossentropy', optimizer='rmsprop')
print(variational_encoder.summary())
print(variational_decoder.summary())
print(variational_ae.summary())

# train the model
history = variational_ae.fit(X_train, X_train, 
                             epochs=50,
                             batch_size=30,
                             validation_data=(X_valid, X_valid))

# plot loss function curve
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.legend(['loss', 'val_loss'], loc='upper left')
plt.show()



print(codings_mean)
print(type(codings_mean))

print(K.mean(codings_mean))
print(tf.reduce_mean(codings_mean))

print(type(K.mean(codings_mean)))



'''construct random images'''
images_num = 10

codings = tf.random.normal(shape=[images_num, coding_size])
# codings = tf.random.normal(shape=[images_num, coding_size], 
#                             mean=4,
#                             stddev=5)

images = variational_decoder(codings).numpy()
plt.figure(images_num * 5)
for image_index in range(images_num):
    plt.subplot(1, images_num, (image_index + 1))
    plt.imshow(images[image_index], cmap='binary_r')
    plt.axis('off')
    
plt.show()


# export a lot of random images
images_num = 300
# export_path = 'X:/Windows_Storage/Storage/Github/StudyNotes/GAN_AAE_VAE/results/VAE/MNIST/'
export_path = 'X:/Windows_Storage/Storage/Github/StudyNotes/GAN_AAE_VAE/results/VAE/Fashion_MNIST/'
codings = tf.random.normal(shape=[images_num, coding_size])
images = variational_decoder(codings).numpy()    

for index, image in enumerate(images):
    cv2.imwrite(export_path + str(index) + '.jpg', (image * 255.0))
    


''' Semantic Interpolation'''


    

    
    
    
    
    
    
    
    
    
    
    
    
    

    