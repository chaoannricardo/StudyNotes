from sklearn.datasets import load_boston
import pandas as pd
import numpy as np
import statsmodels.api as sm


def stepwise_selection(X, y,
                       initial_list=[],
                       threshold_in=0.01,
                       threshold_out = 0.05,
                       verbose = True):
    """ Perform a forward-backward feature selection
    based on p-value from statsmodels.api.OLS
    Arguments:
        X - pandas.DataFrame with candidate features
        y - list-like with the target
        initial_list - list of features to start with (column names of X)
        threshold_in - include a feature if its p-value < threshold_in
        threshold_out - exclude a feature if its p-value > threshold_out
        verbose - whether to print the sequence of inclusions and exclusions
    Returns: list of selected features
    Always set threshold_in < threshold_out to avoid infinite looping.
    See https://en.wikipedia.org/wiki/Stepwise_regression for the details
    """
    included = list(initial_list)

    while True:
        changed=False
        # forward step
        excluded = list(set(X.columns)-set(included))
        new_pval = pd.Series(index=excluded)
        for new_column in excluded:
            ############################### Revised by Ricardo ##############################
            list_with_new_column = included + [new_column]
            model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[[j for i,j in enumerate(list_with_new_column)]]))).fit()
#             model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[[str(included[0]), new_column]]))).fit()
            ############################### Revised Ended ##############################
            new_pval[new_column] = model.pvalues[new_column]
        best_pval = new_pval.min()
        if best_pval < threshold_in:
            best_feature = new_pval.argmin()
            ############################### Revised by Ricardo ##############################
            best_feature = X.columns[best_feature]
            ############################### Revised Ended ##############################
            included.append(best_feature)
            changed=True
            if verbose:
                print('Add  {:30} with p-value {:.6}'.format(best_feature, best_pval))

        # backward step
        ############################### Revised by Ricardo ##############################
#         model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[included]))).fit()
        model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[[j for i,j in enumerate(included)]]))).fit()
        ############################### Revised Ended ##############################
        # use all coefs except intercept
        pvalues = model.pvalues.iloc[1:]
        worst_pval = pvalues.max() # null if pvalues is empty
        if worst_pval > threshold_out:
            changed=True
            worst_feature = pvalues.argmax()
            ############################### Revised by Ricardo ##############################
#             print('P-values', pvalues)
#             print('worst=', worst_feature)
#             print('included', included)
#             included.remove(worst_feature)
            included.remove(included[worst_feature])
            if verbose:
#                 print('Drop {:30} with p-value {:.6}'.format(worst_feature, worst_pval))
                print('Drop {:30} with p-value {:.6}'.format(worst_feature, worst_pval))
             ############################### Revised Ended ##############################
        if not changed:
            break
    return included


data = pd.read_csv('./data/ORL_data.csv')
X = data.iloc[:, :-1]
y = data.iloc[:, -1]
result = stepwise_selection(X, y)
print('resulting features:')
print(result)