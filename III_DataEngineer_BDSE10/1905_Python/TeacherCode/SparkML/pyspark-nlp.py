# -*- coding: utf-8 -*-
"""
Created on Thu Jan 17 09:07:19 2019

@author: HanBarry
"""

from pyspark.sql import SparkSession
from pyspark.sql.functions import lit
from pyspark.sql.functions import col,regexp_replace,substring,length,expr
from pyspark.ml.feature import Tokenizer
from pyspark.ml.feature import StopWordsRemover
from pyspark.ml.feature import NGram
from pyspark.ml.feature import HashingTF, IDF
from pyspark.ml.feature import VectorAssembler
from pyspark.ml.classification import LogisticRegression
from pyspark.ml.evaluation import MulticlassClassificationEvaluator
from pyspark.ml.tuning import ParamGridBuilder, CrossValidator 
from pyspark.ml import Pipeline


#開啟一個SparkSession
spark = SparkSession \
        .builder.appName('sql') \
        .config("spark.driver.memory","5g") \
        .getOrCreate()

#讀取Training及Testing資料為Spark dataframe
#Data Cleaning 較為繁瑣，僅供參考
training = spark.read.text('.\\dataset\\quora-train.csv')
training = training.withColumn('value2', regexp_replace('value', '[,"]', ''))
training = training.withColumn('qid',substring('value2', 1, 20))
training = training.withColumn('target_str',substring('value2', -1, 1))
training = training.withColumn('question_text',expr("substring(value2, 21, length(value2) - 21)"))
training = training.filter((training['target_str'] == '0') | (training['target_str'] == '1'))
training = training.withColumn("target", training["target_str"].cast("int"))
training = training.select('qid','question_text','target')

testing = spark.read.text('.\\dataset\\quora-test.csv')
testing = testing.withColumn('value2', regexp_replace('value', '[,"]', ''))
testing = testing.withColumn('qid',substring('value2', 1, 20))
testing = testing.withColumn('question_text',expr("substring(value2, 21, length(value2) - 20)"))
testing = testing.withColumn("target", lit(None))
testing = testing.where(length(col('qid')) == 20)

testing = testing.select('qid','question_text','target')
training = training.select('qid','question_text','target')
data = training.union(testing)


tokenizer = Tokenizer(inputCol="question_text", outputCol="question_token")

remover = StopWordsRemover(inputCol="question_token", 
                           outputCol="question_filtered")

ngram = NGram(n=3, inputCol="question_filtered", outputCol="question_3gram")

hashingTF = HashingTF(inputCol="question_3gram", outputCol="question_tf", 
                      numFeatures=20)

idf = IDF(inputCol="question_tf", outputCol="question_tfidf")

data = data.withColumn('length',length(data['question_text']))

#選取建模需要的所有特徵，做成一個向量


assembler = VectorAssembler(inputCols = [
 'question_tfidf',
 'length'], outputCol='features')

lgr = LogisticRegression(labelCol="target", featuresCol="features"
                         ,maxIter=100)

pipeline = Pipeline(stages=[tokenizer,remover,ngram,hashingTF,idf,
                            assembler,lgr])


paramGrid = ParamGridBuilder().build()
     
evaluator = MulticlassClassificationEvaluator(labelCol="target",
                                              metricName='f1')
cv = CrossValidator (estimator=pipeline,
                           estimatorParamMaps=paramGrid,
                           evaluator=evaluator,
                           numFolds=5)
train = data.filter(data['target'].isNotNull())
(trainX , validation)= train.randomSplit([0.7,0.3])
test = data.filter(data['target'].isNull())
model = cv.fit(trainX)
results = model.transform(validation).select("qid","target", "prediction")
f1 = evaluator.evaluate(results)

### f1 = 0.90 ????




