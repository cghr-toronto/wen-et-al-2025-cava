import pandas as pd
from pycrossva.transform import transform

# Read your WHO v1.5.1 raw input csv data
# Replace <INPATH> with the path of your input csv file
who151_input = pd.read_csv('<INPATH>')

# Transform raw input csv data in WHO v1.5.1 format to InterVA-5 format
interva5_input <- transform(('2016WHOv151', 'InterVA5'), who151_input)

# Transform raw input csv data in WHO v1.5.1 format to InSilicoVA format
insilicova_input <- transform(('2016WHOv151', 'InSilicoVA'), who151_input)

# Save openva formatted data to csvs
# Replace <OUTPATH1> with the path of your transformed InterVA-5 input data
# Replace <OUTPATH2> with the path of your transformed InSilicoVA input data
interva5_input.to_csv('<OUTPATH1>')
insilicova_input.to_csv('OUTPATH2>')
