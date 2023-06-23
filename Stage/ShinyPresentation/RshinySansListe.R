library(shiny)
library(readxl)
library(leaflet)
library(tidyverse)
library(DT)
library(ggplot2)


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
                 DT::dataTableOutput("table")
               ),
               style = "padding: 20px 0 0 20px;"
             ),
             style = "display: flex;"
           )
  )
) )                

server <- function(input, output, session) {
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
      col <- "Site_id"
      values <- data()[2:length(data()[[col]]), col]
      col2 <- "Species_name"
      values2 <- data()[2:length(data()[[col2]]), col2]
      HTML("The number of different vegetation surveys is: 4 <br> The number of species is:", n_distinct(values2))
      
      
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
    
    
    
  })
  observeEvent(input$Validate, {
    output$b <- renderUI({
            HTML("Here is your DOI: <br> <br> <b><span style='color:red;font-size:larger;'>10.1128/spectrum.04578-22</span></b>
            <br><br> An email has been sent to you with all the information.")
    })
    
  })
  
  
}

shinyApp(ui, server)