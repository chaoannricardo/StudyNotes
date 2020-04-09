import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


def PCA_decomposition(X, isCorrMX):
    # Reference: https://machinelearningmastery.com/calculate-principal-component-analysis-scratch-python/
    # calculate mean of the array
    X_mean = np.mean(X.T, axis=1)
    # center the values
    X_center = X - X_mean
    # check if use Correlation Matrix
    if isCorrMX == True:
        X_covariance = np.corrcoef(X_center.T)
    else:
        X_covariance = np.cov(X_center.T)
    # calculate eigenvalues and eigenvectors
    # https://docs.scipy.org/doc/numpy/reference/generated/numpy.linalg.eig.html
    eigenvalues, eigenvectors = np.linalg.eig(X_covariance)
    X_project = -(eigenvectors.T.dot(X_center.T).T)

    # calculate explainable ratio of each pricipal components
    explainable_ratio_list = []
    for i in range(eigenvalues.shape[0]):
        eigenvalues_totals = np.sum(eigenvalues)
        ratio = eigenvalues[i] / eigenvalues_totals
        explainable_ratio_list.append(ratio)

    # calculate how many principal components needed to explain 50, 60, 70, 80, 90% of total variance
    total_explainable_ratio = 0
    total_explainable_ratio_list = []
    culmulative_explainable_ratio_list = []
    components_needed_list = []
    for i, j in enumerate(explainable_ratio_list):
        total_explainable_ratio += j
        total_explainable_ratio_list.append(total_explainable_ratio)
        culmulative_explainable_ratio_list.append(np.sum(explainable_ratio_list[(i):]))

    total_explainable_ratio = 0
    for i, j in enumerate(explainable_ratio_list):
        total_explainable_ratio += j
        if total_explainable_ratio >= 0.9:
            if len(components_needed_list) < 5:
                components_needed_list.append(i + 1)
                print('90%:', str(i + 1), 'pricipal components needed.')
            break
        elif total_explainable_ratio >= 0.8:
            if len(components_needed_list) < 4:
                components_needed_list.append(i + 1)
                print('80%:', str(i + 1), 'pricipal components needed.')
        elif total_explainable_ratio >= 0.7:
            if len(components_needed_list) < 3:
                components_needed_list.append(i + 1)
                print('70%:', str(i + 1), 'pricipal components needed.')
        elif total_explainable_ratio >= 0.6:
            if len(components_needed_list) < 2:
                components_needed_list.append(i + 1)
                print('60%:', str(i + 1), 'pricipal components needed.')
        elif total_explainable_ratio >= 0.5:
            if len(components_needed_list) < 1:
                components_needed_list.append(i + 1)
                print('50%:', str(i + 1), 'pricipal components needed.')

    # Plot the scree plot
    if len(explainable_ratio_list) <= 15:
        x_list = ['PC' + str(i) for i in range(1, len(explainable_ratio_list) + 1)]
        plt.plot(total_explainable_ratio_list)
        plt.bar(x_list, culmulative_explainable_ratio_list, align='center', alpha=0.5)
    else:
        x_list = ['PC' + str(i) for i in range(1, 16)]
        plt.plot(total_explainable_ratio_list[:15])
        plt.bar(x_list, culmulative_explainable_ratio_list[:15], align='center', alpha=0.5)
    plt.xticks(rotation=90)
    plt.show()

    return eigenvalues, eigenvectors, X_project


if __name__ == '__main__':
    X = np.array([[1, 1], [0, 1], [-1, 0], [3, 3], [4, 3], [5, 4]])
    # eigenvalues, eigenvectors, X_project = PCA_decomposition(X, True)
    eigenvalues, eigenvectors, X_project = PCA_decomposition(X, False)
    print(eigenvalues)
    print()
    print(eigenvectors)
    print()
    # print(X_project)