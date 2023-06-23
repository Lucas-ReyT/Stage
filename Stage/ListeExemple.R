
Tree <- list(
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
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error: Null, NotUnique 
      ),
      Country_code = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error: Null, Notexist
      ),
      Experiment_name = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : TooLong, Null
      ),
      Experimental_manipulation = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
      ),
      Experiment_insitu = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
      ),
      Experiment_climate = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
      ),
      Experiment_citizen = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
      ),
      Experiment_design = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Experiment_DOI = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong, NotURL
      ),
      Experiment_comment = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Sites_iD = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Elevation = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooSmall, TooBig
      ),
      Habitat_type = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Habitat_sub_type = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Sites_comment = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Logger_code = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Raw_data_identifier = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Latitude = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooSmall, TooBig
      ),
      Longitude = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooSmall, TooBig
      ),
      EPSG = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      GPS_Accuracy = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Logger_serial_number = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Logger_brand = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Logger_type = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Logger_age = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Logger_comment = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Sensor_code = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Sensor_shielding = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
      ),
      Sensor_shielding_type = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
      ),
      Microclimate_measurement = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotInList
      ),
      Unit = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Sensor_accuracy = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Temporal_resolution = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Sensor_height = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Sensor_length = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Start_date_year = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooSmall, TooBig
      ),
      Start_date_month_day = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotPossible
      ),
      End_date_year = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooSmall, TooBig
      ),
      End_date_month_day = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotPossible
      ),
      Timezone = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotInList
      ),
      Time_difference = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooSmall, TooBig
      ),
      Licence = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotInList
      ),
      Sensor_comments = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, TooLong
      ),
      Species_composition = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
      ),
      Species_trait = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
        #possible error : Null, NotBoolean
        
      ) 
    ),
    ##### PEOPLE ####
    People = list(
      Firstname = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Lastname = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Middlename_initials = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Email = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Second_email = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      OrcID = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      SoilTemp_update = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      meta_id = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Status_timeseries = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      survey_id = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Status_species_data = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Comments = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      )
    ),
    ##### SPECIES DETAILS ####
    Species_Details = list(
      Site_id = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Species_name = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Species_trait = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Species_trait_unit = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Species_trait_value = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Comments = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      )
    ),
    #### SPECIES DATA ####
    Species_Data = list(
      Survey_id = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Site_id = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Species_name = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Presence = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Biomass = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Biomass_unit = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Cover = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Cover_scale = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Cover_unit = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      LAI = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Density = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Density_unit = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Vegetation_layer = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      ),
      Comments = list(
        detect = list(),
        df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
      )
    ),
    #### SPECIES METADATA ####
    Species_Metadata = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Site_id = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Observation_date_year = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Observation_date_month_day = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Plot_size = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Survey_method_short = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Survey_method_long = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Multilayer_vegetation = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Taxonomic_reference = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Total biomass" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Total biomass unit" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Cover unit" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Total plant cover" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Cover E3: tree layer" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Cover E2: shrub layer" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Cover E1: herb layer" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Cover E0: moss layer" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Cover rock" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Cover baresoil" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    LAI = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "LAI unit" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Species richness" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Height E3: tree layer" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Height E2: shrub layer" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Height E1: herb layer " = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Soil bulk density" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Soil bulk density unit" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Other  = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    "Other unit" = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    DOI = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Licence = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    ),
    Comment = list(
      detect = list(),
      df = data.frame(Row = numeric(), Error = character(), stringsAsFactors = FALSE)
    )
    
  )
)
