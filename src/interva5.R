library(openVA)
library(tidyverse)

# Read transformed input from pyCrossVA
# Replace "tmp/healsl_rd1to2_ova_interva5_v1.csv" with the path of your transformed InterVA-5 input data
who_input <- as.data.frame(read_csv("tmp/healsl_rd1to2_ova_interva5_v1.csv"))

# Run InterVA-5 model
model <- codeVA(
    data = ova_input,
    data.type = "WHO2016",
    model = "InterVA",
    version = "5",
    HIV = "h",
    Malaria = "h"
)

# Get the top COD assignment per record
interva5_cod <- getTopCOD(model, n = 1, include.prob = TRUE)