# Read CSV Data
dir_data = './data'
f_app = os.path.join(dir_data, 'application_train.csv')
data = pd.read_csv(f_app)

# View Data Info of DataFrame
print(app_train.info())

# View Summary of numeric columns of DataFrame
summary = app_train.describe()
print(summary)
print(summary.transpose())


#===================================================================
# 主成分分析(Principal Component Analysis, PCA)
# 1. 標準化d維"數據集"
# 3. 分解"共變異數陣"為"特徵向量"(evgenvector)與"特徵值"(eigenvalues)
# 4. 依照"特徵向量"相應的"特徵值"以遞減方式對進行排序
# 區分"訓練集"和"測試集"，並"標準化"到"單位變異數"

#------------------------------------
# 1. 標準化d維"數據集"
from sklearn.model_selection import train_test_split
# df_wine.iloc[:,1:].values 為除id以外所有的值
X, y = df_wine.iloc[:,1:].values, df_wine.iloc[:,0].values
# df_wine.iloc[:,1:].values 為id
# '\' 為換行繼續
X_train, X_test, y_train, y_test = \
train_test_split(X, y, test_size=0.3, stratify=y, random_state=0)

#Standardize the features
from sklearn.preprocessing import StandardScaler
sc = StandardScaler()
x_train_std = sc.fit_transform(X_train)
X_test_std = sc.transform(X_test)

#------------------------------------
# 2. 建立"共變異數矩陣"(covariance matrix)

#------------------------------------
# 3. 分解"共變異數陣"為"特徵向量"(evgenvector)與"特徵值"(eigenvalues)
import numpy as np

# 對"標準化"後的"訓練數據集"計算"共變異數矩陣"
cov_mat = np.cov(X_train_std.T)

# 使用linalg.eig函數，來完成"特徵分解"(eigendecomposition)
eigen_vals, eigen_vecs = np.linalg.eig(cov_mat)
# eigen_vals
print('\nEigenvalues \n%s' % eigen_vals)
# eigen_vecs
print('\nEigenvectors \n%s' % eigen_vecs)






























