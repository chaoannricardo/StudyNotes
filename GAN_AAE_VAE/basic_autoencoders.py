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
from matplotlib import image
import matplotlib.pyplot as plt
import numpy as np
import os
import pandas as pd
import random


''' Create Training Data '''
# create testing data
random.seed(100)
X_train = pd.DataFrame({
    'x1': [random.random() for i in range(1000)],
    'x2': [random.random() for i in range(1001, 2001)],
    'x3': [random.random() for i in range(2001, 3001)]
    })


''' Simple Autoencoder'''
# encoder part
encoder = keras.models.Sequential()
encoder.add(keras.layers.Dense(2, input_shape=[3]))

# decoder part
decoder = keras.models.Sequential()
decoder.add(keras.layers.Dense(3, input_shape=[2]))

# combine to create an autoencoder model
autoencoder = keras.models.Sequential([encoder, decoder])

# compile model
autoencoder.compile(loss='mse', optimizer=keras.optimizers.SGD(lr=0.1))

# fit the model
history = autoencoder.fit(X_train, X_train, epochs=20)
codings = encoder.predict(X_train)


''' Read in image as numpy array'''
# read in image dataset (MNIST) 28*28
image_dir = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/trainingSample/'
image_list = []

for file_index, file in enumerate(os.listdir(image_dir)):
    picture = image.imread(image_dir + file)
    image_list.append(picture)

# split the dataset and regularize the array
X_train = np.array(image_list[:300]) / 255.0
X_valid = np.array(image_list[300:500]) /255.0
X_test = np.array(image_list[500:]) / 255.0

print(X_train.shape)


''' Stacked Autoencoder With Image '''
# encoder part
# https://mlfromscratch.com/activation-functions-explained/#/
stacked_encoder = keras.models.Sequential([
    keras.layers.Flatten(input_shape=[28, 28]),
    keras.layers.Dense(100, activation='selu'),
    keras.layers.Dense(30, activation='selu')
    ])

stacked_decoder = keras.models.Sequential([
    keras.layers.Dense(100, activation='selu', input_shape=[30]),
    keras.layers.Dense(28 * 28, activation='sigmoid'),
    keras.layers.Reshape([28, 28])
    ])

stacked_ae = keras.models.Sequential([stacked_encoder, stacked_decoder])

# compile the model
stacked_ae.compile(loss='binary_crossentropy', optimizer=keras.optimizers.SGD(lr=1.5))

# fit the model
history = stacked_ae.fit(X_train, X_train,
                          epochs=100, 
                          validation_data=[X_valid, X_valid])


''' Plot loss curve'''
print(history.history.keys())
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.legend(['loss', 'val_loss'], loc='upper left')
plt.show()

''' reconstruct images '''
def plot_image(image):
    plt.imshow(image, cmap='binary')
    # remove axis of the picture
    plt.axis('off')
    
def show_reconstruction(model, n_images=5):
    reconstruction = model.predict(X_valid[:n_images])
    plt.figure(figsize=(n_images * 1.5, 3))
    for image_index in range(n_images):
        plt.subplot(2, n_images, 1 + image_index)
        plot_image(X_valid[:n_images][image_index])
        plt.subplot(2, n_images, 1 + n_images + image_index)
        plot_image(reconstruction[image_index])
        
show_reconstruction(stacked_ae)


''' Stacked autoencoder with deeper network'''

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

history = deep_stacked_ae.fit(X_train, X_train, 
                              epochs=100,
                              validation_data=[X_valid, X_valid])

# plot loss curve
print(history.history.keys())
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.legend(['loss', 'val_loss'], loc='upper left')
plt.show()

# predict and reconstruct the image
images_num = 10
plt.figure(figsize=(images_num * 2, 5))
reconstruction = deep_stacked_ae.predict(X_test)

for image_index in range(images_num):
    plt.subplot(2, images_num, image_index + 1)
    plt.imshow(X_test[image_index], cmap='binary')
    plt.axis('off')
    plt.subplot(2, images_num, images_num + image_index + 1)
    plt.imshow(reconstruction[image_index], cmap='binary')
    plt.axis('off')