
library(data.tree)
 Tree = list( 
   ListeGlobale = list(
  Comptabilty = list(
    Open_sheet = list(
      Metadata = list(),
      People = list(),
      Species_Details = list(),
      Species_Data = list(),
      Species_Metadata = list()
    )
  ),
    Structure = list(
      NameColumn = list(
        Metadata = list(),
        People = list(),
        Species_Details = list(),
        Species_Data = list(),
        Species_Metadata = list()
      )
    ),
  Format = list(
    #### METADATA ####
    Metadata = list(
      meta_id = list(
         
        df = data.frame(  )
        #possible error: Null, NotUnique 
      ),
      Country_code = list(
         
        df = data.frame(  )
        #possible error: Null, Notexist
      ),
      Experiment_name = list(
         
        df = data.frame(  )
        #possible error : TooLong, Null
      
      ),
      Experimental_manipulation = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      Experiment_insitu = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      Experiment_climate = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      Experiment_citizen = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      Experiment_design = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Experiment_DOI = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong, NotURL
      ),
      Experiment_comment = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Sites_iD = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Elevation = list(
         
        df = data.frame(  )
        #possible error : Null, TooSmall, TooBig
      ),
      Habitat_type = list(
         
        df = data.frame(  )
      ),
      Habitat_sub_type = list(
         
        df = data.frame(  )
      ),
       Sites_comment = list(
          
         df = data.frame(  )
         #possible error : Null, TooLong
      ),
      Logger_code = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Raw_data_identifier = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Latitude = list(
         
        df = data.frame(  )
        #possible error : Null, TooSmall, TooBig
      ),
      Longitude = list(
         
        df = data.frame(  )
        #possible error : Null, TooSmall, TooBig
      ),
      EPSG = list(
         
        df = data.frame(  )
      ),
      GPS_Accuracy = list(
         
        df = data.frame(  )
      ),
      Logger_serial_number = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Logger_brand = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Logger_type = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Logger_age = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Logger_comment = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Sensor_code = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Sensor_shielding = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      Sensor_shielding_type = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      Microclimate_measurement = list(
         
        df = data.frame(  )
        #possible error : Null, NotInList
      ),
      Unit = list(
         
        df = data.frame(  )
      ),
      Sensor_accuracy = list(
         
        df = data.frame(  )
      ),
      Temporal_resolution = list(
         
        df = data.frame(  )
      ),
      Sensor_height = list(
         
        df = data.frame(  )
      ),
      Sensor_length = list(
         
        df = data.frame(  )
      ),
      Start_date_year = list(
         
        df = data.frame(  )
        #possible error : Null, TooSmall, TooBig
      ),
      Start_date_month_day = list(
         
        df = data.frame(  )
        #possible error : Null, NotPossible
      ),
      End_date_year = list(
         
        df = data.frame(  )
        #possible error : Null, TooSmall, TooBig
      ),
      End_date_month_day = list(
         
        df = data.frame(  )
        #possible error : Null, NotPossible
      ),
      Timezone = list(
         
        df = data.frame(  )
        #possible error : Null, NotInList
      ),
      Time_difference = list(
         
        df = data.frame(  )
        #possible error : Null, TooSmall, TooBig
      ),
      Licence = list(
         
        df = data.frame(  )
        #possible error : Null, NotInList
      ),
      Sensor_comments = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Species_composition = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      Species_trait = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      
      ) 
    ),
    ##### PEOPLE ####
    People = list(
      Firstname = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Lastname = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Middlename_initials = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Email = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong, Not@
      ),
      Second_email = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong, Not@
      ),
      OrcID = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      SoilTemp_update = list(
         
        df = data.frame(  )
        #possible error : Null, NotBoolean
      ),
      meta_id = list(
         
        df = data.frame(  )
      ),
      Status_timeseries = list(
         
        df = data.frame(  )
        #possible error : Null, NotInList
      ),
      survey_id = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Status_species_data = list(
         
        df = data.frame(  )
        #possible error : Null, NotInList
      ),
      Comments = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      )
    ),
    ##### SPECIES DETAILS ####
    Species_Details = list(
      Site_id = list(
         
        df = data.frame(  )
        #possible error : Null, NotTheSame(?)
      ),
      Species_name = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Species_trait = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Species_trait_unit = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Species_trait_value = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      Comments = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      )
    ),
    #### SPECIES DATA ####
    Species_Data = list(
      Survey_id = list(
         
        df = data.frame(  )
        #possible error : Null, 
      ),
      Site_id = list(
         
        df = data.frame(  )
        #possible error : Null, toolong
      ),
      Species_name = list(
         
        df = data.frame(  )
        #possible error : Null, toolong
      ),
      Presence = list(
         
        df = data.frame(  )
        #Possible error :Null, toolong
      ),
      Biomass = list(
         
        df = data.frame(  )
        #possible error : Null, toolong
      ),
      Biomass_unit = list(
         
        df = data.frame(  )
        #possible error : 
      ),
      Cover = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Cover_scale = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Cover_unit = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      LAI = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Density = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Density_unit = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Vegetation_layer = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Comments = list(
         
        df = data.frame(  )
        #possible error : Null,
      )
    ),
    #### SPECIES METADATA ####
    Species_Metadata = list(
      Site_id = list(
         
        df = data.frame(  )
      ),
      Observation_date_year = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Observation_date_month_day = list(
         
        df = data.frame(  )
        #possible error :Null,
      ),
      Plot_size = list(
         
        df = data.frame(  )
        #possible error :Null,
      ),
      Survey_method_short = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Survey_method_long = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Multilayer_vegetation = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      Taxonomic_reference = list(
         
        df = data.frame(  )
        #possible error :  Null,
      ),
      "Total biomass" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Total biomass unit" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Cover unit" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Total plant cover" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Cover E3: tree layer" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Cover E2: shrub layer" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Cover E1: herb layer" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Cover E0: moss layer" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Cover rock" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Cover baresoil" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      LAI = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "LAI unit" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Species richness" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Height E3: tree layer" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Height E2: shrub layer" = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Height E1: herb layer " = list(
         
        df = data.frame(  )
        #possible error : Null,
      ),
      "Soil bulk density" = list(
         
        df = data.frame(  )
        #possible error : Null, toolong
      ),
      "Soil bulk density unit" = list(
         
        df = data.frame(  )
        #possible error : Null, toolong
      ),
      Other  = list(
         
        df = data.frame(  )
        #possible error : Null, Toolong
      ),
      "Other unit" = list(
         
        df = data.frame(  )
        #possible error : Null, TooLong
      ),
      DOI = list(
         
        df = data.frame(  )
        #possible error : Null, Toolong
      ),
      Licence = list(
         
        df = data.frame(  )
        #possible error :Null, TooLong
      ),
      Comment = list(
         
        df = data.frame(  )
        #possible error :Null, TooLong
       )
      
    )
  )
)
)



