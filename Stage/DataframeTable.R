library(tidyverse)
library(readxl)
Fichier1 =  "Test.xlsx"
People =  read_excel(Fichier1, sheet =  "People")
Species_metadata =  read_excel(Fichier1, sheet =  "Species metadata")
Species_data =  read_excel(Fichier1, sheet =  "Species data")
Metadata =  read_excel(Fichier1, sheet =  "Metadata")
Species_details =  read_excel(Fichier1, sheet =  "Species details")



# Importer les colonnes souhaitées du fichier Excel

#### Table TEMPERATURE #### 


#### > Table meta-ts ####
TableMetats <- Metadata[-1,] %>%
  select(Sensor_shielding,Sensor_shielding_type,Microclimate_measurement,Unit,Sensor_accuracy,Temporal_resolution,
         Sensor_height,Sensor_length,Timezone,Start_date_year,	
         Start_date_month,	Start_date_day,	End_date_year,	End_date_month,	End_date_day,
         Licence,Sensor_comments) %>%
  unite(Start_date, Start_date_year, Start_date_month, Start_date_day, sep = "/") %>%
  unite(End_date, End_date_year, End_date_month, End_date_day, sep = "/")
 
TableMetats

#### > Table loggers ####
TableLogger <- Metadata[-1,] %>%
  select(Logger_code,Logger_serial_number,Logger_brand,Logger_type,Logger_age,Logger_comment)
TableLogger


#### > Table clim_timeseries 

#### Table METADATA ####

#### > Table experiments ####
TableExperiment <- Metadata[-1,] %>%
  select(Experiment_name,Experimental_manipulation,Experiment_insitu,Experiment_climate,Experiment_citizens,Experiment_design,
         Experiment_doi,Experiment_comment)
TableExperiment

#### > Table sites ####
TableSites <- Metadata[-1,] %>%
  select(Site_id,GPS_accuracy,Longitude,Latitude,Elevation,Habitat_type,Habitat_sub_type,Experiment_name,Site_comments)
TableSites

#### > Table Location ####
TableLocation <- Metadata[-1,] %>%
  select(Country_code)
TableLocation



#### Table VEGETATION ####

#### > Table Species ####
TableSpecies <- Species_details[-1,] %>%
  select(Site_id,Species_trait,Species_trait_unit,Species_trait_value,Comments)
TableSpecies


#### > Table vegetation ####
TableVegetation <- Species_metadata[-1,] %>%
  select(survey_id,Plot_size,Observation_date_year, Observation_date_month, Observation_date_day,Survey_method_short,Survey_method_long,"Taxonomic reference","Total biomass","Total biomass unit","Total cover",
         "Total cover unit",LAI,"LAI unit","Species richness","Multilayer vegetation",Other,"Other unit",DOI,Licence,Comment) %>%
  unite(Date, Observation_date_year, Observation_date_month, Observation_date_day, sep = "/")
TableVegetation

#### > Table species_composition ####
TableComposition <- Species_data[-1,] %>%
  select(Species_name,Presence,Biomass,Biomass_unit,Cover,Cover_scale,Cover_unit,LAI,Density,Cover_unit,Comments)
TableComposition

#### TAble PEOPLE

#### > Table people ####
TablePeople <- People[-1,] %>%
  select(Firstname, Middlename_initials, Lastname, Email,Second_email,OrcID,SoilTemp_update)
TablePeople



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
Tablets <- df_fusion
Tablets
