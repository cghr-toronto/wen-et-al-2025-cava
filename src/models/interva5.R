# R v4.3.1
# openVA v1.1.1
# InterVA5 v1.1.3
library(openVA)
library(tidyverse)

# Read transformed input from pyCrossVA
ova_input_rd1 <- as.data.frame(read_csv("../../tmp/healsl_rd1_rapid_interva5_input_v1.csv"))
ova_input_rd2 <- as.data.frame(read_csv("../../tmp/healsl_rd2_rapid_interva5_input_v1.csv"))

# Track start time
start_time <- Sys.time()

# Run InterVA-5 model
model_rd1 <- codeVA(
    data = ova_input_rd1,
    data.type = "WHO2016",
    model = "InterVA",
    version = "5",
    HIV = "h",
    Malaria = "h",
    write = FALSE
)
model_rd2 <- codeVA(
    data = ova_input_rd2,
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
interva5_cod_rd1 <- getTopCOD(model_rd1, n = 1, include.prob = TRUE)
interva5_cod_rd2 <- getTopCOD(model_rd2, n = 1, include.prob = TRUE)
write.csv(interva5_cod_rd1, "../../tmp/healsl_rd1_rapid_interva5_v1.csv", row.names = FALSE)
write.csv(interva5_cod_rd2, "../../tmp/healsl_rd2_rapid_interva5_v1.csv", row.names = FALSE)

# Print run time
print(end_time - start_time)
