# Python v3.11.4
# pycrossva v0.97
import pandas as pd
from pycrossva.transform import transform

# Read your WHO v1.5.1 raw input csv data
# Replace 'tmp/healsl_rd1to2_who151_v1.csv' with the path of your input csv file
who151_input_adult_rd1 = pd.read_csv('../../tmp/healsl_rd1_who_adult_v1.csv')
who151_input_adult_rd2 = pd.read_csv('../../tmp/healsl_rd2_who_adult_v1.csv')
who151_input_child_rd1 = pd.read_csv('../../tmp/healsl_rd1_who_child_v1.csv')
who151_input_child_rd2 = pd.read_csv('../../tmp/healsl_rd2_who_child_v1.csv')
who151_input_neo_rd1 = pd.read_csv('../../tmp/healsl_rd1_who_neo_v1.csv')
who151_input_neo_rd2 = pd.read_csv('../../tmp/healsl_rd2_who_neo_v1.csv')

# Seperate into rounds
who151_input_rd1 = pd.concat(
    [
        who151_input_adult_rd1,
        who151_input_child_rd1,
        who151_input_neo_rd1
    ],
    ignore_index = True
)
who151_input_rd2 = pd.concat(
    [
        who151_input_adult_rd2,
        who151_input_child_rd2,
        who151_input_neo_rd2
    ],
    ignore_index = True
)

# Transform raw input csv data in WHO v1.5.1 format to InterVA-5 format
interva5_input_rd1 = transform(
    ('2016WHOv151', 'InterVA5'),
    who151_input_rd1,
    raw_data_id = 'rowid'
)
interva5_input_rd2 = transform(
    ('2016WHOv151', 'InterVA5'),
    who151_input_rd2,
    raw_data_id = 'rowid'
)

# Transform raw input csv data in WHO v1.5.1 format to InSilicoVA format
insilicova_input_rd1 = transform(
    ('2016WHOv151', 'InSilicoVA'),
    who151_input_rd1,
    raw_data_id = 'rowid'
)
insilicova_input_rd2 = transform(
    ('2016WHOv151', 'InSilicoVA'),
    who151_input_rd2,
    raw_data_id = 'rowid'
)

# Save openva formatted data to csvs
# Replace 'tmp/healsl_rd1to2_ova_interva5_v1.csv' with the path of your transformed InterVA-5 input data
# Replace 'tmp/healsl_rd1to2_ova_insilicova_v1.csv' with the path of your transformed InSilicoVA input data
interva5_input_rd1.to_csv('../../tmp/healsl_rd1_rapid_interva5_input_v1.csv', index = False)
interva5_input_rd2.to_csv('../../tmp/healsl_rd1_rapid_interva5_input_v2.csv', index = False)
insilicova_input_rd1.to_csv('../../tmp/healsl_rd1_rapid_insilicova_input_v1.csv', index = False)
insilicova_input_rd2.to_csv('../../tmp/healsl_rd1_rapid_insilicova_input_v2.csv', index = False)
