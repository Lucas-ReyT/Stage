library(shiny)
library(readxl)
library(leaflet)
library(tidyverse)
library(DT)
library(ggplot2)


afficherDataframesRemplis <- function(liste) {
  for (i in liste) {
    if (is.data.frame(i) && !is_empty(i)) {
      cat("\n")
      print(i, n = nrow(i), row.names = FALSE)
    } else if (is.list(i)) {
      afficherDataframesRemplis(i)
    }
  }
}



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
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  
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
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  
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
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  
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
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  
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
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  
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
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  
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
  if (nrow(df) == 0) {
    df <- data.frame()
  }
  
  
  return(df)
}


ui <- fluidPage(
  fluidRow(
    column(width = 2,
           tags$div(
             style = "background-color: #F0F0F0; border-radius: 5px; padding: 5px;",
             actionButton("Login", "Login", width = "100%"),
             br(),
             radioButtons(
               inputId = "Choix",
               label = "Choose the file format:",
               choices = c(".xlsx", ".txt",".csv",".ods"),
               inline = TRUE
             ),
             br(),
             fileInput(inputId = "file", label = "Choose a file.",accept = c(".xlsx", ".txt")),
             br(),
             actionButton("validateBtn", "Load data"),
             br(),
             textOutput(outputId = "a"),
             br(),
             actionButton("Validate", "Save and send", width = "100%"),
             br(),
             htmlOutput("b")
           )
    ),
    column(width = 10,
           tags$img(src="https://www.soiltempproject.com/wp-content/uploads/2022/05/soiltemp.png", height=100, width=100,
                    style="float: right;"),
           align = "center",
           div(
             textOutput(outputId = "message1"),
             tags$head(tags$style("#message1{color: green;
                                   font-size: 20px;
                                   font-style: italic;
                                   }")),
             htmlOutput("colonne"),
             textOutput("Validation"),
             tags$head(tags$style("#Validation{color: green;
                                   font-size: 20px;
                                   font-style: italic;
                                   }")),
             style = "display: table; margin: 0 auto;"
           ),
           leafletOutput("map"),
           div(
             class = "row",
             div(
               class = "col-md-4",
               htmlOutput("result"),
               tags$head(tags$style("#result{color: green;
                          font-size: 20px;
                          font-style: bold;
                          }")),
               br(),
               htmlOutput("result2"),
               tags$head(tags$style("#result2{color: darkred;
                          font-size: 20px;
                          font-style: bold;
                          }")),
               br(),
               htmlOutput("result3"),
               tags$head(tags$style("#result3{color: blue;
                          font-size: 20px;
                          font-style: bold;
                          }"))
             ),
             div(
               class = "col-md-4",
               plotOutput("myplot")
             ),
             div(
               class = "col-md-4",
               mainPanel(
                 tableOutput("output_result")
               ),
               style = "padding: 20px 0 0 20px;"
             ),
             style = "display: flex;"
           )
    )
  ) )                

server <- function(input, output, session) {
  ##### DEBUT LISTE ####
  Tree_app=list(
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
      #### >> METADATA ####
      Metadata = list(
        meta_id = list(
          detect = list(),
          df = data.frame(  )
          #possible error: Null, NotUnique 
        ),
        Country_code = list(
          detect = list(),
          df = data.frame(  )
          #possible error: Null, Notexist
        ),
        Experiment_name = list(
          detect = list(),
          df = data.frame(  )
          #possible error : TooLong, Null
          
        ),
        Experimental_manipulation = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        Experiment_insitu = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        Experiment_climate = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        Experiment_citizen = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        Experiment_design = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Experiment_DOI = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong, NotURL
        ),
        Experiment_comment = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Sites_iD = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Elevation = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooSmall, TooBig
        ),
        Habitat_type = list(
          detect = list(),
          df = data.frame(  )
        ),
        Habitat_sub_type = list(
          detect = list(),
          df = data.frame(  )
        ),
        Sites_comment = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Logger_code = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Raw_data_identifier = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Latitude = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooSmall, TooBig
        ),
        Longitude = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooSmall, TooBig
        ),
        EPSG = list(
          detect = list(),
          df = data.frame(  )
        ),
        GPS_Accuracy = list(
          detect = list(),
          df = data.frame(  )
        ),
        Logger_serial_number = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Logger_brand = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Logger_type = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Logger_age = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Logger_comment = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Sensor_code = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Sensor_shielding = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        Sensor_shielding_type = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        Microclimate_measurement = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotInList
        ),
        Unit = list(
          detect = list(),
          df = data.frame(  )
        ),
        Sensor_accuracy = list(
          detect = list(),
          df = data.frame(  )
        ),
        Temporal_resolution = list(
          detect = list(),
          df = data.frame(  )
        ),
        Sensor_height = list(
          detect = list(),
          df = data.frame(  )
        ),
        Sensor_length = list(
          detect = list(),
          df = data.frame(  )
        ),
        Start_date_year = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooSmall, TooBig
        ),
        Start_date_month_day = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotPossible
        ),
        End_date_year = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooSmall, TooBig
        ),
        End_date_month_day = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotPossible
        ),
        Timezone = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotInList
        ),
        Time_difference = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooSmall, TooBig
        ),
        Licence = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotInList
        ),
        Sensor_comments = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Species_composition = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        Species_trait = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
          
        ) 
      ),
      ##### >> PEOPLE ####
      People = list(
        Firstname = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Lastname = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Middlename_initials = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Email = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong, Not@
        ),
        Second_email = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong, Not@
        ),
        OrcID = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        SoilTemp_update = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotBoolean
        ),
        meta_id = list(
          detect = list(),
          df = data.frame(  )
        ),
        Status_timeseries = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotInList
        ),
        survey_id = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Status_species_data = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotInList
        ),
        Comments = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        )
      ),
      ##### >> SPECIES DETAILS ####
      Species_Details = list(
        Site_id = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, NotTheSame(?)
        ),
        Species_name = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Species_trait = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Species_trait_unit = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Species_trait_value = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        Comments = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        )
      ),
      #### >> SPECIES DATA ####
      Species_Data = list(
        Survey_id = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, 
        ),
        Site_id = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, toolong
        ),
        Species_name = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, toolong
        ),
        Presence = list(
          detect = list(),
          df = data.frame(  )
          #Possible error :Null, toolong
        ),
        Biomass = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, toolong
        ),
        Biomass_unit = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, 
        ),
        Cover = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Cover_scale = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Cover_unit = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        LAI = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Density = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Density_unit = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Vegetation_layer = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Comments = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        )
      ),
      #### >> SPECIES METADATA ####
      Species_Metadata = list(
        Site_id = list(
          detect = list(),
          df = data.frame(  )
        ),
        Observation_date_year = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Observation_date_month_day = list(
          detect = list(),
          df = data.frame(  )
          #possible error :Null,
        ),
        Plot_size = list(
          detect = list(),
          df = data.frame(  )
          #possible error :Null,
        ),
        Survey_method_short = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Survey_method_long = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Multilayer_vegetation = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        Taxonomic_reference = list(
          detect = list(),
          df = data.frame(  )
          #possible error :  Null,
        ),
        "Total biomass" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Total biomass unit" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Cover unit" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Total plant cover" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Cover E3: Tree_app layer" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Cover E2: shrub layer" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Cover E1: herb layer" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Cover E0: moss layer" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Cover rock" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Cover baresoil" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        LAI = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "LAI unit" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Species richness" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Height E3: Tree_app layer" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Height E2: shrub layer" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Height E1: herb layer " = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null,
        ),
        "Soil bulk density" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, toolong
        ),
        "Soil bulk density unit" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, toolong
        ),
        Other  = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, Toolong
        ),
        "Other unit" = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, TooLong
        ),
        DOI = list(
          detect = list(),
          df = data.frame(  )
          #possible error : Null, Toolong
        ),
        Licence = list(
          detect = list(),
          df = data.frame(  )
          #possible error :Null, TooLong
        ),
        Comment = list(
          detect = list(),
          df = data.frame(  )
          #possible error :Null, TooLong
        )
        
      )
    )
  )
  #### FIN LISTE ####
  lire_excel <- function() {
    req(input$file)
    df <- read_excel(input$file$datapath, sheet = "RawData")
    df$Date <- as.Date(paste(df$Year, df$Month, df$Day, sep = "-"))
    df$sensor <- factor(df$sensor)
    df_agregees <- df %>% 
      group_by(sensor) %>% 
      summarise(dateDebut = min(Date), dateFin = max(Date), nombre_NA = sum(is.na(Temperature) & !is.na(sensor)))
    
  }
  
  
  
  data <- reactive({
    req(input$file)
    sheet_name <- "Species data"
    read_excel(input$file$datapath, sheet = sheet_name)
  })
  observeEvent(input$validateBtn, {
    
    output$a <- renderText("Please check your data before validating them.")
    fichier_excel <- input$file$datapath
    people_data <- read_excel(fichier_excel, sheet = "People")[-1,]
    Metadata <- read_excel(fichier_excel, sheet = "Metadata")[-1,]
    Species_details <- read_excel(fichier_excel, sheet = "Species details")[-1,]
    Species_data <- read_excel(fichier_excel, sheet = "Species data")[-1,]
    Species_metadata <- read_excel(fichier_excel, sheet = "Species metadata")[-1,]
    RawData = read_excel(fichier_excel, sheet = "RawData")
    #### CHECK FEUILLE ####
    feuilles_obligatoires <- c("Metadata", "People", "Species data", "Species details", "Species metadata")
    feuilles_excel <- excel_sheets(input$file$datapath)
    feuilles_manquantes <- setdiff(feuilles_obligatoires, feuilles_excel)
    if (length(feuilles_manquantes) > 0) {
      message <- paste0("Error: The following sheets are missing from the file: ", 
                        paste(feuilles_manquantes, collapse = ", "))
      output$message1 <- renderText(message)
    } else {
      output$message1 <- renderText("All sheets are present in the file")
    }
    
    
    #### ####
    output$colonne <- renderUI({
      HTML("All the columns are present. <br>
Page Metadata Complete <br>
Page People Complete <br>
Page Species Data Complete <br>
Page Species metadata Complete.")
      
    })
    
    
    
    output$result <- renderUI({
      col <- "Site_id"
      values <- Species_data[[col]][2:length(Species_data[[col]])]
      col2 <- "Species_name"
      values2 <- Species_data[[col2]][2:length(Species_data[[col2]])]
      HTML("The number of different sites is:", n_distinct(values), " <br> 
      The number of different Species_name is:", n_distinct(values2))
      
      
      
    })
    output$result2 <- renderUI({
      col <- "sensor"
      values <- RawData[[col]][2:length(RawData[[col]])]
      col2 <- "mesure"
      values2 <- RawData[[col2]][2:length(RawData[[col2]])]
      HTML("The number of different sensor is:", n_distinct(values), " <br> 
      The number of different mesure is:", n_distinct(values2))
      
      
      
    })
    output$result3 <- renderUI({
      col <- "survey_id"
      col2 <- "Species_name"
      values <- Species_metadata[[col]][2:length(Species_metadata[[col]])]
      HTML("The number of different vegetation surveys is:",n_distinct(values)) 
      
      
    })
    output$map <- renderLeaflet({
      req(input$file)
      df <- Metadata
      df$Latitude <- as.numeric(as.character(df$Latitude))
      df$Longitude <- as.numeric(as.character(df$Longitude))
      mymap <- leaflet(df) %>%
        addTiles() %>%
        addCircleMarkers(
          lat = ~Latitude,
          lng = ~Longitude,
          radius = 8,
          color = "red",
          fillOpacity = 0.8,
          popup = paste("Latitude: ", ~Latitude, "Longitude: ", ~Longitude)
        )
      
      mymap
    })
    output$myplot <- renderPlot({
      df_agregees <- lire_excel()
      ggplot(df_agregees, aes(x = dateDebut, xend = dateFin, y = as.factor(sensor), yend = as.factor(sensor))) +
        geom_segment(size = 2) +
        scale_x_date(date_labels = "%Y-%m-%d") +
        labs(x = "Date", y = "Sensor") +
        theme_bw()
    })
    Tree_app$Format$Metadata$Experiment_name$df <- LongueurDF(Metadata, "Experiment_name", 100)
    Tree_app$Format$Metadata$Country_code$df = LongueurDF(Metadata, "Country_code",0)
    Tree_app$Format$Metadata$meta_id$df
    Tree_app$Format$Metadata$Country_code$df = LongueurDF(Metadata, "Country_code",5)
    
    Tree_app$Format$Metadata$Experiment_name$df = LongueurDF(Metadata, "Experiment_name",10)
    Tree_app$Format$Metadata$Experiment_name$df
    
    Tree_app$Format$Metadata$Experimental_manipulation$df = YesNoDF(Metadata, "Experimental_manipulation")
    Tree_app$Format$Metadata$Experiment_insitu$df = YesNoDF(Metadata, "Experiment_insitu")
    Tree_app$Format$Metadata$Experiment_climate$df = YesNoDF(Metadata, "Experiment_climate")
    Tree_app$Format$Metadata$Experiment_citizens$df = YesNoDF(Metadata, "Experiment_citizens")
    Tree_app$Format$Metadata$Experiment_design$df = LongueurDF(Metadata, "Experiment_design",200)  
    Tree_app$Format$Metadata$Experiment_DOI$df = URLDF(Metadata, "Experiment_doi")
    Tree_app$Format$Metadata$Experiment_comment$df = ExisteDF(Metadata, "Experiment_comment")
    Tree_app$Format$Metadata$Sites_iD$df = LongueurDF(Metadata, "Site_id",200) 
    Tree_app$Format$Metadata$Elevation$df = MinMaxDF(Metadata, "Elevation",-10000,10000)
    Tree_app$Format$Metadata$Habitat_type$df = MinMaxDF(Metadata, "Habitat_type",1,18)
    Tree_app$Format$Metadata$Habitat_sub_type$df = VerifierHabitat(Metadata, "Habitat_type","Habitat_sub_type")
    Tree_app$Format$Metadata$Sites_comment$df = ExisteDF(Metadata, "Site_comments")  
    Tree_app$Format$Metadata$Logger_code$df = LongueurDF(Metadata, "Logger_code",200)  
    Tree_app$Format$Metadata$Raw_data_identifier$df = LongueurDF(Metadata, "Raw_data_identifier",200)  
    Tree_app$Format$Metadata$Latitude$df  = MinMaxDF(Metadata, "Latitude",-180,180)
    Tree_app$Format$Metadata$Longitude$df  = MinMaxDF(Metadata, "Longitude",-180,180)
    Tree_app$Format$Metadata$EPSG$df = MinMaxDF(Metadata, "EPSG",0,7000)
    Tree_app$Format$Metadata$GPS_Accuracy$df = MinMaxDF(Metadata, "GPS_accuracy",0,500)
    Tree_app$Format$Metadata$Logger_serial_number$df = LongueurDF(Metadata, "Logger_serial_number",200)
    Tree_app$Format$Metadata$Logger_brand$df = LongueurDF(Metadata, "Logger_brand",200)  
    Tree_app$Format$Metadata$Logger_type$df = LongueurDF(Metadata, "Logger_type",200)  
    Tree_app$Format$Metadata$Logger_age$df = LongueurDF(Metadata, "Logger_age",200)  
    Tree_app$Format$Metadata$Logger_comment$df = ExisteDF(Metadata, "Logger_comment") 
    Tree_app$Format$Metadata$Sensor_code$df = LongueurDF(Metadata, "Logger_code",200) 
    Tree_app$Format$Metadata$Sensor_shielding$df = YesNoDF(Metadata, "Sensor_shielding") 
    Tree_app$Format$Metadata$Sensor_shielding_type$df = YesNoDF(Metadata, "Sensor_shielding_type")
    Tree_app$Format$Metadata$Microclimate_measurement$df = InList(Metadata, "Microclimate_measurement",ListeClimate)
    Tree_app$Format$Metadata$Unit$df = LongueurDF(Metadata,"Unit",5)
    Tree_app$Format$Metadata$Sensor_accuracy$df = LongueurDF(Metadata,"Sensor_accuracy",5)
    Tree_app$Format$Metadata$Temporal_resolution$df = LongueurDF(Metadata,"Temporal_resolution",5)
    Tree_app$Format$Metadata$Sensor_height$df = MinMaxDF(Metadata, "Sensor_height", -9999, 9999)
    Tree_app$Format$Metadata$Sensor_length$df = MinMaxDF(Metadata, "Sensor_length", -9999, 9999)
    Tree_app$Format$Metadata$Start_date_year$df = AnneeDF(Metadata,"Start_date_year",1900)
    Tree_app$Format$Metadata$Start_date_month_day$df = DateValide(Metadata,"Start_date_month","Start_date_day")
    Tree_app$Format$Metadata$End_date_year$df = AnneeDF(Metadata,"End_date_year",1900)
    Tree_app$Format$Metadata$End_date_month_day$df = DateValide(Metadata,"End_date_month","End_date_day")
    Tree_app$Format$Metadata$Timezone$df = 
      Tree_app$Format$Metadata$Time_difference$df = MinMaxDF(Metadata, "Time_difference",-12,14)
    Tree_app$Format$Metadata$Licence$df = InList(Metadata, "Licence", ListeLicence)
    Tree_app$Format$Metadata$Sensor_comments$df = ExisteDF(Metadata, "Sensor_comments")
    Tree_app$Format$Metadata$Species_composition$df = YesNoDF(Metadata, "Species_composition")
    Tree_app$Format$Metadata$Species_trait$df = YesNoDF(Metadata, "Species_trait")
    
    
    
    
    
    
    
    
    
    
    
    
    
    #### PEOPLE ####
    Tree_app$Format$People$Firstname$df = LongueurDF(People, "Firstname", 200)
    Tree_app$Format$People$Lastname$df = LongueurDF(People, "Lastname", 2)
    Tree_app$Format$People$Middlename_initials$df = LongueurDF(People, "Middlename_initials", 5)
    Tree_app$Format$People$Email$df = EmailDF(People, "Email", 20)
    Tree_app$Format$People$Second_email$df = EmailDF(People, "Second_email", 20)
    Tree_app$Format$People$OrcID$df = LongueurDF(People, "OrcID", 5)
    Tree_app$Format$People$SoilTemp_update$df = YesNoDF(People, "SoilTemp_update")
    Tree_app$Format$People$meta_id$df = LongueurDF(People, "meta_id",10)
    Tree_app$Format$People$Status_timeseries$df = InList(People, "Status_timeseries", ListePeople)
    Tree_app$Format$People$survey_id$df = LongueurDF(People, "survey_id", 20)
    Tree_app$Format$People$Status_species_data$df = InList(People, "Status_species_data", ListePeople)
    Tree_app$Format$People$Comments$df = ExisteDF(People, "Comment")
    
    
    #### SPECIES DETAILS ####
    
    Tree_app$Format$Species_Details$Site_id$df
    Tree_app$Format$Species_Details$Species_name$df = LongueurDF(Species_details, "Species_name", 200)
    Tree_app$Format$Species_Details$Species_trait$df = LongueurDF(Species_details, "Species_trait", 200)
    Tree_app$Format$Species_Details$Species_trait_unit$df = LongueurDF(Species_details, "Species_trait_unit", 200)
    Tree_app$Format$Species_Details$Species_trait_value$df = LongueurDF(Species_details, "Species_trait_value", 200)
    Tree_app$Format$Species_Details$Comments$df = ExisteDF(Species_details, "Comments")
    
    #### SPecies Data ####
    
    Tree_app$Format$Species_Data$Survey_id$df
    Tree_app$Format$Species_Data$Site_id$df = LongueurDF(Species_data,"Site_id",200)
    Tree_app$Format$Species_Data$Species_name$df = LongueurDF(Species_data, "Species_name",200)
    Tree_app$Format$Species_Data$Presence$df = LongueurDF(Species_data, "Presence",200)
    Tree_app$Format$Species_Data$Biomass$df = LongueurDF(Species_data, "Biomass",200)
    Tree_app$Format$Species_Data$Biomass_unit$df = LongueurDF(Species_data, "Biomass_unit",200)
    Tree_app$Format$Species_Data$Cover$df = LongueurDF(Species_data, "Cover",200)
    Tree_app$Format$Species_Data$Cover_scale$df = LongueurDF(Species_data, "Cover_scale",200)
    Tree_app$Format$Species_Data$Cover_unit$df = LongueurDF(Species_data, "Cover_unit",200)
    Tree_app$Format$Species_Data$LAI$df = LongueurDF(Species_data, "LAI",200)
    Tree_app$Format$Species_Data$Density$df = LongueurDF(Species_data, "Density",200)
    Tree_app$Format$Species_Data$Density_unit$df = LongueurDF(Species_data, "Density_unit",200)
    Tree_app$Format$Species_Data$Vegetation_layer$df = MinMaxDF(Species_data, "Vegetation layer",1,8)
    Tree_app$Format$Species_Data$Comments$df = ExisteDF(Species_data, "Comments")
    
    
    #On affiche les datasframes remplis
    result <- capture.output({
      afficherDataframesRemplis(Tree_app)
    })
    
    output$output_result <- renderTable({
      if (length(result) > 0) {
        data.frame(Resultat = result)
      } else {
        data.frame(Resultat = "Aucune erreur")
      }
    })
  })

    
  observeEvent(input$Validate, {
    output$b <- renderUI({
      HTML("Here is your DOI: <br> <br> <b><span style='color:red;font-size:larger;'>10.1128/spectrum.04578-22</span></b>
            <br><br> An email has been sent to you with all the information.")
    })
    
  })
  
  
}

shinyApp(ui, server)
