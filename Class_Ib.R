#class Ib script
library(tidyverse)
dir.create("raw_data", showWarnings = FALSE)
dir.create("clean_data", showWarnings = FALSE)
dir.create("scripts", showWarnings = FALSE)
dir.create("results", showWarnings = FALSE)
dir.create("plots", showWarnings = FALSE)
download.file(
  url = "https://raw.githubusercontent.com/AI-Biotechnology-Bioinformatics/AI_and_Omics_Research_Internship_2025/main/data_raw/patient_info.csv",
  destfile = "raw_data/patient_info.csv",
  mode = "wb"
)
patient_info <- read_csv("raw_data/patient_info.csv")
glimpse(patient_info)
summary(patient_info)
patient_info_clean <- patient_info %>%
  mutate(
    patient_id = as.factor(patient_id),
    gender = as.factor(gender),
    diagnosis = as.factor(diagnosis),
    smoker_binary = case_when(
      smoker == "Yes" ~ 1,
      smoker == "No" ~ 0,
      TRUE ~ NA_real_
    ),
    smoker_binary = as.factor(smoker_binary)
  )

write_csv(patient_info_clean, "clean_data/patient_info_clean.csv")

message("cleaning complete! Cleaned file saved to clean_data/patient_info_clean.csv")

