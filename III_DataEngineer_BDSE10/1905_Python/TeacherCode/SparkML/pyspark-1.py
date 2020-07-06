# -*- coding: utf-8 -*-
"""
Created on Tue Jan 15 14:12:12 2019

@author: HanBarry
"""
from pyspark.sql import SparkSession
from pyspark.sql.functions import lit

#開啟一個SparkSession
spark = SparkSession \
        .builder.appName('sql') \
        .getOrCreate()

#讀取Training及Testing資料為Spark dataframe
training = spark.read.csv('.\\dataset\\titanic-train.csv',inferSchema=True,header=True)
testing = spark.read.csv('.\\dataset\\titanic-test.csv',inferSchema=True,header=True)
#由於Testing資料沒有Label Column，必須建一個給他，並且調整欄位順序與Training資料一致
testing = testing.withColumn('Survived',lit(None)).select([
                          'PassengerId',
                          'Survived',
                          'Pclass',
                          'Name',
                          'Sex',
                          'Age',
                          'SibSp',
                          'Parch',
                          'Ticket',
                          'Fare',
                          'Cabin',
                          'Embarked'
                          ])
#合併training及testing
data = training.union(testing)

#Missing Value處理(drop, fill)
data = data.drop('Cabin')

data_age = data.select('Age').dropna()
age_avg = data_age.agg({"Age":"avg"}).collect()[0][0]
data = data.fillna(age_avg, subset=['Age'])

data_age = data.select('Fare').dropna()
age_avg = data_age.agg({"Fare":"avg"}).collect()[0][0]
data = data.fillna(age_avg, subset=['Fare'])

data = data.fillna('NULL', subset=['Embarked'])

#數值型特徵二值化
#from pyspark.ml.feature import Binarizer
from pyspark.ml.feature import QuantileDiscretizer
#binarizer = Binarizer(inputCol='Age',outputCol='AgeBin',threshold=15)
age_discretizer = QuantileDiscretizer(numBuckets=5, inputCol="Age", outputCol="AgeBin")
fare_discretizer = QuantileDiscretizer(numBuckets=5, inputCol="Fare", outputCol="FareBin")

data = age_discretizer.fit(data).transform(data)
data = fare_discretizer.fit(data).transform(data)


#類別型特徵的處理(Label encoding & One-Hot encoding)
from pyspark.ml.feature import StringIndexer

tk_indxer = StringIndexer(inputCol='Ticket',outputCol='TicketIndex')
sex_indxer = StringIndexer(inputCol='Sex',outputCol='SexIndex')
data = tk_indxer.fit(data).transform(data)
data = sex_indxer.fit(data).transform(data)

data.select('Ticket','TicketIndex','Sex','SexIndex').show(5)

from pyspark.ml.feature import StringIndexer,OneHotEncoderEstimator

em_indexer = StringIndexer(inputCol='Embarked',outputCol='EmbarkedIndex')
encoder = OneHotEncoderEstimator(inputCols=['EmbarkedIndex'],
                                 outputCols=['EmbarkedOneHot'])
data = em_indexer.fit(data).transform(data)
data = encoder.fit(data).transform(data)

#數值型特徵標準化(Standardization)
fare_mean = data.agg({"Fare":"mean"}).collect()[0][0]
fare_std = data.agg({"Fare":"stddev"}).collect()[0][0]
data = data.withColumn("FareStd",(data['Fare'] - fare_mean) / fare_std)                  

#由EDA發現新特徵
#邊緣人
from pyspark.sql.functions import when
data = data.withColumn("SibSpParch",
                       when((data['SibSp'] == 0) & (data['Parch'] == 0) ,1 )
                       .otherwise(0))
#貴婦
#data = data.withColumn("PclassSex",
#                       when((data['Sex'] == 'female') & (data['Pclass'] != 3) ,1 )
#                       .otherwise(0)) 

#文字處理 tf-idf
'''
from pyspark.ml.feature import Tokenizer
tokenizer = Tokenizer(inputCol="Name", outputCol="NameTOKENS")
data = tokenizer.transform(data)


from pyspark.ml.feature import StopWordsRemover
remover = StopWordsRemover(inputCol="NameTOKENS", outputCol="NameFiltered")
data = remover.transform(data)

from pyspark.ml.feature import NGram
ngram = NGram(n=2, inputCol="NameFiltered", outputCol="Name2gram")
data = ngram.transform(data)

from pyspark.ml.feature import HashingTF, IDF
hashingTF = HashingTF(inputCol="Name2gram", outputCol="NameTF", numFeatures=20)
idf = IDF(inputCol="NameTF", outputCol="NameTFIDF")
data = hashingTF.transform(data)
data = idf.fit(data).transform(data)
'''


#選取建模需要的所有特徵，做成一個向量
from pyspark.ml.feature import VectorAssembler

assembler = VectorAssembler(inputCols = [
 'Pclass',
# 'NameTFIDF',
# 'PclassSex',
 'Age',
 'AgeBin',
 'SibSp',
 'Parch',
 'FareStd',
 'TicketIndex',
 'SexIndex',
 'EmbarkedOneHot',
 'FareBin',
 'SibSpParch'], outputCol='features')
data = assembler.transform(data)

#CrossValidation建模預測
from pyspark.ml.classification import LogisticRegression
from pyspark.ml.evaluation import BinaryClassificationEvaluator
from pyspark.ml.tuning import ParamGridBuilder, CrossValidator 

lgr = LogisticRegression(labelCol="Survived", featuresCol="features"
                         ,maxIter=3000)
paramGrid = ParamGridBuilder().build()
     
evaluator = BinaryClassificationEvaluator(labelCol="Survived")
cv = CrossValidator (estimator=lgr,
                           estimatorParamMaps=paramGrid,
                           evaluator=evaluator,
                           numFolds=5)
train = data.filter(data['Survived'].isNotNull())
test = data.filter(data['Survived'].isNull())
model = cv.fit(train)
results = model.transform(test).select("PassengerId", "prediction")

results.coalesce(1).write.format('csv').save('results2',header=True)

results.show()

## Your submission scored 0.78468
    

       