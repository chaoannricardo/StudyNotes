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
    #
    X_project = eigenvectors.T.dot(X_center.T).T
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