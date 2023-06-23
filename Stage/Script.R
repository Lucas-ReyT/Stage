##### PACKAGE & Contrainte #####

library(tidyverse)
library(readxl)
library(rworldmap)
source("Contrainte.R")
##### > 1.1 Soumission des données ####

#On charge ici notre fichier
#A remplacer ensuite pour la Shinyapp



#### >> PARTIE TEST TEMPORAIRE ####


#Type de fichier incorrect
#Fichier1 = "Test.xlsxx"


#Test avec tout qui correspond
Fichier1 = "ExcelTestGeneral.xlsx"

#Test sans une feuille
#Fichier1 = "TestSansMetadata.xlsx"

#Test avec une colonnes manquantes
#Fichier1= "TestColonneManquante.xlsx"

#Test avec plusieurs colonnes manquantes
#Fichier1= "TestColonneManquante2.xlsx"

#Type de fichier incorrect
#Fichier1 = "Test.xlsss"


#### >>> 1.1.1 Charge Fichier ####

# On récupère l'extension du fichier 
Extension = tools::file_ext(Fichier1)

# On charge le fichier selon son extension
#(A RAJOUTER : XLS, ODS)
if (Extension == "txt") {
  data = read_delim(Fichier1, delim = "\t")
} else if (Extension == "xlsx") {
  data = read_excel(Fichier1)
} else if (Extension == "xls") {
  data = read_excel(Fichier1)
} else if (Extension == "csv") {
  data = read_csv(Fichier1)
} else {
  stop("Ce format de fichier n'est pas pris en compte par notre application.")
}


#### >>> 1.1.2 Format entré ####