FromListSimple(Tree)

FromListExplicit(Tree)


Tree$Format$People$name$df


MinMaxDF <- function(df, nom_colonne, min_value, max_value) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(as.numeric(df[[nom_colonne]]) < min_value,
                            "Too small",
                            ifelse(as.numeric(df[[nom_colonne]]) > max_value,
                                   "Too large",
                                   "")))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  return(df)
}
AnneeDF <- function(df, nom_colonne, min_value, max_value = as.numeric(format(Sys.Date(), "%Y"))) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(as.numeric(df[[nom_colonne]]) < min_value,
                            "Too small",
                            ifelse(as.numeric(df[[nom_colonne]]) > max_value,
                                   "Exceeds the current year",
                                   "")))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  return(df)
}

LongueurDF <- function(df, nom_colonne, longueur_max) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(nchar(as.character(df[[nom_colonne]])) > longueur_max,
                            "Too long",
                            ""))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  return(df)
}
ExisteDF <- function(df, nom_colonne) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "",
                     "Value present")
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  return(df)
}



EmailDF <- function(df, nom_colonne, longueur_max) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(nchar(as.character(df[[nom_colonne]])) > longueur_max,
                            "Too long",
                            ifelse(!grepl("@", df[[nom_colonne]]),
                                   "Not @",
                                   "")))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  return(df)
}
VerifierHabitat <- function(df, habitat_colonne, sub_habitat_colonne) {
  df <- df[, c(habitat_colonne, sub_habitat_colonne), drop = FALSE]
  
  df$error <- ""
  
  for (i in 1:nrow(df)) {
    hab <- df[[habitat_colonne]][i]
    sub <- df[[sub_habitat_colonne]][i]
    
    if (hab == 1 && !(sub %in% 1:9)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 1")
    } else if (hab == 2 && !(sub %in% 1:2)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 2")
    } else if (hab == 3 && !(sub %in% 1:9)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 3")
    } else if (hab == 4 && !(sub %in% 1:7)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 4")
    } else if (hab == 5 && !(sub %in% 1:18)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 5")
    } else if (hab == 6 && !(sub %in% 0:1)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 6")
    } else if (hab == 7 && !(sub %in% 1:2)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 7")
    } else if (hab == 8 && !(sub %in% 1:3)) {
      df$error[i] <- paste0("Invalid sub-habitat for habitat 8")
    } else if (hab >= 9 && hab <= 15) {
      df$error[i] <- "aquatic"
    }
  }
  
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  return(df)
}

