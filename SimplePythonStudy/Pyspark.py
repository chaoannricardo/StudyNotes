# Pyspark DataFrame

from pyspark.sql import SparkSession
# local mode
spark = SparkSession\
        .builder\
        .appName("demo")\
        .getOrCreate()

df = spark.read.csv("file:///C:/Users/richi/DataScience/notebook/data/data2.csv", header=True, inferSchema=True)