# Actions à effectuer en fonction du type de fichier
if (Extension == "txt") {
  #
  
  #### >>>> 1.1.2.1 XLSX ####  
} else if (Extension == "xlsx") {
  
  
  
  verifier_feuilles(Fichier1,Feuille)
  #### PEOPLE ####
  
  #### > Colonne ####
  verification_colonnes("People", ColonnePeople)
  Fichier1 = "ExcelTestGeneral.xlsx"
  Fichier2 =  read_excel(Fichier1, sheet =  "People")
  #### > Contrainte ####
  
  #### >> FIRSTNAME ####
  #Not Null
  NullOrNot(Fichier2, "Firstname")
  # Longueur 
  UseContrainte("Firstname", Longueur, 200)
  #### >> LASTNAME ####
  NullOrNot(Fichier2,"Lastname")
  # Longueur
  UseContrainte("Lastname", Longueur, 200)
  #### >> CHECK EMAIL ####
  NullOrNot(Fichier2,"Email")
  # Longueur
  UseContrainte("Email", Longueur, 200)
  #Check présence @ 
  if (all(sapply(Fichier2$Email[2:nrow(Fichier2)], grepl, pattern = "@"))) {
    message("Mail valide")
  } else {
    message("Mail non valide (Pas @)")
  }
  #### >> CHECK Second Mail ####
  UseContrainte("Second_email", Longueur, 200)
  #### >> Check ORcID ####
  UseContrainte("OrcID", Longueur, 50)
  #### >> Check SoilTemp_Update ####
  UseContrainte("SoilTemp_update", YesNo)
  #### >> Check  Statut ####
  UseContrainte("Status_timeseries", ListeValide, ListePeople )
  #### >> Check  Status_species_data ####
  UseContrainte("Status_species_data", ListeValide, ListePeople )
  #### RAJOUTER META ID et SURVEY ID ####
  
  
  
  
  
  
  
  
  
  
  
  
  #### METADATA ####
  
    
  #### > Colonne ####
  verification_colonnes("Metadata", ColonneMeta)
  #### > Contrainte ####
  Fichier2 =  read_excel(Fichier1, sheet =  "Metadata")
  #### >> Meta_id ####
  NullOrNot(Fichier2, "meta_id")
  #### >> Check Latitude ####
  NullOrNot(Fichier2,"Latitude")
  UseContrainte("Latitude", MinMax, -180, 180)
  #### >> Check Longitude ####
  NullOrNot(Fichier2,"Longitude")
  UseContrainte("Longitude", MinMax, -180, 180)
  #### >> Check Country Code cohérent ####
  Pays=UseContrainte2("Latitude","Longitude",CountryCode)
  if (identical(Pays, Fichier2$Country_code[2:nrow(Fichier2)])) {
    message("Les codes de pays correspondent")
  } else {
    message("Les codes de pays ne correspondent pas")
  }
  #### >> Check Elevation ####
  NullOrNot(Fichier2,"Elevation")
  UseContrainte("Elevation", MinMax, -10000, 10000)
  #### >> Check Habitat_type ####
  UseContrainte("Habitat_type", MinMax, 1, 18)
  #### >> Check Habitat_sub_type ####
  UseContrainte("Habitat_sub_type", MinMax, 1, 18)
  #### >> Check Site_comments ####
  UseContrainte("Site_comments", Longueur, 200)
  #### >> Site_id ####
  UseContrainte("Site_id", Longueur, 200)
  #### >> Sensor_shieldsing ####
  UseContrainte("Sensor_shielding", YesNo)
  #### >> Sensor_shielding_type ####
  UseContrainte("Sensor_shielding_type", YesNo)
  #### >> Sensor_height ####
  UseContrainte("Sensor_height", MinMax, -9999, 9999)
  #### >> Sensor_length ####
  UseContrainte("Sensor_length", MinMax, -9999, 9999)
  #### >> Start_date_day Start_date_month ####
  UseContrainte2("Start_date_month","Start_date_day",DateValide)
  #### >> Start_date_day Start_date_month ####
  UseContrainte2("End_date_month","End_date_day",DateValide)
  #### >> Licence ####
  UseContrainte("Licence", ListeValide, ListeLicence )
  #### >> Sensor_comments ####
  UseContrainte("Sensor_comments", Longueur, 2000)
  #### >> Logger_code ####
  NullOrNot(Fichier2,"Logger_code")
  # Longueur
  UseContrainte("Logger_code", Longueur, 50)
  #### >> Logger_serial_number####
  UseContrainte("Logger_serial_number", Longueur, 50)
  #### >> Logger_brand####
  UseContrainte("Logger_brand", Longueur, 20)
  #### >> Logger_type####
  UseContrainte("Logger_type", Longueur, 20)
  #### >> Logger_age ####
  UseContrainte("Logger_age", Longueur, 10)
  #### >> Logger_comment ####
  UseContrainte("Logger_comment", Longueur, 5000)
  #### >> Experiment_name ####
  UseContrainte("Experiment_name", Longueur, 200)
  #### >> Experimental_manipulation ####
  UseContrainte("Experimental_manipulation", YesNo)
  #### >> Experiment_insitu ####
  UseContrainte("Experiment_insitu", YesNo)
  #### >> Experiment_climate ####
  UseContrainte("Experiment_climate", YesNo)
  #### >> Experiment_citizens ####
  UseContrainte("Experiment_citizens", YesNo)
  #### >> Experiment_design ####
  UseContrainte("Experiment_design", Longueur, 10000)
  #### >> Experiment_doi ####
  UseContrainte("Experiment_doi", Longueur, 500)
  #### >> Experiment_comment ####
  UseContrainte("Experiment_comment", Longueur, 5000)
  #### >> MicroClimate ####
  UseContrainte("Microclimate_measurement", ListeValide, ListeClimate )
  
  #### RAJOUTER EPSG GPS-Accuracy   
  
  
  
  ####  SPECIES DATA ####
  Fichier2 =  read_excel(Fichier1, sheet =  "Species data")
  #### > Colonne ####
  verification_colonnes("Species data", ColonneSpDat)
  #### > Contrainte ####
  #### >> Site_id ####
  NullOrNot(Fichier2, "Site_id")
  #### >> Species_name ####
  NullOrNot(Fichier2,"Species_name")
  #### >> Presence ####
  UseContrainte("Presence", YesNo)
  #### >> Biomass ####
  UseContrainte("Biomass", MinMax, 0, 10^15)
  #### >> Cover ####
  UseContrainte("Cover", MinMax, 0, 999)
  #### >> Cover_scale ####
  UseContrainte("Cover_scale", Longueur, 10)
  #### >> Cover_unit ####
  UseContrainte("Cover_unit", MinMax, 0, 100)
  #### >> LAI ####
  UseContrainte("LAI", Longueur, 10)
  #### >> Density ####
  UseContrainte("Density", MinMax, 0, 10^6)
  #### >> Density_unit ####
  UseContrainte("Density_unit", Longueur, 10)
  #### >> Comments ####
  UseContrainte("Comments", Longueur, 5000)
  
  
  
  
  #### SPECIES METADATA ####
  Fichier2 =  read_excel(Fichier1, sheet =  "Species metadata")
  #### > Colonne ####
  verification_colonnes("Species metadata", ColonneSpMeta)
  #### > Contrainte #### 
  #### >> MoisJour ####
  UseContrainte2("Observation_date_month","Observation_date_day",DateValide)
  #### >> Plot_size ####
  UseContrainte("Plot_size", MinMax, 0, 1000)
  #### >> Survey_method_short ####
  UseContrainte("Survey_method_short", Longueur,100)
  #### >> Survey_method_long ####
  UseContrainte("Survey_method_long", Longueur,5000)
  #### >> Taxonomic reference ####
  UseContrainte("Survey_method_long", Longueur,50)
  #### >> Total biomass ####
  UseContrainte("Total biomass", MinMax, 0, 10^15)
  #### >>  Total biomass unit ####
  UseContrainte("Total biomass unit", Longueur, 10)
  #### >> Total cover ####
  UseContrainte("Total cover", MinMax, 0, 999)
  #### >>  Total cover unit ####
  UseContrainte("Total cover unit", Longueur, 10)
  #### >> LAI cover ####
  UseContrainte("LAI", MinMax, 0, 100)
  #### >>  LAI cover unit ####
  UseContrainte("LAI unit", Longueur, 10)
  #### >> REVOIR Species richness ####
  UseContrainte("LAI unit", Longueur, 10)
  #### >>  Multilayer vegetation ####
  UseContrainte("Multilayer vegetation", YesNo)
  #### >> Species richness ####
  UseContrainte("Species richness", MinMax, 0, 10^50)
  #### >> Other ####
  #### >> Other unit #### 
  #### >> Licence ####
  UseContrainte("Licence", ListeValide, ListeLicence )
  #### >> Comments ####
  UseContrainte("Comment", Longueur, 5000)
  
  
  
  
  
  
  
  
  
  
  
  ####  SPECIES DETAILS ####
  verification_colonnes("Species details", ColonneSpDet)
  
  
  
  }else if (Extension == "csv") {
  #
  }