URLDF <- function(df, nom_colonne, longueur_max) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(nchar(as.character(df[[nom_colonne]])) > longueur_max,
                            "Too long",
                            ifelse(!grepl("https://", df[[nom_colonne]]),
                                   "Not https://",
                                   "")))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  return(df)
}

InList <- function(df, nom_colonne, liste) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(!df[[nom_colonne]] %in% liste,
                            "Not in list",
                            ""))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  return(df)
}

YesNoDF <- function(df, nom_colonne) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(tolower(substr(as.character(df[[nom_colonne]]), 1, 1)) %in% c("y", "n"),
                            "",
                            "Not Yes or No"))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  return(df)
}
DateValide <- function(df, mois_colonne, jour_colonne) {
  result <- data.frame(date = character(),
                       error = character(),
                       row = character(),
                       stringsAsFactors = FALSE)
  
  for (i in 1:nrow(df)) {
    mois <- df[[mois_colonne]][i]
    jour <- df[[jour_colonne]][i]
    
    if (mois < 1 || mois > 12) {
      result <- rbind(result, data.frame(date = paste(jour, mois, sep = "/"),
                                         error = paste0("Month ", mois, " does not exist"),
                                         row = i))
    } else if (jour < 1 || jour > 31) {
      result <- rbind(result, data.frame(date = paste(jour, mois, sep = "/"),
                                         error = paste0("Day ", jour, " does not exist"),
                                         row = i))
    } else if ((mois == 2 && jour > 29) || (mois %in% c(4, 6, 9, 11) && jour > 30)) {
      result <- rbind(result, data.frame(date = paste(jour, mois, sep = "/"),
                                         error = paste0("Month ", mois, " does not have that many days"),
                                         row = i))
    }
  }
  
  return(result)
}


##### >>> FICHIER ####
Fichier1 =  "Test3.xlsx"
  People =  read_excel(Fichier1, sheet =  "People")
People = People[2:nrow(People), ]
Species_details =  read_excel(Fichier1, sheet =  "Species details")
Species_details = Species_details[2:nrow(Species_details), ]
People =  read_excel(Fichier1, sheet =  "People")
People = People[2:nrow(People), ]
Species_data =  read_excel(Fichier1, sheet =  "Species data")
Species_data = Species_data[2:nrow(Species_data), ]
Metadata =  read_excel(Fichier1, sheet =  "Metadata")
Metadata = Metadata[2:nrow(Metadata), ]
Species_metadata =  read_excel(Fichier1, sheet =  "Species metadata")
Species_metadata = Species_metadata[2:nrow(Species_metadata), ]

LongueurDF <- function(df, nom_colonne, longueur_max) {
  df <- df[, nom_colonne, drop = FALSE]
  
  df$error <- ifelse(is.na(df[[nom_colonne]]) | df[[nom_colonne]] == "", 
                     "Missing value",
                     ifelse(nchar(as.character(df[[nom_colonne]])) > longueur_max,
                            "Too long",
                            ""))
  df$row <- row.names(df)
  df <- df[df$error != "", ]
  
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  return(df)
}

#### METADATA ####
Tree$Format$Metadata$meta_id$df
Tree$Format$Metadata$Country_code$df = LongueurDF(Metadata, "Country_code",5)

