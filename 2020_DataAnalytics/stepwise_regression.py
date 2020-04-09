import datetime
import numpy as np
import pandas as pd
import statsmodels.api as sm


def stepwise_selection(X, y, initial_list=[], threshold_in=0.01, threshold_out=0.05, verbose=True):
    """ Perform a forward-backward feature selection
    Reference: # https://www.twblogs.net/a/5c13a86fbd9eee5e40bb7431
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
    """
    included = list(initial_list)

    while True:
        changed = False
        # forward step
        excluded = list(set(X.columns) - set(included))
        new_pval = pd.Series(index=excluded)
        for new_column in excluded:
            model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[included + [new_column]]))).fit()
            new_pval[new_column] = model.pvalues[new_column]
        best_pval = new_pval.min()
        if best_pval < threshold_in:
            best_feature = new_pval.argmin()
            included.append(best_feature)
            changed = True
            if verbose:
                print('Add  {:30} with p-value {:.6}'.format(best_feature, best_pval))

            # backward step
            model = sm.OLS(y, sm.add_constant(pd.DataFrame(X[included]))).fit()
            print('R_square = ', model.rsquared)
            # use all coefs except intercept
            pvalues = model.pvalues.iloc[1:]
            worst_pval = pvalues.max()  # null if pvalues is empty
            if worst_pval > threshold_out:
                changed = True
                worst_feature = pvalues.argmax()
                included.remove(worst_feature)
                if verbose:
                    print('Drop {:30} with p-value {:.6}'.format(worst_feature, worst_pval))
            if not changed:
                break
    return included


if __name__ == '__main__':
    # prepare the data
    ORL_data = pd.read_csv('./data/ORL_data.csv')
    # divide into X and y
    X = ORL_data.iloc[:, :-1]
    y = ORL_data.iloc[:, -1].tolist()
    # document time now
    start = datetime.datetime.now()
    result = stepwise_selection(X, y)
    print('resulting features:')
    print(result)
    end = datetime.datetime.now()
    print("")
    print("執行時間：", end - start)
