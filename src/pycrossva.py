# Python v3.11.4
# pycrossva v0.97
import pandas as pd
from pycrossva.transform import transform

# Read your WHO v1.5.1 raw input csv data
# Replace 'tmp/healsl_rd1to2_who151_v1.csv' with the path of your input csv file
who151_input = pd.read_csv('tmp/healsl_rd1to2_who151_v1.csv')

# Transform raw input csv data in WHO v1.5.1 format to InterVA-5 format
interva5_input = transform(
    ('2016WHOv151', 'InterVA5'),
    who151_input,
    raw_data_id = 'rowid'
)

# Transform raw input csv data in WHO v1.5.1 format to InSilicoVA format
insilicova_input = transform(
    ('2016WHOv151', 'InSilicoVA'),
    who151_input,
    raw_data_id = 'rowid'
)

# Save openva formatted data to csvs
# Replace 'tmp/healsl_rd1to2_ova_interva5_v1.csv' with the path of your transformed InterVA-5 input data
# Replace 'tmp/healsl_rd1to2_ova_insilicova_v1.csv' with the path of your transformed InSilicoVA input data
interva5_input.to_csv('tmp/healsl_rd1to2_ova_interva5_v1.csv', index = False)
insilicova_input.to_csv('tmp/healsl_rd1to2_ova_insilicova_v1.csv', index = False)
