import pandas as pd
import os

path = os.getcwd()

# Read global.xlsx
global_df = pd.read_excel(path + '/cal/alldata.xlsx')

# Group by class and module
grouped_df = global_df.groupby(['class', 'module'])

async def classify_func(nameprops):
    result_dict = {}
    
    for (class_name, module_name), group in grouped_df:
        # Drop Unnamed: 0 column
        group = group.drop(['Unnamed: 0'], axis=1)
        
        # Drop class and module columns
        group = group.drop(['class', 'module'], axis=1)
        
        # Convert the group to a dictionary
        records = group.to_dict(orient='records')
        
        # Create a nested dictionary structure
        if class_name not in result_dict:
            result_dict[class_name] = {}
        result_dict[class_name][module_name] = records

    # Extract the desired key from the result_dict
    if nameprops in result_dict:
        return  {nameprops: result_dict[nameprops]}
    else:
        return {nameprops: "Not Found"}  # Adjust the response for non-existent keys
