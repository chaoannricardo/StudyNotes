import os
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# Read Files========================================================
df = pd.read_csv('gapminder.csv')

# 欄位資料分佈========================================================
data['Column Name'].describe()
data['Column Name'].info()

# Corrcoef
np.corrcoef(x, y)
app_train.corr()['TARGET']
app_train['DAYS_BIRTH'].corr(app_train['TARGET'])

# Median
np.median(data[~data['Column Name'].isnull()]['Column Name'])

# 計算Z-Value
app_train['AMT_INCOME_TOTAL_Z_BY_CHILDREN_GRP-TARGET'] = grouped_df.apply(lambda x: (x-np.mean(x))/np.std(x))

# pandas排序
import pandas as pd
import numpy as np
app_train_corr.sort_values(ascending=False)
np.sort(age_data['YEARS_BINNED'].unique())

# 計算眾數 (mode)
from scipy.stats import mode
import time
start_time = time.time()
mode_get = mode(data[~data['Column Name'].isnull()]['Column Name'])
print(mode_get)
print("Elapsed time: %.3f secs" % (time.time() - start_time))
# 計算眾數 (mode)
# 較快速的方式
from collections import defaultdict
start_time = time.time()
mode_dict = defaultdict(lambda:0)
for value in data[~data['Column Name'].isnull()]['Column Name']:
    mode_dict[value] += 1 
mode_get = sorted(mode_dict.items(), key=lambda kv: kv[1], reverse=True)
print(mode_get[0])
print("Elapsed time: %.3f secs" % (time.time() - start_time))

# show 0,25,50,75,100% of Data==============================================
np.percentile(data, 50)
## 如果欄位中有 NA, describe 會有問題
data['Column Name'].describe()
# Ignore NA, 計算五值
five_num = [0, 25, 50, 75, 100]
quantile_5s = [np.percentile(data[~data['Column Name'].isnull()]['Column Name'], q = i) for i in five_num]
print(quantile_5s)
data[~data['Column Name'].isnull()]['Column Name'].hist(bins = 100)
plt.show()
# 計算 q0 - q100
q_all = [data[~data['Column Name'].isnull()]['Column Name'].isnull()]['Column Name'], q = i) for i in range(101)]
# 試著將 max 取代為 q99
data[data['Column Name'] == data['Column Name'].max()] = np.percentile(data[~data['Column Name'].isnull()]['Column Name'], q = 99)
# 將 NAs 以 q50 填補
print("Before replace NAs, numbers of row that AMT_ANNUITY is NAs: %i" % sum(app_train['AMT_ANNUITY'].isnull()))
q_50 = [np.percentile(app_train[~app_train['AMT_ANNUITY'].isnull()]['AMT_ANNUITY'], 50)]
app_train.loc[app_train['AMT_ANNUITY'].isnull(),'AMT_ANNUITY'] = q_50
print("After replace NAs, numbers of row that AMT_ANNUITY is NAs: %i" % sum(app_train['AMT_ANNUITY'].isnull()))


# 欄位處理=============================================================
# pandas.cut===================================
# 特定級距分割
cut_rule = [-np.inf, 0, 2, 5, np.inf]
# 平均級距分割
cut_rule = np.linspace(20,70, num=11)
# 分割
app_train['CNT_CHILDREN_GROUP'] = pd.cut(app_train['CNT_CHILDREN'].values, cut_rule, include_lowest=True)
app_train['CNT_CHILDREN_GROUP'].value_counts()
# 等寬劃分
ages["equal_width_age"] = pd.cut(ages["age"], 4)
# 等頻劃分
ages["equal_freq_age"] = pd.qcut(ages["age"], 4)


# Group========================================
grp = ['CNT_CHILDREN_GROUP','TARGET']
grouped_df = app_train.groupby(grp)['AMT_INCOME_TOTAL']

# 連續值標準化 ========================================================
data['Column Name'].hist(bins = 50)
plt.title("Original")
plt.show()
value = data['Column Name'].values
data['Column Name Norm1'] = ( value - np.mean(value) ) / ( np.std(value) )
data['Column Name Norm1'] .hist(bins = 50)
plt.title("Normalized with Z-transform")
plt.show()
data['Column Name Norm2'] = ( value - min(value) ) / ( max(value) - min(value) )
data['Column Name Norm2'].hist(bins = 50)
plt.title("Normalized to 0 ~ 1")
plt.show()

# Encoding ================================================================
# One Hot encoding
sub_data = pd.DataFrame(data['Column Name'])
sub_data = pd.get_dummies(sub_data)

# 將只有兩種值的類別型欄位, 做 Label Encoder, 計算相關係數時讓這些欄位可以被包含在內
from sklearn.preprocessing import LabelEncoder
le = LabelEncoder()
# 檢查每一個 column
for col in app_train:
    if app_train[col].dtype == 'object':
        # 如果只有兩種值的類別型欄位
        if len(list(app_train[col].unique())) <= 2:
            # 就做 Label Encoder, 以加入相關係數檢查
            app_train[col] = le.fit_transform(app_train[col])            
print(app_train.shape)
app_train.head()

# Deal With Outliers========================================================
# Filter Specific Columns
dtype_select = ['float','int']
numeric_columns = list(app_train.columns[list(app_train.dtypes.isin(dtype_select))])
# 再把只有 2 值 (通常是 0,1) 的欄位去掉
numeric_columns = list(app_train[numeric_columns].columns[list(app_train[numeric_columns].apply(lambda x:len(x.unique())!=2 ))])
print("Numbers of remain columns " + str(len(numeric_columns)))
# 檢視這些欄位的數值範圍
for col in numeric_columns:
    app_train.boxplot(col)
    plt.show()

# Plot ECDF ===================================================================
cdf = data.column.value_counts().sort_index().cumsum()
plt.plot(list(cdf.index), cdf/cdf.max())
plt.xlabel('Value')
plt.ylabel('ECDF')
plt.xlim([cdf.index.min(), cdf.index.max() * 1.05]) # 限制顯示圖片的範圍
plt.ylim([-0.05,1.05]) # 限制顯示圖片的範圍
plt.show()
# 改變 y 軸的 Scale, 讓我們可以正常檢視 ECDF
plt.plot(np.log(list(cdf.index)), cdf/cdf.max())
plt.xlabel('Value (log-scale)')
plt.ylabel('ECDF')
plt.ylim([-0.05,1.05]) # 限制顯示圖片的範圍
plt.show()

# Plot KDE =====================================================================
# 繪圖前先排序 / 分組
year_group_sorted = np.sort(age_data['YEARS_BINNED'].unique())
plt.figure(figsize=(8,6))
for i in range(len(year_group_sorted)):
    sns.distplot(age_data.loc[(age_data['YEARS_BINNED'] == year_group_sorted[i]) & \
                              (age_data['TARGET'] == 0), 'YEARS_BIRTH'], label = str(year_group_sorted[i]))
    sns.distplot(age_data.loc[(age_data['YEARS_BINNED'] == year_group_sorted[i]) & \
                              (age_data['TARGET'] == 1), 'YEARS_BIRTH'], label = str(year_group_sorted[i]))
plt.title('KDE with Age groups')
plt.show()












