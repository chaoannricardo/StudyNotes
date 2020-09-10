# -*- coding: utf-8 -*-
"""
Created on Sun Sep  6 10:18:51 2020

@author: ricardo

basic autoencoder framework (uncomplete structure)

O'relly "Hands-on Machine Learning with Scikit-Learn, Keras, and Tensorflow"
O'relly "精通機器學習"
Page 548

"""

# import packages needed
from tensorflow import keras
import cv2
import matplotlib.pyplot as plt
import numpy as np
import os
import random

# import package written
import MNIST_reader


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


'''  Really Basic Autoencoder'''
# # encoder part
# encoder = keras.models.Sequential()
# encoder.add(keras.layers.Dense(2, input_shape=[3]))

# # decoder part
# decoder = keras.models.Sequential()
# decoder.add(keras.layers.Dense(3, input_shape=[2]))

# # combine to create an autoencoder model
# autoencoder = keras.models.Sequential([encoder, decoder])

# # compile model
# autoencoder.compile(loss='mse', optimizer=keras.optimizers.SGD(lr=0.1))

# # fit the model
# history = autoencoder.fit(X_train, X_train, epochs=20)
# codings = encoder.predict(X_train)

# ''' Plot loss curve'''
# print(history.history.keys())
# plt.plot(history.history['loss'])
# plt.plot(history.history['val_loss'])
# plt.legend(['loss', 'val_loss'], loc='upper left')
# plt.show()


''' Stacked Autoencoder With Image '''
# # encoder part
# # https://mlfromscratch.com/activation-functions-explained/#/
# stacked_encoder = keras.models.Sequential([
#     keras.layers.Flatten(input_shape=[28, 28]),
#     keras.layers.Dense(100, activation='selu'),
#     keras.layers.Dense(30, activation='selu')
#     ])

# stacked_decoder = keras.models.Sequential([
#     keras.layers.Dense(100, activation='selu', input_shape=[30]),
#     keras.layers.Dense(28 * 28, activation='sigmoid'),
#     keras.layers.Reshape([28, 28])
#     ])

# stacked_ae = keras.models.Sequential([stacked_encoder, stacked_decoder])

# # compile the model
# stacked_ae.compile(loss='binary_crossentropy', optimizer=keras.optimizers.SGD(lr=1.5))
# print(stacked_encoder.summary())
# print(stacked_decoder.summary())


# # fit the model
# history = stacked_ae.fit(X_train, X_train,
#                           epochs=100, 
#                           validation_data=(X_valid, X_valid))


# ''' Plot loss curve'''
# print(history.history.keys())
# plt.plot(history.history['loss'])
# plt.plot(history.history['val_loss'])
# plt.legend(['loss', 'val_loss'], loc='upper left')
# plt.show()

# ''' reconstruct images '''
# def plot_image(image):
#     plt.imshow(image, cmap='binary')
#     # remove axis of the picture
#     plt.axis('off')
    
# def show_reconstruction(model, n_images=5):
#     reconstruction = model.predict(X_valid[:n_images])
#     plt.figure(figsize=(n_images * 1.5, 3))
#     for image_index in range(n_images):
#         plt.subplot(2, n_images, 1 + image_index)
#         plot_image(X_valid[:n_images][image_index])
#         plt.subplot(2, n_images, 1 + n_images + image_index)
#         plot_image(reconstruction[image_index])
        
# show_reconstruction(stacked_ae)


''' Stacked Autoencoder with deeper network'''

deep_stacked_encoder = keras.models.Sequential([
    keras.layers.Flatten(input_shape=[28, 28]),
    keras.layers.Dense(750, activation='selu'),
    keras.layers.Dense(500, activation='selu'),
    keras.layers.Dense(250, activation='selu'),
    keras.layers.Dense(50, activation='selu')
    ])

deep_stacked_decoder = keras.models.Sequential([
    keras.layers.Dense(250, input_shape=[50], activation='selu'),
    keras.layers.Dense(500, activation='selu'),
    keras.layers.Dense(750, activation='selu'),
    keras.layers.Dense(28 * 28, activation='sigmoid'),
    keras.layers.Reshape([28, 28])
    ])

deep_stacked_ae = keras.models.Sequential([deep_stacked_encoder, deep_stacked_decoder])

deep_stacked_ae.compile(loss='binary_crossentropy', optimizer=keras.optimizers.SGD(lr=1.5))
print(deep_stacked_encoder.summary())
print(deep_stacked_decoder.summary())

history = deep_stacked_ae.fit(X_train, X_train, 
                              epochs=50,
                              validation_data=(X_valid, X_valid))

# plot loss curve
print(history.history.keys())
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.legend(['loss', 'val_loss'], loc='upper left')
plt.show()

# predict and reconstruct the image
images_num = 10
# export_path = 'X:/Windows_Storage/Storage/Github/StudyNotes/GAN_AAE_VAE/results/AE/MNIST/'
export_path = 'X:/Windows_Storage/Storage/Github/StudyNotes/GAN_AAE_VAE/results/AE/Fashion_MNIST/'
plt.figure(figsize=(images_num * 2, 5))
reconstruction = deep_stacked_ae.predict(X_test)

for image_index in range(images_num):
    plt.subplot(2, images_num, image_index + 1)
    plt.imshow(X_test[image_index], cmap='binary_r')
    plt.axis('off')
    plt.subplot(2, images_num, images_num + image_index + 1)
    plt.imshow(reconstruction[image_index], cmap='binary_r')
    plt.axis('off')
    
# save reconstruction images
for index, image in enumerate(reconstruction):
    cv2.imwrite(export_path + str(index) + '.jpg', (image * 255.0))
    
    
    
    
    
    
    
    
    
    
    