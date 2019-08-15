# Pandas

# Basics ==================================================================
pd.Series({2:'a', 1:'b', 3:'c'})
data = pd.Series([0.25, 0.5, 0.75, 1.0])
data.values
data.keys()
# Series as one-dimensional array
data['a':'c'] # slicing by explicit index
data[(data > 0.3) & (data < 0.8)] # masking
data[['a', 'e']] # fancy indexing
# the ``loc`` attribute allows indexing and slicing that always references the explicit index:
data.loc[1:3]
# The iloc attribute allows indexing and slicing that always references the implicit Python-style index:
data.iloc[1:3]
# combine masking and fancy indexing as in the following:
data.loc[data.density > 100, ['pop', 'density']]
# explicit specification of the fill value for any elements in A or B that might be missing:
A.add(B, fill_value=0)
# Random
rng = np.random.RandomState(42)
ser = pd.Series(rng.rand(5))

# 攤平 & Missing Value 處理 =======================================================
# Check Whether There is Null Value
data.isnull().values.any()
# 攤平：可應用於算平均值等時機
A.stack()
# 利用Stack算出平均值用以填補NAN值
fill = A.stack().mean()
A.add(B, fill_value=fill)
# Detecting null values
data.isnull().values.any()
# Dropping null values For a Series
data[data.notnull()]
data.dropna()
# Dropping null values for a DataFrame
df.dropna()
df.dropna(axis='columns')
df.dropna(axis='columns', how='all') # 甚麼情況時drop掉
df.dropna(axis='rows', thresh=3) # 臨界值

# Fill NA ====================================
data.fillna(0)
# specify a forward-fill to propagate the previous value forward:
# forward-fill
data.fillna(method='ffill')
# Or we can specify a back-fill to propagate the next values backward:
# back-fill
data.fillna(method='bfill')
# DataFrame
df.fillna(method='ffill', axis=1)
df.fillna(method='ffill')

# DataFrame ===============================================================
population_dict = {'California': 38332521, 'Texas': 26448193, 'New York': 19651127, 'Florida': 19552860, 'Illinois': 12882135}
population = pd.Series(population_dict)
pd.DataFrame(population, columns=['population'])

# Group ===================================================================
# Examples
planets.groupby('method')['orbital_period'].median()
planets.groupby('method')['year'].describe()



















