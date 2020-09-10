# -*- coding: utf-8 -*-
"""
Created on Thu Sep 10 00:07:54 2020

@author: ricardo
"""

import cv2
import numpy as np
import os

# import written packages
import MNIST_reader


def prep_image_data(image_dir):
    image_list = []
    color_option = cv2.IMREAD_GRAYSCALE
    
    for file_index, file in enumerate(os.listdir(image_dir)):
        picture = cv2.imread(image_dir + file, color_option) / 255.0
        image_list.append(picture)
    
    X_train = np.array(image_list[:int(0.7 * len(os.listdir(image_dir)))])
    X_valid = np.array(image_list[int(0.7 * len(os.listdir(image_dir))):int(0.9 * len(os.listdir(image_dir)))])
    X_test = np.array(image_list[int(0.9 * len(os.listdir(image_dir))):])
    
    return X_train, X_valid, X_test
