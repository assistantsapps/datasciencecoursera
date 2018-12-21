pollutantmean<-function(directory, pollutant, id=1:332){
  
  polluantTousSites=c()
  for(i in id){
  
    if(i<10) {i<-paste("0",i, sep="")}
    if(i<100) {i<-paste("0",i, sep="")}
    
    nomfichier<- paste(directory,"/",i,".csv", sep="")
    pollutionsite <- read.csv(nomfichier)
    
    notNA<- !is.na(pollutionsite[,pollutant])
    polluantDuSite= pollutionsite[notNA, pollutant]
  
    polluantTousSites<- c(polluantTousSites, polluantDuSite)
    # pollutionsite[id,colonne]
  }
  
  mean(polluantTousSites)

}