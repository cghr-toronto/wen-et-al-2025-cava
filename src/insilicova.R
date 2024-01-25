library(openVA)
library(tidyverse)

# Read transformed input from pyCrossVA
# Replace "tmp/healsl_rd1to2_ova_insilicova_v1.csv" with the path of your transformed InSilicoVA input data
ova_input <- as.data.frame(read_csv("tmp/healsl_rd1to2_ova_insilicova_v1.csv"))

# Track start time
start_time <- Sys.time()

# Run InSilicoVA model
model <- codeVA(
    data.type = "WHO2016",
    model = "InSilicoVA",
    Nsim = 10000
)

# Track end time
end_time <- Sys.time()

# Get the top COD assignment per record
# Replace "tmp/healsl_rd1to2_cod_insilicova_v1.csv" with the path of your InSilicoVA output data
insilicova_cod <- getTopCOD(model, n = 1, include.prob = TRUE)
write.csv(insilicova_cod, "tmp/healsl_rd1to2_cod_insilicova_v1.csv")

# Print run time
print(end_time - start_time)