Tree$Format$Metadata$Experiment_name$df = LongueurDF(Metadata, "Experiment_name",200)
Tree$Format$Metadata$Experiment_name$df

Tree$Format$Metadata$Experimental_manipulation$df = YesNoDF(Metadata, "Experimental_manipulation")
Tree$Format$Metadata$Experiment_insitu$df = YesNoDF(Metadata, "Experiment_insitu")
Tree$Format$Metadata$Experiment_climate$df = YesNoDF(Metadata, "Experiment_climate")
Tree$Format$Metadata$Experiment_citizens$df = YesNoDF(Metadata, "Experiment_citizens")
Tree$Format$Metadata$Experiment_design$df = LongueurDF(Metadata, "Experiment_design",200)  
Tree$Format$Metadata$Experiment_DOI$df = URLDF(Metadata, "Experiment_doi")
Tree$Format$Metadata$Experiment_comment$df = LongueurDF(Metadata, "Experiment_comment",200)
Tree$Format$Metadata$Sites_iD$df = LongueurDF(Metadata, "Site_id",200) 
Tree$Format$Metadata$Elevation$df = MinMaxDF(Metadata, "Elevation",-10000,10000)
Tree$Format$Metadata$Habitat_type$df = MinMaxDF(Metadata, "Habitat_type",1,18)
Tree$Format$Metadata$Habitat_sub_type$df = VerifierHabitat(Metadata, "Habitat_type","Habitat_sub_type")
Tree$Format$Metadata$Sites_comment$df = LongueurDF(Metadata, "Site_comments",200)  
Tree$Format$Metadata$Logger_code$df = LongueurDF(Metadata, "Logger_code",200)  
Tree$Format$Metadata$Raw_data_identifier$df = LongueurDF(Metadata, "Raw_data_identifier",200)  
Tree$Format$Metadata$Latitude$df  = MinMaxDF(Metadata, "Latitude",-180,180)
Tree$Format$Metadata$Longitude$df  = MinMaxDF(Metadata, "Longitude",-180,180)
Tree$Format$Metadata$EPSG$df = MinMaxDF(Metadata, "EPSG",0,7000)
Tree$Format$Metadata$GPS_Accuracy$df = MinMaxDF(Metadata, "GPS_accuracy",0,500)
Tree$Format$Metadata$Logger_serial_number$df = LongueurDF(Metadata, "Logger_serial_number",200)
Tree$Format$Metadata$Logger_brand$df = LongueurDF(Metadata, "Logger_brand",200)  
Tree$Format$Metadata$Logger_type$df = LongueurDF(Metadata, "Logger_type",200)  
Tree$Format$Metadata$Logger_age$df = LongueurDF(Metadata, "Logger_age",200)  
Tree$Format$Metadata$Logger_comment$df = LongueurDF(Metadata, "Logger_comment",200) 
Tree$Format$Metadata$Sensor_code$df = LongueurDF(Metadata, "Logger_code",200) 
Tree$Format$Metadata$Sensor_shielding$df = YesNoDF(Metadata, "Sensor_shielding") 
Tree$Format$Metadata$Sensor_shielding_type$df = YesNoDF(Metadata, "Sensor_shielding_type")
Tree$Format$Metadata$Microclimate_measurement$df = InList(Metadata, "Microclimate_measurement",ListeClimate)
Tree$Format$Metadata$Unit$df = LongueurDF(Metadata,"Unit",5)
Tree$Format$Metadata$Sensor_accuracy$df = LongueurDF(Metadata,"Sensor_accuracy",5)
Tree$Format$Metadata$Temporal_resolution$df = LongueurDF(Metadata,"Temporal_resolution",5)
Tree$Format$Metadata$Sensor_height$df = MinMaxDF(Metadata, "Sensor_height", -9999, 9999)
Tree$Format$Metadata$Sensor_length$df = MinMaxDF(Metadata, "Sensor_length", -9999, 9999)
Tree$Format$Metadata$Start_date_year$df = AnneeDF(Metadata,"Start_date_year",1900)
Tree$Format$Metadata$Start_date_month_day$df = DateValide(Metadata,"Start_date_month","Start_date_day")
Tree$Format$Metadata$End_date_year$df = AnneeDF(Metadata,"End_date_year",1900)
Tree$Format$Metadata$End_date_month_day$df = DateValide(Metadata,"End_date_month","End_date_day")
Tree$Format$Metadata$Timezone$df = 
Tree$Format$Metadata$Time_difference$df = MinMaxDF(Metadata, "Time_difference",-12,14)
Tree$Format$Metadata$Licence$df = InList(Metadata, "Licence", ListeLicence)
Tree$Format$Metadata$Sensor_comments$df = ExisteDF(Metadata, "Sensor_comments")
Tree$Format$Metadata$Sensor_comments$df
Tree$Format$Metadata$Species_composition$df = YesNoDF(Metadata, "Species_composition")
Tree$Format$Metadata$Species_trait$df = YesNoDF(Metadata, "Species_trait")




  
 

 


 


