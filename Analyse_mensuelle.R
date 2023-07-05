library("lattice") #Appeler le package lattice
library("hydroTSM") # Appeler le package hydroTSM
pmensual<-read.table(file.choose(), header = F, check.names = F) #lecture du fichier avec l’option fenêtre en saillie, chercher la route du fichier et sélectionner, header “F” dans le cas où l’entete ne contient pas de données sinon que de noms

#Visualiser la serie temporelle
datos<-pmensual[2:45,2:13]
datos_vector<-as.vector(t(datos)) #convertir en vecteur
datos_ts<-stats::ts(datos_vector, start=c(1964, 1), end=c(2007, 12), frequency=12)
plot.ts(datos_ts, col="black", main=" Précipitation Mensuelle", ylab="P [mm]", xlab="Année")
lines(lowess(time(datos_ts), datos_ts), col="blue", lwd=2) #ajouter la courbe de tendance

#Carte de chaleur ou HeatMap:
lluvia<-pmensual[2:45,2:13] #lecture de données de pluies sans etiquettes et mois (depuis 1964 à 2007)
meses<-pmensual[1:1,2:13] #lecture de l’entete des mois dans la premiere ligne 
colnames(lluvia)<-unlist(meses) #desagregation des noms de mois et attribuer à la matrice
rownames(lluvia)<-pmensual[2:45,1:1] #désagrégation des dates dans le lignes et attribuer à la matrice 
matrixplot(lluvia, ColorRamp="Precipitation", main="Précipitation Mensuelle 1964-2007 (mm/mois)")
