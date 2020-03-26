from sklearn import linear_model
from sklearn.utils import shuffle
import numpy as np
import pandas as pd
import random
import matplotlib.pyplot as plt


def create_data(x, y, raw_data):
    # 取得周遭(25宮格)24格的值+自己的值
    # 中間為(X0)；剩餘格子自左上開始起算順時鐘分別為：X1~X24
    value_list = [int(raw_data.iloc[x, y])]
    y_list = [(y - 2), (y - 1), y, (y + 1), (y + 2), (y - 2), (y - 1), y, (y + 1), (y + 2), (y - 2),
              (y - 1),
              (y + 1), (y + 2), (y - 2), (y - 1), y, (y + 1), (y + 2), (y - 2), (y - 1), y, (y + 1),
              (y + 2)]
    x_list = [(x - 2), (x - 2), (x - 2), (x - 2), (x - 2), (x - 1), (x - 1), (x - 1), (x - 1), (x - 1), x,
              x, x, x,
              (x + 1), (x + 1), (x + 1), (x + 1), (x + 1), (x + 2), (x + 2), (x + 2), (x + 2), (x + 2)]

    # 開始建立資料
    for i, j in enumerate(y_list):
        if 0 <= y_list[i] <= (raw_data.shape[1] - 1):
            if 0 <= x_list[i] <= (raw_data.shape[0] - 1):
                # 邊界內填上原值
                value_list.append(int(raw_data.iloc[x_list[i], y_list[i]]))
            else:
                # 超出邊界填上0
                value_list.append(int(0))
        else:
            # 超出邊界填上0
            value_list.append(int(0))

    value_array = np.array([value_list])
    return value_array, value_list


def data_preprocessing(data_path):
    raw_data = pd.read_csv(data_path, header=None)
    # 準備最後餵進 pandas 的 list
    data_list = []
    for x in range(raw_data.shape[0]):
        for y in range(raw_data.shape[1]):
            value_array, value_list = create_data(x, y, raw_data)
            # Row 資料建立完成，Append 到總資料框上
            data_list.append(value_list)

    training_data = pd.DataFrame(data_list, columns=[('X' + str(i)) for i in range(25)])

    # 開始計算 x_movement, y_movement 值
    for i in range(len(training_data)):
        row_max = int(training_data.iloc[i, :].max())
        # create x-movement value
        if int(training_data.iloc[i, 1]) == row_max or int(training_data.iloc[i, 2]) == row_max \
                or int(training_data.iloc[i, 3]) == row_max \
                or int(training_data.iloc[i, 4]) == row_max or int(training_data.iloc[i, 5]) == row_max:
            training_data.loc[i, 'x_movement'] = -2
        elif int(training_data.iloc[i, 6]) == row_max or int(training_data.iloc[i, 7]) == row_max \
                or int(training_data.iloc[i, 8]) == row_max \
                or int(training_data.iloc[i, 9]) == row_max or int(training_data.iloc[i, 10]) == row_max:
            training_data.loc[i, 'x_movement'] = -1
        elif int(training_data.iloc[i, 11]) == row_max or int(training_data.iloc[i, 12]) == row_max \
                or int(training_data.iloc[i, 0]) == row_max \
                or int(training_data.iloc[i, 13]) == row_max or int(training_data.iloc[i, 14]) == row_max:
            training_data.loc[i, 'x_movement'] = 0
        elif int(training_data.iloc[i, 15]) == row_max or int(training_data.iloc[i, 16]) == row_max \
                or int(training_data.iloc[i, 17]) == row_max \
                or int(training_data.iloc[i, 18]) == row_max or int(training_data.iloc[i, 19]) == row_max:
            training_data.loc[i, 'x_movement'] = 1
        elif int(training_data.iloc[i, 20]) == row_max or int(training_data.iloc[i, 21]) == row_max \
                or int(training_data.iloc[i, 22]) == row_max \
                or int(training_data.iloc[i, 23]) == row_max or int(training_data.iloc[i, 24]) == row_max:
            training_data.loc[i, 'x_movement'] = 1
        # create y-movement value
        if int(training_data.iloc[i, 1]) == row_max or int(training_data.iloc[i, 6]) == row_max \
                or int(training_data.iloc[i, 11]) == row_max \
                or int(training_data.iloc[i, 15]) == row_max or int(training_data.iloc[i, 20]) == row_max:
            training_data.loc[i, 'y_movement'] = -2
        elif int(training_data.iloc[i, 2]) == row_max or int(training_data.iloc[i, 7]) == row_max \
                or int(training_data.iloc[i, 12]) == row_max \
                or int(training_data.iloc[i, 16]) == row_max or int(training_data.iloc[i, 21]) == row_max:
            training_data.loc[i, 'y_movement'] = -1
        elif int(training_data.iloc[i, 3]) == row_max or int(training_data.iloc[i, 8]) == row_max \
                or int(training_data.iloc[i, 0]) == row_max \
                or int(training_data.iloc[i, 17]) == row_max or int(training_data.iloc[i, 22]) == row_max:
            training_data.loc[i, 'y_movement'] = 0
        elif int(training_data.iloc[i, 4]) == row_max or int(training_data.iloc[i, 9]) == row_max \
                or int(training_data.iloc[i, 13]) == row_max \
                or int(training_data.iloc[i, 18]) == row_max or int(training_data.iloc[i, 23]) == row_max:
            training_data.loc[i, 'y_movement'] = 1
        elif int(training_data.iloc[i, 5]) == row_max or int(training_data.iloc[i, 10]) == row_max \
                or int(training_data.iloc[i, 14]) == row_max \
                or int(training_data.iloc[i, 19]) == row_max or int(training_data.iloc[i, 24]) == row_max:
            training_data.loc[i, 'y_movement'] = 2

    training_data.to_csv("./data/data_regression_data.csv", sep=',', index=None, header=True)
    return training_data, raw_data


