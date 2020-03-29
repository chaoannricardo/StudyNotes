from sklearn.linear_model import LinearRegression
import numpy as np
import pandas as pd
import random


def create_data(real_B0, real_B1, real_B2):
    # Produce the data
    X_1 = [i * random.randint(100, 200) for i in range(0, 50000)]
    random.shuffle(X_1)
    X_2 = [i * random.randint(100, 200) for i in range(0, 50000)]
    random.shuffle(X_2)
    # error with normal distribution
    mu = 0,
    sigma = 40000
    error_list = np.random.normal(mu, sigma, 50000).tolist()
    # create list od y
    y_list = [real_B0 + real_B1 * X_1[i] + real_B2 * X_2[i] + error_list[i] for i in range(len(X_1))]
    # print(len(y_list))

    random_data = pd.DataFrame({
        'X1': X_1,
        'X2': X_2,
        'y': y_list
    })
    return random_data


def reg_raw(reg_data, epoch, learning_rate):
    # define our reg with two variables
    B_0 = random.random()
    B_1 = random.random()
    B_2 = random.random()
    for i in range(epoch):
        # calculate error
        error_list = []
        for a in range(len(reg_data)):
            predict_value = B_0 + B_1 * reg_data.iloc[a, 0] + B_2 * reg_data.iloc[a, 1]
            error_list.append((reg_data.iloc[a, 2] - predict_value))

        # calculate total error
        total_error = np.sum(error_list)

        # calculate loss and mse
        loss = 1 / 2 * (total_error ** 2)
        mse = total_error ** 2 / len(reg_data)

        # calculate new parameters set
        # d_B0
        d_B0 = -total_error

        # d_B1
        d_B1 = 0
        for a, b in enumerate(error_list):
            d_B1 += (b * reg_data.iloc[a, 0])
        d_B1 = -d_B1

        # d_B2
        d_B2 = 0
        for a, b in enumerate(error_list):
            d_B2 += (b * reg_data.iloc[a, 1])
        d_B2 = -d_B2

        B_0 = B_0 - learning_rate * d_B0
        B_1 = B_1 - learning_rate * d_B1
        B_2 = B_2 - learning_rate * d_B2
        print('New Parameter:', B_0, B_1, B_2)
        print('MSE:', mse)
        print('Loss:', loss)
        print(error_list)
        if i == 2:
            break


if __name__ == '__main__':
    data = create_data(0.777, 0.345, 0.897)
    reg_raw(data, 100, 0.03)


