


Fichier1 = "ExcelTestGeneral.xlsx"

#### Fonction ####

verifier_feuilles <- function(fichier_excel, feuilles_obligatoires) {
  feuilles_excel <- excel_sheets(fichier_excel)
  feuilles_manquantes <- setdiff(feuilles_obligatoires, feuilles_excel)
  if (length(feuilles_manquantes) > 0) {
    stop("Les feuilles suivantes sont manquantes dans le fichier '", fichier_excel, "': ", paste(feuilles_manquantes, collapse = ", "))
  }
  
  print("Format des feuilles correct")
}


verification_colonnes <- function(nom_feuille, liste_colonnes) {
  feuille <- read_excel(Fichier1, sheet = nom_feuille)
  noms_colonnes_feuille <- colnames(feuille)
  if(all(liste_colonnes %in% noms_colonnes_feuille)) {
    print("Le format des colonnes est correct.")
  } else {
    noms_manquants = setdiff(liste_colonnes, noms_colonnes_feuille)
    message("Erreur : les colonnes suivantes sont manquantes : ", paste(noms_manquants, collapse = ", "))
  }
}

Longueur = function(valeur, longueur_max) {
  ifelse(nchar(as.character(valeur)) <=  longueur_max, 
         {
           message(paste0(valeur, " est correct"))
           return(TRUE)
         },
         {
           message(paste0(valeur, " est trop long. Longueur max = ", longueur_max))
           return(FALSE)
         }
  )
}


MinMax = function(valeur, min, max) {
  ifelse(as.numeric(valeur) >=  as.numeric(min) && as.numeric(valeur) <=  as.numeric(max),
         {
           message(paste0(valeur, " est correct"))
           return(TRUE)
         },
         {
           message(paste0(valeur, " est hors limite. Valeur autorisée entre ", min, " et ", max))
           return(FALSE)
         }
  )
}


YesNo = function(valeur) {
  minuscule = tolower(substr(as.character(valeur), 1, 1))
  if (minuscule == "y" || minuscule == "n") {
    return(TRUE)
  } else {
    return(FALSE)
  }
}



NullOrNot = function(fichier, colonne) {
  if (any(is.na(fichier[2:nrow(fichier), colonne]))) {
    stop(paste("La colonne", colonne, "contient des valeurs manquantes."))
  } else {
    message(paste("La colonne", colonne, "ne contient pas de valeurs manquantes."))
  }
}
DateValide  =  function(mois, jour) {
  if (mois < 1 || mois > 12) {
    message(paste0("Le mois ", mois, " est inexistant "))
    return(FALSE)
  }
  if (jour < 1 || jour > 31) {
    message(paste0("Le jour ", jour, " est inexistant "))
    return(FALSE)
  }
  if (mois == 2 && jour > 29) {
    message("Février ne contient pas plus de 29 jours")
    return(FALSE)
  } else if ((mois == 4 || mois == 6 || mois == 9 || mois == 11) && jour > 30) {
    message(paste0("Le mois ", mois, " ne contient pas plus de 30 jours"))
    return(FALSE)
  }
  message(paste0(jour, "/", mois, " est une date valide"))
  return(TRUE)
}

ListeValide  =  function(colonne, liste) {
  sep  =  "/"
  colonne  =  as.character(colonne)
  colonne_sep  =  strsplit(colonne, sep)
  valide  =  sapply(colonne_sep, function(x) any(trimws(x) %in% trimws(liste)))
  if (any(!valide)) {
    message("Les valeurs suivantes ne sont pas dans la liste :")
    message(colonne[!valide])
    return(FALSE)
  } else {
    message("Toutes les valeurs sont dans la liste")
    return(TRUE)
  }
}
CountryCode <- function(lat, long) {
  countries <- getMap(resolution = "low")
  points <- data.frame(x = as.numeric(long), y = as.numeric(lat))
  
  coordinates(points) <- c("x", "y")
  proj4string(points) <- CRS(proj4string(countries))
  result <- over(points, countries)
  
  return(as.character(result$ISO_A2[1]))
}



UseContrainte2  =  function(colonne1, colonne2, contrainte, ...) {
  liste  =  Fichier2[2:nrow(Fichier2), c(colonne1, colonne2), drop = FALSE]
  resultat  =  apply(liste, 1, function(x) contrainte(x[1], x[2], ...))
  print(resultat)
}



UseContrainte = function(colonne, contrainte, ...) {
  liste = Fichier2[2:nrow(Fichier2), colonne, drop = FALSE]
  resultat = sapply(liste[[colonne]], contrainte, ...)
  print(resultat)
}


#### LISTE ####
Feuille = c("Metadata", "People", "Species data", "Species details", "Species metadata")

ColonnePeople = c("Firstname","Middlename_initials","Lastname","Coauthor_name","Email","Second_email","OrcID","SoilTemp_update")

ColonneSpDat = c('Species_name', 'Presence', 'Biomass', 'Biomass_unit', 'Cover',
                 'Cover_scale', 'Cover_unit', 'LAI',
                 'Density', 'Density_unit', 'Comments')

ColonneSpDet = c('Species_trait', 'Species_trait_unit', 'Species_trait_value', 'Comments')

ColonneMeta = c('Country_code', 'Experiment_name', 'Experimental_manipulation', 'Experiment_insitu', 'Experiment_climate', 
                'Experiment_citizens', 'Experiment_design', 'Experiment_doi', 'Experiment_comment', 'Site_id', 'Longitude',
                'Latitude', 'Elevation', 'Habitat_type', 'Habitat_sub_type', 'Experiment_name', 'Site_comments',
                'Sensor_shielding', 'Sensor_shielding_type', 'Microclimate_measurement', 'Unit', 'Sensor_accuracy', 
                'Temporal_resolution', 'Sensor_height', 'Sensor_length', 'Timezone', 
                'Licence', 'Sensor_comments', 'Logger_serial_number', 'Logger_brand', 'Logger_type', 'Logger_age', 'Logger_comment' )

ColonneSpMeta = c('Observation_date_year', 'Observation_date_month', 'Observation_date_day', 'Plot_size', 
                  'Survey_method_short', 'Survey_method_long', 'Taxonomic reference', 'Total biomass', 
                  'Total biomass unit', 'Total cover', 'Total cover unit', 'LAI', 'LAI unit', 'Species richness', 
                  'Multilayer vegetation', 'Other', 'Other unit', 'Other', 'Other unit', 'Other', 'Other unit', 
                  'DOI', 'Licence', 'Comment')

ListeLicence = c("CC-Zero", "CC-BY", "CC-BY-SA", "CC-BY-ND", "CC-BY-NC", 
                 "CC-BY-NC-SA", "CC-BY-NC-ND", "C")

ListePeople = list("Owner", "to co-author", "Contact", "to ackowledge")


ListeClimate = c("Temperature","Soil_moisture","Relative_humidity")



#### > SPECIES DETAILS ####

#### >> Species_trait #####



#### >> Species_name ####
NullOrNot(Fichier2, "Species_name")
#### >> Species_trait ####
NullOrNot(Fichier2, "Species_trait")
UseContrainte("Species_trait",Longueur,50)
#### >> Species_trait_unit ####
UseContrainte("Species_trait_unit",Longueur,50)
#### >> Species_trait_value ####
UseContrainte("Species_trait_value",MinMax,-9999,9999)
#### >> Comments ####
UseContrainte("Comments",Longueur,5000)