#### PEOPLE ####
Tree$Format$People$Firstname$df = LongueurDF(People, "Firstname", 200)
Tree$Format$People$Lastname$df = LongueurDF(People, "Lastname", 2)
Tree$Format$People$Middlename_initials$df = LongueurDF(People, "Middlename_initials", 5)
Tree$Format$People$Email$df = EmailDF(People, "Email", 20)
Tree$Format$People$Second_email$df = EmailDF(People, "Second_email", 20)
Tree$Format$People$OrcID$df = LongueurDF(People, "OrcID", 5)
Tree$Format$People$SoilTemp_update$df = YesNoDF(People, "SoilTemp_update")
Tree$Format$People$meta_id$df = LongueurDF(People, "meta_id",10)
Tree$Format$People$Status_timeseries$df = InList(People, "Status_timeseries", ListePeople)
Tree$Format$People$survey_id$df = LongueurDF(People, "survey_id", 20)
Tree$Format$People$Status_species_data$df = InList(People, "Status_species_data", ListePeople)
Tree$Format$People$Comments$df = LongueurDF(People, "Comment", 2000)


#### SPECIES DETAILS ####

Tree$Format$Species_Details$Site_id$df
Tree$Format$Species_Details$Species_name$df = LongueurDF(Species_details, "Species_name", 200)
Tree$Format$Species_Details$Species_trait$df = LongueurDF(Species_details, "Species_trait", 200)
Tree$Format$Species_Details$Species_trait_unit$df = LongueurDF(Species_details, "Species_trait_unit", 200)
Tree$Format$Species_Details$Species_trait_value$df = LongueurDF(Species_details, "Species_trait_value", 200)
Tree$Format$Species_Details$Comments$df = LongueurDF(Species_details, "Comments", 200)

#### SPecies Data ####

Tree$Format$Species_Data$Survey_id$df
Tree$Format$Species_Data$Site_id$df = LongueurDF(Species_data,"Site_id",200)
Tree$Format$Species_Data$Species_name$df = LongueurDF(Species_data, "Species_name",200)
Tree$Format$Species_Data$Presence$df = LongueurDF(Species_data, "Presence",200)
Tree$Format$Species_Data$Biomass$df = LongueurDF(Species_data, "Biomass",200)
Tree$Format$Species_Data$Biomass_unit$df = LongueurDF(Species_data, "Biomass_unit",200)
Tree$Format$Species_Data$Cover$df = LongueurDF(Species_data, "Cover",200)
Tree$Format$Species_Data$Cover_scale$df = LongueurDF(Species_data, "Cover_scale",200)
Tree$Format$Species_Data$Cover_unit$df = LongueurDF(Species_data, "Cover_unit",200)
Tree$Format$Species_Data$LAI$df = LongueurDF(Species_data, "LAI",200)
Tree$Format$Species_Data$Density$df = LongueurDF(Species_data, "Density",200)
Tree$Format$Species_Data$Density_unit$df = LongueurDF(Species_data, "Density_unit",200)
Tree$Format$Species_Data$Vegetation_layer$df = MinMaxDF(Species_data, "Vegetation layer",1,8)
Tree$Format$Species_Data$Comments$df = LongueurDF(Species_data, "Comments", 2000)





#### Species METADATA ####

