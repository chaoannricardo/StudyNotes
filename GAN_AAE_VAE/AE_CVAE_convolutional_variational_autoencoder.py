# -*- coding: utf-8 -*-
"""
Created on Tue Sep  8 18:34:55 2020

@author: ricardo

Reference: https://www.tensorflow.org/tutorials/generative/cvae
"""

from tensorflow.keras import backend as K
import cv2
import matplotlib.pyplot as plt
import numpy as np
import os
import random
import tensorflow as tf


# import written packages
import MNIST_reader


''' Import MNIST dataset '''
training_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/train-images.idx3-ubyte'
training_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/train-labels.idx1-ubyte'
test_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/t10k-images.idx3-ubyte'
test_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/t10k-labels.idx1-ubyte'

mnist_dataloader = MNIST_reader.MnistDataloader(training_images_filepath, training_labels_filepath, test_images_filepath, test_labels_filepath)
(X_train_raw, y_train), (X_test, y_test) = mnist_dataloader.load_data()

# adjust data to numpy array and regularize them
X_train = np.array(X_train_raw[:40000]) / 255.0
X_valid = np.array(X_train_raw[40000:])  / 255.0
X_test = np.array(X_test)  / 255.0

# shuffle the data
random.shuffle(X_train)
random.shuffle(X_valid)
random.shuffle(X_test)


''' Import Fashion MNIST dataset '''
# training_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/train-images-idx3-ubyte'
# training_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/train-labels-idx1-ubyte'
# test_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/t10k-images-idx3-ubyte'
# test_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/Fashion_MNIST/t10k-labels-idx1-ubyte'

# mnist_dataloader = MNIST_reader.MnistDataloader(training_images_filepath, training_labels_filepath, test_images_filepath, test_labels_filepath)
# (X_train_raw, y_train), (X_test, y_test) = mnist_dataloader.load_data()



# # adjust data to numpy array and regularize them
# X_train = np.array(X_train_raw[:int(len(X_train_raw) * 0.8)]) / 255.0
# X_valid = np.array(X_train_raw[int(len(X_train_raw) * 0.8):])  / 255.0
# X_test = np.array(X_test)  / 255.0

# # shuffle the data
# random.shuffle(X_train)
# random.shuffle(X_valid)
# random.shuffle(X_test)


''' 
Convolutional Variational Autoencoder
'''

''' Variational Sampling Class '''
# https://stackoverflow.com/questions/9663562/what-is-the-difference-between-init-and-call
# https://www.tensorflow.org/api_docs/python/tf/keras/backend/random_normal
class Sampling(tf.keras.layers.Layer):
    def __call__(self, inputs):
        mean, log_var = inputs
        # Gaussian distribution noise * Variance + Mean
        return K.random_normal(tf.shape(log_var)) * K.exp(log_var / 2) + mean
    
# create variational autoencoder with keras functional 
# difine size of latent space
coding_size = 10
input_shape = (28, 28, 1)

X_train = np.expand_dims(X_train, axis=3)

# encoder part
inputs = tf.keras.layers.Input(shape=input_shape)
z = tf.keras.layers.Conv2D(filters=32,
                               kernel_size=3,
                               strides=2,
                               padding='same')(inputs)
z = tf.keras.layers.Conv2D(filters=64,
                               kernel_size=3,
                               strides=2,
                               padding='same')(z)
z = tf.keras.layers.Conv2D(filters=128,
                               kernel_size=3,
                               strides=2,
                               padding='same')(z)
z = tf.keras.layers.Flatten()(z)
codings_mean = tf.keras.layers.Dense(coding_size)(z)
codings_log_var = tf.keras.layers.Dense(coding_size)(z)

# create coding from codings_mean and codings_log_var
codings = Sampling()([codings_mean, codings_log_var])
variational_encoder = tf.keras.Model(
    inputs=[inputs],
    outputs=[codings_mean, codings_log_var, codings])

