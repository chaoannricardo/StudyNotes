# MSE(yp:y_predicted)
def mean_squared_error(y, yp):
    mse = MSE = sum((y - yp)**2) / len(y)
    return mse

MSE = mean_squared_error(y, y_hat)
print("The Mean squared error is %.3f" % (MSE))

# MAE
def mean_absolute_error(y, yp):
    mae = MAE = sum(abs(y - yp)) / len(y)
    return mae

MAE = mean_absolute_error(y, y_hat)
print("The Mean absolute error is %.3f" % (MAE))