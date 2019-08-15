# Graphs
import matplotlib.pyplot as plt
import matplotlib as mpl
%matplotlib inline # 圖片嵌入筆記本
plt.figure(figsize = (8, 6)) # 更改圖片大小
plt.axis('tight'); # 'equal'
plt.legend(lines[:2], ['first', 'second'], loc='upper right');
plt.xlabel('Number of Neighbors')
plt.ylabel('Accuracy')
plt.title('k-NN: Varying Number of Neighbors')

# Seaborn's Heatmap Function=======================================
import seaborn as sns; sns.set()
sns.heatmap(df.corr(), square=True, cmap='RdYlGn')
# ---------------------------------------
sns.heatmap(ext_data_corrs, cmap = plt.cm.RdYlBu_r, vmin = -0.25, annot = True, vmax = 0.6)

# Line plot==========================================
import matplotlib.pyplot as plt
plt.plot(neighbors, test_accuracy, label = 'Testing Accuracy', , color='blue')
plt.show()

# Box Plot======================================================
import matplotlib.pyplot as plt
plt_column = ['AMT_INCOME_TOTAL']
plt_by = ['CNT_CHILDREN_GROUP','TARGET']
app_train.boxplot(column=plt_column, by = plt_by, showfliers = False, figsize=(12,12))
plt.show()

# Scatter Plot ============================================================
# "Plot" is more efficient than "Scatter"
import matplotlib.pyplot as plt
# Method 1
plt.plot(x, y, 'o', color='black'); # 'ok'
#
plt.plot(x, y, '-p', color='gray',
         markersize=15, linewidth=4,
         markerfacecolor='white',
         markeredgecolor='gray',
         markeredgewidth=2)
plt.ylim(-1.2, 1.2);
# Method 2
plt.scatter(x, y, marker='o', color='black');
#
colors = rng.rand(100)
sizes = 1000 * rng.rand(100)
plt.scatter(x, y, c=colors, s=sizes, alpha=0.3,
            cmap='viridis')
plt.colorbar();  # show color scale

# Bar Plot ==================================================================
# Matplotlib
from matplotlib import *
import matplotlib.pyplot as plt
plt.bar(range(len(age_groups.index)), age_groups['TARGET'])
plt.xticks(range(len(age_groups.index)), age_groups.index, rotation = 75); 
# Seaborn
import seaborn as sns
px = age_data['YEARS_BINNED']
py = age_data['TARGET']
sns.barplot(px, py)

# Histogram ==================================================================
import matplotlib.pyplot as plt
plt.hist(data, bins=30, density=True, alpha=0.5,
         histtype='stepfilled', color='steelblue',
         edgecolor='none');
# 重疊
kwargs = dict(histtype='stepfilled', alpha=0.3, normed=True, bins=40)
plt.hist(x1, **kwargs); plt.hist(x2, **kwargs); plt.hist(x3, **kwargs);
# Two-Dimensional Histograms and Binnings
mean = [0, 0]; cov = [[1, 1], [1, 2]]; x, y = np.random.multivariate_normal(mean, cov, 10000).T
plt.hist2d(x, y, bins=30, cmap='Blues')
cb = plt.colorbar(label='count in bin')

# SubPlot =====================================================================
# 使用不同的 HOUSETYPE_MODE 類別繪製圖形, 並使用 subplot 排版
unique_house_type = app_train['HOUSETYPE_MODE'].unique()
nrows = len(unique_house_type)
ncols = nrows // 2
plt.figure(figsize=(10,30))
for i in range(len(unique_house_type)):
    plt.subplot(nrows, ncols, i+1)
    app_train.loc[ app_train['HOUSETYPE_MODE'] == unique_house_type[i],'AMT_CREDIT' ].hist()
    plt.title(str(unique_house_type[i]))
plt.show()   

# KDE Plot ===================================================================
plt.figure(figsize = (24, 8))
for i, source in enumerate(['EXT_SOURCE_1', 'EXT_SOURCE_2', 'EXT_SOURCE_3']):
    plt.subplot(1, 3, i + 1)
    sns.kdeplot(app_train.loc[app_train['TARGET'] == 0, source], label = 'target == 0')
    sns.kdeplot(app_train.loc[app_train['TARGET'] == 1, source], label = 'target == 1')
    plt.title('Distribution of %s by Target Value' % source)
    plt.xlabel('%s' % source); plt.ylabel('Density');
plt.tight_layout(h_pad = 2.5) 

# Change plotting theme =======================================
# Theme ==========================
plt.style.use('seaborn-whitegrid') # 'default', 'ggplot', 'seaborn'
# Color
plt.plot(x, np.sin(x - 0), color='blue')        # specify color by name
plt.plot(x, np.sin(x - 1), color='g')           # short color code (rgbcmyk)
plt.plot(x, np.sin(x - 2), color='0.75')        # Grayscale between 0 and 1
plt.plot(x, np.sin(x - 3), color='#FFDD44')     # Hex code (RRGGBB from 00 to FF)
plt.plot(x, np.sin(x - 4), color=(1.0,0.2,0.3)) # RGB tuple, values 0 to 1
plt.plot(x, np.sin(x - 5), color='chartreuse'); # all HTML color names supported
# Line Style ==========================
plt.plot(x, x + 0, linestyle='solid')
plt.plot(x, x + 1, linestyle='dashed')
plt.plot(x, x + 2, linestyle='dashdot')
plt.plot(x, x + 3, linestyle='dotted');
# For short, you can use the following codes: ==========================
plt.plot(x, x + 4, linestyle='-')  # solid
plt.plot(x, x + 5, linestyle='--') # dashed
plt.plot(x, x + 6, linestyle='-.') # dashdot
plt.plot(x, x + 7, linestyle=':');  # dotted
# Mixed =======================================
plt.plot(x, x + 0, '-g')  # solid green
plt.plot(x, x + 1, '--c') # dashed cyan
plt.plot(x, x + 2, '-.k') # dashdot black
plt.plot(x, x + 3, ':r');  # dotted red




