# decoder part
decoder_inputs = tf.keras.layers.Input(shape=[coding_size])
g = tf.keras.layers.Dense(7 * 7 * 256)(decoder_inputs)
g = tf.keras.layers.Reshape((7, 7, 256))(g)
g = tf.keras.layers.Conv2DTranspose(filters=128,
                                        kernel_size=3,
                                        strides=2,
                                        padding='same')(g)
g = tf.keras.layers.BatchNormalization()(g)
g = tf.keras.layers.Conv2DTranspose(filters=64,
                                        kernel_size=3,
                                        strides=1,
                                        padding='same')(g)
g = tf.keras.layers.BatchNormalization()(g)
g = tf.keras.layers.Conv2DTranspose(filters=1,
                                        kernel_size=3,
                                        strides=2,
                                        padding='same')(g)


variational_decoder = tf.keras.Model(
    inputs=[decoder_inputs],
    outputs=[g])

# combine encoder and decoder
_, _, codings = variational_encoder(inputs)
reconstruction = variational_decoder(codings)
variational_ae = tf.keras.Model(inputs=[inputs], outputs=[reconstruction])

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
                             epochs=5,
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
export_path = 'X:/Windows_Storage/Storage/Github/StudyNotes/GAN_AAE_VAE/results/CVAE/Fashion_MNIST/'
codings = tf.random.normal(shape=[images_num, coding_size])
images = variational_decoder(codings).numpy()    

for index, image in enumerate(images):
    cv2.imwrite(export_path + str(index) + '.jpg', (image * 255.0))
    


# ''' CVAE Model '''
# # parameters to set up
# latent_dim = 3

# # CVAE encoder part
# input_shape = list(cv2.imread(image_dir + os.listdir(image_dir)[0], color_option).shape)
# input_shape.append(1)

# class CVAE(tf.keras.Model):
    
#     def __init__(self, latent_dim):
#         super(CVAE, self).__init__()
#         self.laten_dim = latent_dim
        
#         # construct encoder
#         inputs = tf.keras.layers.Input(shape=input_shape)
#         z = tf.keras.layers.Conv2D(filters=32,
#                         kernel_size=3,
#                         strides=(2, 2),
#                         activation='relu')(inputs)
#         z = tf.keras.layers.Conv2D(filters=64,
#                         kernel_size=3,
#                         strides=(2, 2),
#                         activation='relu')(z)
#         z = tf.keras.layers.Flatten()(z)
#         # No activation function
#         z = tf.keras.layers.Dense(latent_dim + latent_dim)(z)
        
#         self.encoder = tf.keras.Model(
#             inputs=[inputs],
#             outputs=[coding_mean, coding_log_variance])
        
#         x = tf.keras.layers.Input(shape=(latent_dim,))
#         x = tf.keras.layers.Dense(7*7*32, activation=tf.nn.relu)(x)
#         x = tf.keras.layers.Reshape(target_shape=(7, 7, 32))(x)
#         x = tf.keras.layers.Conv2DTranspose(filters=64,
#                                             kernel_size=3,
#                                             strides=2,
#                                             padding='same',
#                                             activation='relu')(x)
#         x = tf.keras.layers.Conv2DTranspose(filters=32,
#                                             kernel_size=3,
#                                             strides=2,
#                                             padding='same',
#                                             activation='relu')(x)
#         # No activation function
#         picture = tf.keras.layers.Conv2DTranspose(filters=1,
#                                             kernel_size=3,
#                                             strides=1,
#                                             padding='same')(x)
        
#     @tf.function
#     def sample(self, eps=None):
#         if eps is None:
#             eps = tf.random.normal(shape=(100, self.latent_dim))
#         return self.decode(eps, apply_sigmoid=True)

#     def encode(self, x):
#         mean, logvar = tf.split(self.encoder(x), num_or_size_splits=2, axis=1)
#         return mean, logvar
    
#     def reparameterize(self, mean, logvar):
#         eps = tf.random.normal(shape=mean.shape)
#         return eps * tf.exp(logvar * .5) + mean
    
#     def decode(self, z, apply_sigmoid=False):
#         logits = self.decoder(z)
#         if apply_sigmoid:
#             probs = tf.sigmoid(logits)
#             return probs
#         return logits

        
        
        








