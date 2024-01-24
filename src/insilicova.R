library(openVA)
library(tidyverse)

# Read transformed input from pyCrossVA
# Replace "tmp/healsl_rd1to2_ova_insilicova_v1.csv" with the path of your transformed InSilicoVA input data
who_input <- as.data.frame(read_csv("tmp/healsl_rd1to2_ova_insilicova_v1.csv"))

# Run InSilicoVA model
model <- codeVA(
    data.type = "WHO2016",
    model = "InSilicoVA",
    Nsim = 10000
)

# Get the top COD assignment per record
insilicova_cod <- getTopCOD(model, n = 1, include.prob = TRUE)