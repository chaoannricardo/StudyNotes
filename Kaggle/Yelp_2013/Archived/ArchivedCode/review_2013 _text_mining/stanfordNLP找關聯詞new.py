from stanfordcorenlp import StanfordCoreNLP
from nltk.tree import Tree
import json
import pandas as pd
import re

tip_df=pd.read_json('/Users/wudailing/Desktop/期末報告/tip.json',lines=True)
tip_df_text=tip_df['text']
tip_df_businessid=tip_df['business_id']

nlp = StanfordCoreNLP('/Users/wudailing/Desktop/stanford-corenlp-full-2018-10-05')



#dependency_parse_list有多個tuple，含有每個詞間的關係
#dependency_parse_list_new裡面改成多個list，每個list存有每篇review dependency parse的結果[[(),(),()],[(),()].... ]

def dependency_parse_list_new_making(d_p_l,dplnew):
    for tup in d_p_l:
        tup_to_list=list(tup)
        tup_to_list[1] = token_list[tup_to_list[1] - 1]
        tup_to_list[2] = token_list[tup_to_list[2] - 1]
        dplnew.append(tup_to_list)
    return dplnew



business_id_withlist={}
for i in range(1,3):
    sentence = tip_df_text[i]
    business_id=tip_df_businessid[i]
    split_sentence_list=re.split('!|\?|\.',sentence)
    for sentence in split_sentence_list:
        token_list = nlp.word_tokenize(sentence)
        dependency_parse_list = nlp.dependency_parse(sentence)
        dependency_parse_list_new=[]
        dependency_parse_list_new=dependency_parse_list_new_making(dependency_parse_list,dependency_parse_list_new)
        if business_id not in business_id_withlist.keys():
            business_id_withlist[business_id]=[]
            for lst in dependency_parse_list_new:
                business_id_withlist[business_id].append(lst)
        else:
            for lst in dependency_parse_list_new:
                business_id_withlist[business_id].append(lst)

print(business_id_withlist)




for key,value in business_id_withlist.items():
    for i in range(len(value)):
        if value[i][1]=='location' or value[i][2]=='location':
            print(key,value[i])


nlp.close()



