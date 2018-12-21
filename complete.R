complete.R<-function(directory, id=1:332){

  nid= length(id)
  
  completeFiles<-matrix(nrow=nid, ncol=2)
  count<-1
  dimnames(completeFiles)<-list(1:nid,c("id", "nobs"))
  for(i in id){
    j<-i
    if(i<10) {i<-paste("0",i, sep="")}
    if(i<100) {i<-paste("0",i, sep="")}
    
    nomfichier<- paste(directory,"/",i,".csv", sep="")
    pollutionsite <- read.csv(nomfichier)
    
    good<-complete.cases(pollutionsite)
    
    completeFiles[count,1]<-j
    completeFiles[count,2]<-nrow(pollutionsite[good,])
    
    count<-count+1
 
  }
  completeFiles
}