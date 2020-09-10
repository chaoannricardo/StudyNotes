# -*- coding: utf-8 -*-
"""
Created on Wed Sep  9 18:17:54 2020

@author: ricardo
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
import image_data_manipulation


# ''' Prepare image trainging dataset with regularization '''
# image_dir = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/trainingSample/'
# # image_dir = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MVTec_Anomaly_Detection_Dataset_(MVTec AD)/screw/train/good/'
# image_list = []
# color_option = cv2.IMREAD_GRAYSCALE

# for file_index, file in enumerate(os.listdir(image_dir)):
#     picture = cv2.imread(image_dir + file, color_option) / 255.0
#     image_list.append(picture)
    
# total_image_nums = len(os.listdir(image_dir))

# X_train = np.array(image_list[:int(0.7 * len(os.listdir(image_dir)))])
# X_valid = np.array(image_list[int(0.7 * len(os.listdir(image_dir))):int(0.9 * len(os.listdir(image_dir)))])
# X_test = np.array(image_list[int(0.9 * len(os.listdir(image_dir))):])


''' Import MNIST dataset '''
training_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/train-images.idx3-ubyte'
training_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/train-labels.idx1-ubyte'
test_images_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/t10k-images.idx3-ubyte'
test_labels_filepath = 'X:/Windows_Storage/r08546036/College/Research/Datasets/MNIST/t10k-labels.idx1-ubyte'

mnist_dataloader = MNIST_reader.MnistDataloader(training_images_filepath, training_labels_filepath, test_images_filepath, test_labels_filepath)
(X_train_raw, y_train), (X_test, y_test) = mnist_dataloader.load_data()

# adjust data to numpy array and regularize them
''' Cause the activation function is 'tanh', so we would have to adjust the color between -1 and 1 '''
X_train = np.array(X_train_raw[:40000]) / 127.5 - 1.0
X_valid = np.array(X_train_raw[40000:])  / 127.5 -1.0
X_test = np.array(X_test)  / 127.5 - 1.0

# shuffle the data
random.shuffle(X_train)
random.shuffle(X_valid)
random.shuffle(X_test)


''' basic configurations '''
img_shape = (28, 28, 1)
# length of the noise vector
z_dim = 100


def build_generator(img_shape, z_dim):
    inputs = tf.keras.layers.Input(shape=z_dim)
    g = tf.keras.layers.Dense(7 * 7 * 256)(inputs)
    g = tf.keras.layers.Reshape((7, 7, 256))(g)
    g = tf.keras.layers.Conv2DTranspose(filters=128,
                                        kernel_size=3,
                                        strides=2,
                                        padding='same')(g)
    g = tf.keras.layers.BatchNormalization()(g)
    g = tf.keras.layers.LeakyReLU(alpha=0.01)(g)
    g = tf.keras.layers.Conv2DTranspose(filters=64,
                                        kernel_size=3,
                                        strides=1,
                                        padding='same')(g)
    g = tf.keras.layers.BatchNormalization()(g)
    g = tf.keras.layers.LeakyReLU(alpha=0.01)(g)
    g = tf.keras.layers.Conv2DTranspose(filters=1,
                                        kernel_size=3,
                                        strides=2,
                                        padding='same')(g)
    g = tf.keras.layers.Activation('tanh')(g)
    generator = tf.keras.Model(inputs=[inputs],
                                outputs=[g])
    return generator


def build_discriminator(img_shape):
    inputs = tf.keras.layers.Input(shape=img_shape)
    d = tf.keras.layers.Conv2D(filters=32,
                               kernel_size=3,
                               strides=2,
                               padding='same')(inputs)
    d = tf.keras.layers.LeakyReLU(alpha=0.01)(d)
    d = tf.keras.layers.Conv2D(filters=64,
                               kernel_size=3,
                               strides=2,
                               padding='same')(d)
    d = tf.keras.layers.BatchNormalization()(d)
    d = tf.keras.layers.LeakyReLU(alpha=0.01)(d)
    d = tf.keras.layers.Conv2D(filters=128,
                               kernel_size=3,
                               strides=2,
                               padding='same')(d)
    d = tf.keras.layers.BatchNormalization()(d)
    d = tf.keras.layers.LeakyReLU(alpha=0.01)(d)
    d = tf.keras.layers.Flatten()(d)
    d = tf.keras.layers.Dense(1, activation='sigmoid')(d)
    discriminator = tf.keras.Model(inputs=[inputs],
                                   outputs=[d])
    return discriminator


# combine generator and discriminator
def build_gan(generator, discriminator):
    model = tf.keras.Sequential()
    model.add(generator)
    model.add(discriminator)
    return model

# compile discriminator
discriminator = build_discriminator(img_shape)
discriminator.compile(loss='binary_crossentropy',
                      optimizer=tf.keras.optimizers.Adam(),
                      metrics=['accuracy'])

# compile gan itself
discriminator.trainable = False
generator = build_generator(img_shape, z_dim)
gan = build_gan(generator, discriminator)
gan.compile(loss='binary_crossentropy',
            optimizer=tf.keras.optimizers.Adam())

print(generator.summary())
print(discriminator.summary())
print(gan.summary())


''' gan image generator '''

def sample_images(generator, image_grid_rows=4, image_grid_columns=4):
    
    sample_dist = np.random.normal(0, 1, 
                                   (image_grid_rows * image_grid_columns, z_dim))
    gem_imgs = generator.predict(sample_dist)
    gen_imgs = (gem_imgs + 1.0) * 127.5 
    fig, axs = plt.subplots(image_grid_rows,
                            image_grid_columns,
                            figsize=(4,4),
                            sharey=True,
                            sharex=True)
    cnt = 0
    for i in range(image_grid_rows):
        for j in range(image_grid_columns):
            axs[i, j].imshow(gen_imgs[cnt, :, :, 0], cmap='binary_r')
            
            axs[i, j].axis('off')
            cnt += 1


''' train function '''
# define training function
losses = []
d_loss_list = []
g_loss_list = []
accuracies = []
iteration_checkpoints = []

def train(generator, discriminator, gan, iterations, batch_size, sample_interval, X_train, X_valid):
    
    X_train = np.expand_dims(X_train, axis=3)
    
    # configure real & fake data
    real = np.ones((batch_size, 1))
    fake = np.zeros((batch_size, 1))
    
    for iteration in range(iterations):
        # randomly select one image
        idx = np.random.randint(0, X_train.shape[0], batch_size)
        imgs = X_train[idx]
        
        # sample from normal dist
        dist_samples = np.random.normal(0, 1, (batch_size, 100))
        
        gen_imgs = generator.predict(dist_samples)
        
        d_loss_real = discriminator.train_on_batch(imgs, real)
        d_loss_fake = discriminator.train_on_batch(gen_imgs, fake)
        d_loss, accuracy = 0.5 * np.add(d_loss_real, d_loss_fake)
        
        # train the generator
        dist_samples = np.random.normal(0, 1, (batch_size, 100))
        
        g_loss = gan.train_on_batch(dist_samples, real)
        
        # document the losses
        if (iteration + 1) % sample_interval == 0:
            losses.append((d_loss, g_loss))
            g_loss_list.append(g_loss)
            d_loss_list.append(d_loss)
            accuracies.append(100.0 * accuracy)
            iteration_checkpoints.append(iteration + 1)
            print('Epoch:', (iteration + 1), 
                  ',D_loss:', np.around(d_loss, decimals=4), 
                  ',G_loss', np.around(g_loss, decimals=4), 
                  ',acc:', np.around(accuracy, decimals=4))
            
            
# train gan
iterations = 2000
batch_size = 128
sample_interval = 100
train(generator, discriminator, gan, iterations, batch_size, sample_interval, X_train, X_valid)     
        
# plot loss function curve
plt.plot(g_loss_list)
plt.plot(d_loss_list)
plt.legend(['g_loss', 'd_loss'], loc='upper left')
plt.show()

sample_images(generator, image_grid_rows=5, image_grid_columns=5)

# export a lot of random images
images_num = 300
export_path = 'X:/Windows_Storage/Storage/Github/StudyNotes/GAN_AAE_VAE/results/DCGAN/MNIST/'
sample_dist = np.random.normal(0, 1, (images_num, z_dim))
gem_imgs = generator.predict(sample_dist)
gen_imgs = (gem_imgs + 1.0) * 127.5 


for index, image in enumerate(gen_imgs):
    cv2.imwrite(export_path + str(index) + '.jpg', (image))

    
    




