import numpy as np
import pandas as pd
import matplotlib as plt


def sensitivity(DP_TP, DP_TN, DA_TP, DA_TN):
    value = np.around((DP_TP / (DP_TN + DP_TP)), decimals=4)
    print('Sensitivity is', value)
    return value


def specificity(DP_TP, DP_TN, DA_TP, DA_TN):
    value = np.around((DA_TN / (DA_TN + DA_TP)), decimals=4)
    print('Specificity is ', value)
    return value


def predictive_value_positive(sensitivity, specificity, prevalence):
    value = np.around(((sensitivity * prevalence) / (sensitivity * prevalence + (1 - specificity) * (1 - prevalence))),
                      decimals=4)
    print('Predictive value positive is', value)
    return value


def predictive_value_negative(sensitivity, specificity, prevalence):
    value = np.around(((specificity * (1 - prevalence)) / (specificity * (1 - prevalence) +
                       (1 - sensitivity) * prevalence)),
                      decimals=4)
    print('Predictive value negative is', value)
    return value


def prob_false_negative(sensitivity):
    value = 1 - sensitivity
    value = np.around(value, decimals=4)
    print('Probability of false negative is', value)
    return value


def prob_false_positive(specificity):
    value = 1 - specificity
    value = np.around(value, decimals=4)
    print('Probability of false positive is', value)
    return value


def odd_ratio(exposed_cases, exposed_noncases, unexposed_cases, unexposed_noncases):
    value = (exposed_cases * unexposed_noncases) / (exposed_noncases * unexposed_cases)
    value = np.around(value, decimals=4)
    print('Odd ratio is', value)
    return value


if __name__ == '__main__':
    print()
    #DP_TP = 302
    #DP_TN = 179
    #DA_TP = 80
    #DA_TN = 372
    #sens = sensitivity(DP_TP, DP_TN, DA_TP, DA_TN)
    #spec = specificity(DP_TP, DP_TN, DA_TP, DA_TN)
    #sens = 0.85
    #spec = 0.80
    #prevalence = 0.0025
    #prob_false_negative(sens)
    #prob_false_positive(spec)
    #predictive_value_positive(sens, spec, prevalence)
    #predictive_value_positive(sens, spec, prevalence)
    #predictive_value_negative(sens, spec, prevalence)

