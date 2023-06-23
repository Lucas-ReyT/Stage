library(tidyverse)
library(readxl)

Fichier1 <- "Test3.xlsx"

if ("Raw time series data" %in% excel_sheets(Fichier1)) {
  df_fusion <- read_excel(Fichier1, sheet = "Raw time series data")
} else {
  Metadata <- read_excel(Fichier1, sheet = "Metadata")
  Metadata <- Metadata[2:nrow(Metadata), ]
  feuilles <- Metadata$Raw_data_identifier
  df_fusion <- data.frame()
  for (feuille in feuilles) {
    if (feuille != "Raw time series data") {
      data <- read_excel(Fichier1, sheet = feuille)
      data <- data %>% mutate(feuille = feuille)
      df_fusion <- bind_rows(df_fusion, data)
    }
  }
}
print(df_fusion)



print(df_fusion)
df_fusion$Raw_data_identifier
df_fusion$Year
df_fusion$Month
df_fusion$Day
df_fusion$Time
