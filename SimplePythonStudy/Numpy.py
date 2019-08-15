# Numpy Intro

# Basics ==========================================================
ar1 = np.array([0,1,2,3]) # 1 dimensional array
ar2=np.array([[0,3,5],[2,8,7]]) # 2D array
# args - start element,end element, number of elements
#ar5=np.linspace(0,2.0/3,4); ar5
import numpy as np
ar5=np.linspace(0,2.0/3,4); ar5
# Produces 2x3x2 array of 1's.
import numpy as np
ar7=np.ones((2,3,2)); ar7
# Reverse array using ::-1 idiom
import numpy as np
ar=np.arange(5); ar[::-1]
# Use np.copy to force a copy
ar=np.arange(8); ar
arc=ar[:3].copy(); arc
# Array multiplication is element wise
ar=np.array([[1,1],[1,1]]); ar
ar2=np.array([[2,2],[2,2]]); ar2
ar.dot(ar2)
ar*ar2
# NumPy arrays can be transposed
ar=np.array([[1,2,3],[4,5,6]]); ar
ar.T
np.transpose(ar)
# Reduction; Specify whether the reduction operator to be applied row-wise or column-wise
ar=np.array([np.arange(1,6),np.arange(1,6)]); ar
ar.prod() # 1*2*3*4*5*1*2*3*4*5
np.prod(ar,axis=0) # 1*1,2*2,3*3,........
np.prod(ar,axis=1) # 1*2*3*4*5; 1*2*3*4*5
# Any & All
np.any((ar%7)==0)
np.all(ar<11)
# Broadcasting
ar=np.ones([3,2]); ar
ar2=np.array([2,3]); ar2
ar+ar2

# Random ==========================================================
# Using the rand, randn functions
# rand(m) produces uniformly distributed random numbers with range 0 to m
import numpy as np
np.random.seed(200) # Set seed
ar11=np.random.rand(3); ar11
# randn(m) produces m normally distributed (Gaussian) random numbers
ar12=np.random.randn(5); ar12
# 用 numpy 建立一個 10 x 10, 數值分布自 -1.0 ~ 1.0 的矩陣
import numpy as np
(np.random.random((10,10)) - 0.5) * 2
# Random 常態分佈矩陣
import numpy as np
nrow = 1000; ncol = 3
np.random.randn(nrow * ncol).reshape((nrow, ncol))
#
data = np.random.normal(mean, std,(num_samples, ))






