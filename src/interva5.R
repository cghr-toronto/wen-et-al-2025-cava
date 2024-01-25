library(openVA)
library(tidyverse)

# Read transformed input from pyCrossVA
# Replace "tmp/healsl_rd1to2_ova_interva5_v1.csv" with the path of your transformed InterVA-5 input data
ova_input <- as.data.frame(read_csv("tmp/healsl_rd1to2_ova_interva5_v1.csv"))

# Track start time
start_time <- Sys.time()

# Run InterVA-5 model
model <- codeVA(
    data = ova_input,
    data.type = "WHO2016",
    model = "InterVA",
    version = "5",
    HIV = "h",
    Malaria = "h",
    write = FALSE
)

# Track end time
end_time <- Sys.time()

# Get the top COD assignment per record
# Replace "tmp/healsl_rd1to2_cod_interva5_v1.csv" with the path of your InterVA-5 output data
interva5_cod <- getTopCOD(model, n = 1, include.prob = TRUE)
write.csv(interva5_cod, "tmp/healsl_rd1to2_cod_interva5_v1.csv", row.names = FALSE)

# Print run time
print(end_time - start_time)
