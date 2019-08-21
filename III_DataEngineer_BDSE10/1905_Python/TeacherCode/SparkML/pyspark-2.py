# -*- coding: utf-8 -*-
"""
Created on Tue Jan 22 10:46:30 2019

@author: HanBarry
"""
import matplotlib as mpl
mpl.rcParams.update({'font.size': 15,
                     'figure.figsize': [15,10] 
                    })
import matplotlib.pyplot as plt
from pyspark.sql import SparkSession
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.regression import GBTRegressor
from pyspark.ml.evaluation import RegressionEvaluator
from pyspark.ml.tuning import ParamGridBuilder, CrossValidator 
from pyspark.ml.feature import StringIndexer
import pyspark.sql.functions as F

#開啟一個SparkSession
spark = SparkSession \
        .builder.appName('sql') \
        .config("spark.driver.memory","5g") \
        .getOrCreate()

data = spark.read.csv(".\\dataset\\ship.csv",inferSchema=True,header=True)

##Features Interaction (numerical)
data = data.withColumn('area',data['passengers']/data['passenger_density'])
data = data.withColumn('Tonnage/length',data['Tonnage']/data['length'])

##Features Interaction (numerical + categorical)
grouped_data = data.groupBy('Cruise_line').agg(F.mean('cabins').alias('cabins_mean'))
data = data.join(grouped_data,['Cruise_line'],'left')
data = data.withColumn('cabins_mean_diff',data['cabins'] - data['cabins_mean'])

#Label Encoding
indexer = StringIndexer(inputCol='Cruise_line',outputCol='Cruise_line_idx')
data = indexer.fit(data).transform(data)


assembler = VectorAssembler(inputCols = [
 'Age',
 'Tonnage',
 'passengers',
 'length',
 'cabins',
 'passenger_density',
 'area',
 'Tonnage/length',
 'cabins_mean_diff',
 'Cruise_line_idx'], outputCol='features')

data = assembler.transform(data)

gbtr = GBTRegressor(labelCol="crew", featuresCol="features")


paramGrid = ParamGridBuilder().build()
     
evaluator = RegressionEvaluator(labelCol="crew",metricName="rmse")

cv = CrossValidator (estimator=gbtr,
                           estimatorParamMaps=paramGrid,
                           evaluator=evaluator,
                           numFolds=5)

(trainX , validation)= data.randomSplit([0.7,0.3])

model = cv.fit(trainX)

results = model.transform(validation).select("Ship_name","crew", "prediction")
rmse = evaluator.evaluate(results)

results_pd = results.select('crew','prediction').toPandas()


plt.scatter(results_pd['prediction'],results_pd['crew'],c='b',s=50)
plt.plot(range(1,14),range(1,14),c='r')
