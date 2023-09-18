# read sum .xlsx pandas

import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics.pairwise import euclidean_distances

# read the data from file 'method2_weight.xslx'
df_unitext = pd.read_excel('method2_weight.xlsx', sheet_name='Sheet1')
# print(df_unitext)


#寫一個def 輸入文字，找到他的index,並以他為基準點,並計算歐式距離 取離最近的前20個關鍵字
def cal(name):
    # 輸入一個名稱，找到他的index
    index = df_unitext[df_unitext['label'] == name].index[0]
    # 計算歐式距離
    distance = euclidean_distances(df_unitext.iloc[index, :-1].values.reshape(1, -1), df_unitext.iloc[:, :-1])
    # 轉成df
    distance = pd.DataFrame(distance)
    # 計算出與其他名稱的歐式距離
    distance = distance.iloc[0, :]
    # 計算出與其他名稱的歐式距離，並加上label
    distance = pd.DataFrame(
        {'label': df_unitext['label'], 'distance': distance})
    # 排序
    distance = distance.sort_values(by=['distance'])
    # 取出前20個
    distance = distance.iloc[0:20, :]
    
    # print(distance)
    return distance
print(cal('氣候'))



