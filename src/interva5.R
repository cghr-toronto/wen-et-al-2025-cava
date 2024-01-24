library(openVA)
library(tidyverse)

# Read transformed input from pyCrossVA
# Replace <OUTPATH1> with the path of your transformed InterVA-5 input data
who_input <- as.data.frame(read_csv("<OUTPATH1>"))

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
out_cod <- getTopCOD(model, n = 1, include.prob = TRUE)