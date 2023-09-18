# read sum .xlsx pandas

import pandas as pd
import numpy as np
from sklearn.preprocessing import MinMaxScaler
from sklearn.metrics.pairwise import euclidean_distances

# read the data from file 'sum.xslx'
df_unitext = pd.read_excel('sum.xlsx', sheet_name='Sheet1')
# print(df_unitext)

# # 在縮小 sum 的大小
# df_unitext['sum'] = df_unitext['sum'] / 1000000
# # print(df_unitext['sum'])

# minmax scaling to new df_unitext2
# minmax scaling sklearn
# minmax df_unitext['label'] to df_unitext2['label']
scaler = MinMaxScaler()
df_unitext2 = scaler.fit_transform(df_unitext.iloc[:, 1:])
df_unitext2 = pd.DataFrame(df_unitext2)
df_unitext2['label'] = df_unitext['Unnamed: 0']

# print(df_unitext2)
# 加總所有的數字 並且加上一個新的欄位 sum
df_unitext2['sum'] = df_unitext2.iloc[:, 1:].sum(axis=1)

# df2 = df_unitext2['sum'], df_unitext2['label'],index
df2 = df_unitext2[['sum', 'label']]

# to excel
df2.to_excel('method2_weight.xlsx', sheet_name='Sheet1')

