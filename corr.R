corr<-function(directory, threshold=0){


  obsOK<-complete(directory)
  listObs<-obsOK[obsOK[,"nobs"]>threshold,]
  
  if(length(listObs)==0) {
    corList<-numeric(length=0)
    return(corList)
    
  }

  
  for(i in listObs[,"id"]){

    if(i<10) {i<-paste("0",i, sep="")}
    if(i<100) {i<-paste("0",i, sep="")}
    
    nomfichier<- paste(directory,"/",i,".csv", sep="")
    pollutionsite <- read.csv(nomfichier)
    
    good<-complete.cases(pollutionsite)
    
    completecases<-pollutionsite[good,]
    
    corr<-cor(completecases[,"nitrate"],completecases[,"sulfate"])
    corList<-c(corList, corr)

  }

  corList
  
  
}