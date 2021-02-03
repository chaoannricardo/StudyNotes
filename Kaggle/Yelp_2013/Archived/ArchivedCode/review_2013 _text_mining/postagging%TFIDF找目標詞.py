import nltk
#nltk.download()
#from nltk.book import *
import pandas
#import json
#import nltk.stem
from nltk import SnowballStemmer
import math
#snow = nltk.stem.SnowballStemmer('english')

tip_df=pandas.read_json('/Users/wudailing/Desktop/期末報告/tip.json',lines=True)
tip_df_text=tip_df['text']

from nltk.corpus import stopwords
stopwords_list = stopwords.words('english')
stopwords_list_new=stopwords_list.copy()
for i in ['!',',','.','?','-s','-ly','</s>','s']:
    stopwords_list_new.append(i)


#對此篇評論做斷詞，斷詞結果存於list中
def getToken(text):
    token_result_raw = nltk.word_tokenize(text)
    token_result=list()
    for token in token_result_raw:
        token=token.lower()
        if token not in stopwords_list_new:
            token_result.append(token)
    return token_result


#計算每個token在此篇評論出現的次數，結果存於per_review_token_count的dict裡
after_token_list=list()
per_review_token_count={}
def frequenct_count(token＿list):
    for item in after_token_list:
        if item in per_review_token_count:
            per_review_token_count[item] += 1
        else:
            per_review_token_count[item] = 1
    return per_review_token_count


per_review_token_count=frequenct_count(after_token_list)


#計算每個token的TF= 此token在此篇文出現的次數/此篇文的總字數
def sum_of_words(token_count_dict):
    sum=0
    for value in token_count_dict.values():
        sum=sum+value
    return sum

def tf(token,token_count_dict):
    tf_word= (per_review_token_count[token]/ sum_of_words(per_review_token_count))
    return tf_word

#計算每個token的IDF=總文篇數/出現此字的文章篇數

#建立cotain_word_dict，把value全變為0
contain_word_dict=per_review_token_count.copy()
def contain_word_of_0(dict):
    for value in dict.values():
        value = 0
    return dict
contain_word_of_0(contain_word_dict)

#計算出現此字的文章篇數，存於contain_word_dict
def contain_word_reviewnum(token):
    if token in contain_word_dict:
        contain_word_dict[token]+=1
    else:
        contain_word_dict[token]=1
    return contain_word_dict[token]

def idf(token):
    idf_word= math.log(len(tip_df_text)) / (1+contain_word_reviewnum(token))
    return  idf_word

#計算此token的tf-idf=tf*idf，存於per_review_tf_idf_dict
per_review_tf_idf_dict={}
def tfidf(token):
    for token in after_token_list:
        global per_review_tf_idf_dict
        tf_idf=tf(token,per_review_token_count) * idf(token)
        per_review_tf_idf_dict[token]=tf_idf
    return per_review_tf_idf_dict



per_review_postagging_dict={}
def postagging(lst):
    global per_review_postagging_dict
    token_pos_tagging = nltk.pos_tag(after_token_list)
    per_review_postagging_dict = dict(token_pos_tagging)
    return per_review_postagging_dict

# run兩篇review 目標：建立all_review_tf_idf_dict
all_review_postagging_dict={}
all_review_tf_idf_dict={}

#run兩篇評論
for i in range(1,3):
    after_token_list = getToken(tip_df_text[i])
    postagging(after_token_list)
    all_review_postagging_dict.update(per_review_postagging_dict)

    per_review_token_count = frequenct_count(after_token_list)
    for value in per_review_token_count.keys():
        tfidf(value)
        all_review_tf_idf_dict.update(per_review_tf_idf_dict)




Series_TFIDF=pandas.Series(all_review_tf_idf_dict)
Series_postagging=pandas.Series(all_review_postagging_dict)
df_postagging_TFIDF=pandas.DataFrame({'pos-tagging':Series_postagging,'TF_IDF':Series_TFIDF})

df_postagging_TFIDF.sort_values("TF_IDF", inplace=True)

pandas.set_option('display.max_rows', 1000)

#df_postagging_TFIDF['pos-tagging']=='NN'
#df=pandas.DataFrame(all_review_postagging_dict,all_review_tf_idf_dict)