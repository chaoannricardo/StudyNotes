

# Read Data========================================================
# directory location
dir_data = '../data/'

# Read CSV by pandas
# Method1
import pandas
pd.read_csv("./data/microbiome.csv", header=None, sep=',') # header: Column Name
# Method2
import os
f_app = os.path.join(dir_data, 'application_train.csv')
print('Path of read in data: %s' % (f_app))
app_train = pd.read_csv(f_app)

# Read TXT by requests
import requests
target_url = "https://raw.githubusercontent.com/vashineyu/slides_and_others/master/tutorial/examples/imagenet_urls_examples.txt"
response = requests.get(target_url)
data = response.text

# Read TXT by pandas with lazy method
df_lazy = pd.read_csv(target_url, sep="\t", header=None)

# Read Images
from PIL import Image
from io import BytesIO
import numpy as np
import matplotlib.pyplot as plt

response = requests.get(df.loc[0, 1]) # 先讀取第一筆資料的圖片
img = Image.open(BytesIO(response.content))
img = np.array(img)
print(img.shape)
plt.imshow(img)
plt.show()

result = img2arr_fromURLs(df[0:5][1].values)
print("Total images that we got: %i " % len(result)) 

for im_get in result:
    plt.imshow(im_get)
    plt.show()

# Read Images II
def img2arr_fromURLs(url_list, resize = False):
    img_list = []
    for url in url_list:
        response = requests.get(url)
        try:
            img = Image.open(BytesIO(response.content))
            if resize:
                img = img.resize((256,256)) # 假如 resize, 就先統一到 256 x 256
            img = np.array(img)
            img_list.append(img)
        except:
            # 只有在 response.status_code 為 200 時，才可以取得圖片，若有 404 或其他 status code, 會碰到 Error, 所以我們用 Try 語法避開取不到的狀況
            pass
    
    return img_list

# Output Data ===================================================================
# Output CSV
import pandas as pd
df.to_csv("stock_csv", index=False, sep=',')

# Output JSON
# Not DataFrame
import pandas as pd
df.to_json("stock.json", force_ascii=False, orient="records")
# Is DataFrame
import json
with open("movie.json", "w")as f:
    json.dump(results, f)

# Data Basic Information========================================================
# Basic Information of Data
app_train.info()
app_train.describe()
# Number of Colums & Rows of Data
print(app_train.shape)
print("Number of rows is " + str(len(app_train.index)))
print("Number of columns is " + str(len(app_train.columns)))
# Names of Columns
print(str(app_train.columns))
# Select part of Data
app_train.head()
app_train.iloc[:10, 0:5] # 前 10 row 以及前 5 個 column
# Select data fulfilling specific condition
data.loc[data['人口']==data['人口'].max()]['國家']
# Split Data by....
split_tag = '\n'
data = data.split(split_tag)

# DataFrame ==============================================================
# Create pandas dataframe
data = pd.DataFrame(data)

# Transform TXT to pandas DataFrame
import pandas as pd

arrange_data = []
for d in data:
    line = d.split("\t")
    arrange_data.append(line)











