import datetime
from pymongo import MongoClient
import json

if __name__ == "__main__":
    #與資料庫連線
    client = MongoClient('mongodb://localhost:27017/')
    #讀取資料庫
    db = client.pythondb
    #讀特定資料庫內容
    db = client['PLC_config']
    #讀取資料庫集合
    collection = db.python_collection
    #讀取特定資料庫集合
    collection = db['PLC']
    #搜尋
    data = collection.find_one({"Device":"FX5U"});
    #data = collection.find();
    #for post in collection.find({}):
    #    print(post)
    #顯示
    print(data)
    '''
    post = [{"author": "Maxsu",
         "text": "My first blog post!",
         "tags": ["mongodb", "python", "pymongo"],
         "date": datetime.datetime.utcnow()},
          {"author": "Fred",
         "text": "My second blog post!",
         "tags": ["mongodb", "python", "pymongo"],
         "date": datetime.datetime.utcnow()}]
    collection.insert_many(post)
    '''