Tree$Format$Species_Metadata$Site_id
Tree$Format$Species_Metadata$Observation_date_year$df = AnneeDF(Species_metadata,"Observation_date_year",1900)
Tree$Format$Species_Metadata$Observation_date_month_day$df = DateValide(Species_metadata,"Observation_date_month","Observation_date_day")
Tree$Format$Species_Metadata$Plot_size$df = MinMaxDF(Species_metadata, "Plot_size" ,1,100)
Tree$Format$Species_Metadata$Survey_method_short$df = LongueurDF(Species_metadata,"Survey_method_short",200)
Tree$Format$Species_Metadata$Survey_method_long$df= LongueurDF(Species_metadata,"Survey_method_long",2000)
Tree$Format$Species_Metadata$Multilayer_vegetation$df = YesNoDF(Species_metadata,"Multilayer vegetation")
Tree$Format$Species_Metadata$Taxonomic_reference$df = LongueurDF(Species_metadata,"Taxonomic_reference",200)
Tree$Format$Species_Metadata$`Total biomass`$df = LongueurDF(Species_metadata,"Total biomass",200)
Tree$Format$Species_Metadata$`Total biomass unit`$df = LongueurDF(Species_metadata,"Total biomass unit",200)
Tree$Format$Species_Metadata$`Cover unit`$df = LongueurDF(Species_metadata,"Cover uni",200)
Tree$Format$Species_Metadata$`Total plant cover`$df = MinMaxDF(Species_metadata, "Total plant cover" ,1,100)
Tree$Format$Species_Metadata$`Cover E3: tree layer`$df = MinMaxDF(Species_metadata, "Cover E3: tree layer" ,1,100)
Tree$Format$Species_Metadata$`Cover E2: shrub layer`$df = MinMaxDF(Species_metadata, "Cover E2: shrub layer" ,1,100)
Tree$Format$Species_Metadata$`Cover E1: herb layer`$df = MinMaxDF(Species_metadata, "Cover E1: herb layer" ,1,100)
Tree$Format$Species_Metadata$`Cover E0: moss layer`$df = MinMaxDF(Species_metadata, "Cover E0: moss layer" ,1,100)
Tree$Format$Species_Metadata$`Cover rock`$df = MinMaxDF(Species_metadata, "Cover E0: moss layer" ,1,100)
Tree$Format$Species_Metadata$`Cover baresoil`$df = MinMaxDF(Species_metadata, "Cover E0: moss layer" ,1,100)
Tree$Format$Species_Metadata$LAI$df = LongueurDF(Species_metadata,"LAI",200)
Tree$Format$Species_Metadata$`LAI unit`$df = LongueurDF(Species_metadata,"LAI unit",200)
Tree$Format$Species_Metadata$`Species richness`$df  = LongueurDF(Species_metadata,"Species richness",200)
Tree$Format$Species_Metadata$`Height E3: tree layer`$df = MinMaxDF(Species_metadata,"Height E3: tree layer",0,120)
Tree$Format$Species_Metadata$`Height E2: shrub layer`$df = MinMaxDF(Species_metadata,"Height E2: shrub layer",0,10)
Tree$Format$Species_Metadata$`Height E1: herb layer `$df =  MinMaxDF(Species_metadata,"Height E1: herb layer",0,5)
Tree$Format$Species_Metadata$`Soil bulk density`$df = LongueurDF(Species_metadata,"DOI",200)
Tree$Format$Species_Metadata$`Soil bulk density unit`$df = LongueurDF(Species_metadata,"Soil bulk density unit",200)
Tree$Format$Species_Metadata$Other$df = LongueurDF(Species_metadata,"Other",200)
Tree$Format$Species_Metadata$`Other unit`$df = LongueurDF(Species_metadata,"Other unit",200)
Tree$Format$Species_Metadata$DOI$df = LongueurDF(Species_metadata,"DOI",200)
Tree$Format$Species_Metadata$Licence$df = InList(Species_metadata, "Licence", ListeLicence)
Tree$Format$Species_Metadata$Comment$df = ExisteDF(Species_metadata,"Comment")

Tree$Format$Species_Metadata$Comment$df 



afficherDataframesRemplis <- function(liste) {
  for (i in liste) {
    if (is.data.frame(i) && !is_empty(i)) {
      cat("\n")
      capture.output(write.table(i, stdout(), row.names = FALSE, col.names = FALSE))
    } else if (is.list(i)) {
      afficherDataframesRemplis(i)
    }
  }
}


afficherDataframesRemplis(Tree)






FromListSimple(Tree)
