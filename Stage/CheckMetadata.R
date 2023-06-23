
library(readxl)
Fichier2 <- "Test3.xlsx"
donnees <- read_excel(Fichier2, sheet = "Metadata")




Logger <- as.character(donnees$Logger_code[2:nrow(donnees)])
print(Logger)
print(unique(Logger[1]))

for (element in unique(Logger)) {
  print(element)
}


Microclimate = unique((donnees$Microclimate_measurement[2:nrow(donnees)]))

print(Microclimate)
for (valeur in  unique(Logger)) {
  if (valeur %in% excel_sheets(Fichier2)) {
    feuilleMetadata <- read_excel(Fichier2, sheet = valeur)
    
    for (i in Microclimate) {
      if (i %in% names(feuilleMetadata)) {
        valeur_nom <- feuilleMetadata[[i]]
        
        print(i)
        print(valeur_nom)
      } else {
        message(paste0("La colonne '", i, "' n'existe pas dans la feuille '", valeur, "'."))
      }
    }
  } else {
    message(paste0("La feuille '", valeur, "' n'existe pas dans le fichier."))
    
  }
}

feuilleMetadata = read_excel(Fichier2, sheet = "Raw time series data")
print(feuilleMetadata)
print(unique(Logger))
for (valeur in  unique(Logger)) {
  if (valeur %in% feuilleMetadata$Raw_data_identifier) {
    print("ok")
  }
  
}

print(feuilleMetadata$Raw_data_identifier)