def climb(data_path, penalty, margin, stop_epoch, memory, start_x, start_y):
    training_data, raw_data = data_preprocessing(data_path)
    # train regression model for y-axis
    X = training_data.iloc[:, :-2]
    y = training_data.iloc[:, -1]
    reg_y = linear_model.LinearRegression().fit(X, y)
    # print('R^2:', reg_y.score(X, y))
    # train regression model for x-axis
    X = training_data.iloc[:, :-2]
    y = training_data.iloc[:, -2]
    reg_x = linear_model.LinearRegression().fit(X, y)
    # print('R^2:', reg_x.score(X, y))

    # start climbing ==============
    epoch = 0
    x_history = []
    y_history = []
    x_memory = []
    y_memory = []
    while True:
        x_history.append(int(start_x))
        y_history.append(int(start_y))
        x_memory.append(int(start_x))
        y_memory.append(int(start_y))

        # 準備 Model 所需資料
        test_array, test_list = create_data(start_x, start_y, raw_data)

        # Model 預測 X,Y 移動值
        x_movement = int(np.around(reg_x.predict(test_array), decimals=0))
        y_movement = int(np.around(reg_y.predict(test_array), decimals=0))

        # 檢查新邊界
        # 新 x, y 都超出邊界
        if not 0 <= (start_y + y_movement) <= (raw_data.shape[1] - 1) \
                and not 0 <= (start_x + x_movement) <= (raw_data.shape[0] - 1):
            # 給予 y 相反象限的隨機值
            if y_movement < 0:
                candidate_list = [0, 1, 2]
                y_movement = candidate_list[random.randint(0, 2)]
            elif y_movement > 0:
                candidate_list = [0, -1, -2]
                y_movement = candidate_list[random.randint(0, 2)]
            # 給予 x 相反象限的隨機值
            if x_movement < 0:
                candidate_list = [0, 1, 2]
                x_movement = candidate_list[random.randint(0, 2)]
            elif x_movement > 0:
                candidate_list = [0, -1, -2]
                x_movement = candidate_list[random.randint(0, 2)]
        else:
            # x, y 都在邊界內；或只有其中一個超出邊界
            # 測試新y是否超出界線
            if 0 <= (start_y + y_movement) <= (raw_data.shape[1] - 1):
                pass
            else:
                # 減少移動直到不會超出邊界
                if y_movement < 0:
                    while not 0 <= (start_y + y_movement) <= (raw_data.shape[1] - 1):
                        y_movement += 1
                elif y_movement > 0:
                    while not 0 <= (start_y + y_movement) <= (raw_data.shape[1] - 1):
                        y_movement -= 1
            # 測試新x是否超出界線
            if 0 <= (start_x + x_movement) <= (raw_data.shape[0] - 1):
                pass
            else:
                # 減少移動直到不會超出邊界
                if x_movement < 0:
                    while not 0 <= (start_x + x_movement) <= (raw_data.shape[0] - 1):
                        x_movement += 1
                elif x_movement > 0:
                    while not 0 <= (start_x + x_movement) <= (raw_data.shape[0] - 1):
                        x_movement -= 1

        # 檢查是否回到原本的點
        if int(start_x + x_movement) in x_memory and int(start_y + y_movement) in y_memory:
            # 重新隨機賦予新值
            random_walk = [i for i in range(-2, 3)]

            if start_x <= margin or (raw_data.shape[0] - start_x) <= margin or start_y <= margin \
                    or (raw_data.shape[1] - start_y) <= margin:
                print('                   Random Walk (With Penalty)!!!!!!!')
                x_movement = penalty * random_walk[random.randint(0, len(random_walk) - 1)]
                y_movement = penalty * random_walk[random.randint(0, len(random_walk) - 1)]
                # 確認新點會在邊界內
                while not 0 <= (start_y + y_movement) <= (raw_data.shape[1] - 1) \
                        or not 0 <= (start_x + x_movement) <= (raw_data.shape[0] - 1):
                    x_movement = penalty * random_walk[random.randint(0, len(random_walk) - 1)]
                    y_movement = penalty * random_walk[random.randint(0, len(random_walk) - 1)]
            else:
                print('                   Random Walk!!!!!!!')
                x_movement = random_walk[random.randint(0, len(random_walk) - 1)]
                y_movement = random_walk[random.randint(0, len(random_walk) - 1)]
                # 確認新點會在邊界內
                while not 0 <= (start_y + y_movement) <= (raw_data.shape[1] - 1) \
                        or not 0 <= (start_x + x_movement) <= (raw_data.shape[0] - 1):
                    x_movement = random_walk[random.randint(0, len(random_walk) - 1)]
                    y_movement = random_walk[random.randint(0, len(random_walk) - 1)]

        # 給予新值
        start_x += x_movement
        start_y += y_movement

        # reset 歷史紀錄
        if epoch % memory == 0:
            x_memory = []
            y_memory = []

        # 檢查是否已經抵達山頂
        Volcano_max = int(np.max(raw_data.max()))
        new_value = int(raw_data.iloc[start_x, start_y])
        if float(new_value) == float(Volcano_max):
            print('We have reached the peak!')
            print(start_x, start_y, int(raw_data.iloc[start_x, start_y]))
            break

        # 最多走多少步
        if epoch == stop_epoch:
            break
        # 增加 epoch
        print('Epoch:', epoch)
        print(start_x, start_y, int(raw_data.iloc[start_x, start_y]))
        epoch += 1
    return x_history, y_history


if __name__ == '__main__':
    x_history, y_history = climb("C:/Storage/Github/StudyNotes/2020_DataAnalytics/data/Volcano.csv",
          penalty=5, margin=10, stop_epoch=3000, memory=5, start_x=60, start_y=86)
#     print(x_history, '\n', y_history)
    plt.figure(figsize=(5, 5))
    plt.plot(x_history, y_history, linewidth=1)
#     img = plt.imread('./data/Volcano.PNG')
#     plt.imshow(img)
    plt.show()