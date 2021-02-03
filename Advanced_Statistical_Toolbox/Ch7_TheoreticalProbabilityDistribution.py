import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy.stats
import sys


# 7.1 Probability Distribution
def count_calculate_prob(data):
    print("# Only accept data with two columns")
    print("# Column 1 should be category(number), while second columns is the count.")
    for i, j in enumerate(data.iloc[:, 0]):
        if type(j) != np.int:
            if type(j) != np.float:
                print('# All the categorical value in first column should be numeric, program terminated.')
                sys.exit(0)
    if len(data.columns) != 2:
        print('# The length of the columns is not correct, program terminated.')
        sys.exit(0)
    else:
        for i, j in enumerate(data.iloc[:, 1]):
            if j < 0:
                print("# Containing minus value within data, program terminated.")
                sys.exit(0)
        total_sample = np.sum(data.iloc[:, 1])
        data.loc[:, 'Probability(X=x)'] = data.iloc[:, 1] / total_sample
        # Calculate population mean
        population_mean = 0
        for i, j in enumerate(data.iloc[:, 0].tolist()):
            population_mean = population_mean + (j * data.iloc[i, 2])
        print('# The population mean is', population_mean)
        # Calculate population variance
        population_variance = 0
        for i, j in enumerate(data.iloc[:,0].tolist()):
            population_variance = population_variance + (((j - population_mean) ** 2) * data.iloc[i, 2])
        population_variance = population_variance / total_sample
        print('# The population variance is', population_variance)
        # Graph bar chart
        plt.bar(data.iloc[:, 0], data.iloc[:, 2])
        plt.title("Probability Distribution of Samples")
        plt.show()
    return data


# 7.2 Binomial Experiment
def get_binomial_prob(data):
    print("# Only accept data with 1 column and binary value (0, 1)")
    total_sample = len(data.iloc[:, 0])
    probability_zero = 0
    probability_one = 0
    for i, j in enumerate(data.iloc[:, 0]):
        if j == 0:
            probability_one = probability_zero + 1
        elif j == 1:
            probability_one = probability_one + 1
        else:
            print("# Unacceptable data, program terminated.")
            sys.exit(0)
    probability_zero = probability_zero / total_sample
    probability_one = probability_one / total_sample
    population_mean = total_sample * probability_one
    population_variance = total_sample * probability_one * probability_zero
    population_std = np.sqrt(population_variance)
    print('# Probability zero (q) is', probability_zero)
    print('# Probability one (p) is', probability_one)
    print('# Population Mean is', population_mean)
    print('# Population Variance is', population_variance)
    print('# Population Standard Deviation is', population_std)
    return probability_zero, probability_one, population_mean, population_variance, population_std


# 7.3 The Poisson Distribution
def get_poisson_prob(actual, mean):
    # pmf for n poisson prob; cdf for 0~n poisson prob
    poisson = scipy.stats.distributions.poisson
    # prob of n
    prob_n = np.around(poisson.pmf(actual, mean), decimals=4)
    print('# The probability of', actual, 'within interval is', prob_n)
    # prob of n at most
    prob_n_atmost = np.around(poisson.cdf(actual, mean), decimals=4)
    print('# The probability of at most', actual, 'within interval is', prob_n_atmost)
    # prob of more than n
    prob_n_more = np.around((1 - poisson.cdf(actual, mean)), decimals=4)
    print('# The probability of more than', actual, ' within interval is', prob_n_more)
    print()
    return prob_n, prob_n_atmost, prob_n_more


# 7.4 The normal distribution
def get_normal_prob_less(number, mean, std):
    # https://stackoverflow.com/questions/12412895/calculate-probability-in-normal-distribution-given-mean-std-in-python/48433235#48433235
    # where loc is the mean and scale is the std dev
    # To find the probability that the variable has a value LESS than or equal
    prob = scipy.stats.norm.cdf(number, mean, std)
    prob = np.around(prob, decimals=4)
    print('# [Normal Distribution] The prob to be LESS than', number, 'is', prob, 'with mean=', mean, 'and std=', std)
    return prob


def get_normal_prob_greater(number, mean, std):
    # https://stackoverflow.com/questions/12412895/calculate-probability-in-normal-distribution-given-mean-std-in-python/48433235#48433235
    # where loc is the mean and scale is the std dev
    # To find the probability that the variable has a value GREATER than or equal
    prob = scipy.stats.norm.sf(number, mean, std)
    prob = np.around(prob, decimals=4)
    print('# [Normal Distribution] The prob to be GREATER than', number, 'is', prob, 'with mean=', mean, 'and std=', std)
    return prob


def get_normal_boundary(prob, mean, std):
    # https://stackoverflow.com/questions/12412895/calculate-probability-in-normal-distribution-given-mean-std-in-python/48433235#48433235
    # where loc is the mean and scale is the std dev
    # To find the probability that the variable has a value GREATER than or equal
    boundary_value = scipy.stats.norm.ppf(prob, mean, std)
    boundary_value = np.around(boundary_value, decimals=4)
    print('# [Normal Distribution] The range would be', boundary_value, 'for', prob, 'with mean=', mean, 'and std=',
          std, '(Could need to be doubled)')
    return boundary_value


if __name__ == '__main__':
    '''
    test_data = pd.DataFrame({
        'column_name': [1, 2, 3, 4, 5],
        'count': [1, 1, 1, 1, 3]
    })
    '''
    # test_data_with_prob = count_calculate_prob(test_data)
    # print(test_data_with_prob)
    # get_poisson_prob(0, 2.75)
    # get_poisson_prob(4, 2.75)
    # get_poisson_prob(5, 2.75)
    # get_normal_prob_less(113, 100, 12)
    # get_normal_prob_greater(125, 100, 12)
    # test_data = pd.DataFrame({
    #    'Whatever': [1, 0, 1, 0, 1, 0]
    # })
    # get_normal_prob_greater(230, 211, 46)
    # get_normal_boundary(0.975, 211, 46)
    # print(211 - (get_normal_boundary(0.975, 211, 46) - 211))
