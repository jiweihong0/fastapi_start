# async_functions.py
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics.pairwise import euclidean_distances
import asyncio
import time
import pandas as pd
import os
import dotenv
from dotenv import load_dotenv
load_dotenv()



async def my_async_function(name):
    # 在這裡寫你的異步程式碼

  # # Save the dataframe to a pickle file
  # df.to_pickle('df.pkl')
 

  # Load the dataframe from the pickle file
  path = os.getcwd()

  df = pd.read_pickle(path+'/cal/df.pkl')


  # read the data from file 'b.xslx'
  df_unitext = pd.read_excel(path+'/cal/b.xlsx', sheet_name='Sheet1')

  # df ['Unnamed: 0']透過 df_unitext ['Unnamed: 0']來做塞選
  df_unitext = df[df['Unnamed: 0'].isin(df_unitext['Unnamed: 0'])]

  df_unitext_a = df_unitext.iloc[:, 1:]
  # minmax scaling to new df_unitext2
  # minmax scaling sklearn
  scaler = MinMaxScaler()
  df_unitext2 = scaler.fit_transform(df_unitext_a)
  df_unitext2 = pd.DataFrame(df_unitext2)

  #  df_unitext ['Unnamed: 0'] to df_unitext2 ['label']
  df_unitext = df_unitext.set_index('Unnamed: 0')
  df_unitext2['label'] = df_unitext.index
  # reindex dfunitext
  




  # 輸入一個名稱，找到他的index
  index = df_unitext2[df_unitext2['label'] == name].index[0]
  # 計算歐式距離
  distance = euclidean_distances(df_unitext2.iloc[index, :-1].values.reshape(1, -1), df_unitext2.iloc[:, :-1])
  # 轉成df
  distance = pd.DataFrame(distance)
  # 計算出與其他名稱的歐式距離
  distance = distance.iloc[0, :]
  # 計算出與其他名稱的歐式距離，並加上label
  distance = pd.DataFrame(
      {'label': df_unitext2['label'], 'distance': distance})
  # 排序
  distance = distance.sort_values(by=['distance'])
  
  return distance



