library(openVA)
library(tidyverse)

# Read transformed input from pyCrossVA
# Replace <OUTPATH2> with the path of your transformed InSilicoVA input data
who_input <- as.data.frame(read_csv("<OUTPATH2>"))

# Run InSilicoVA model
model <- codeVA(
    data.type = "WHO2016",
    model = "InSilicoVA",
    Nsim = 10000
)

# Get the top COD assignment per record
out_cod <- getTopCOD(model, n = 1, include.prob = TRUE)