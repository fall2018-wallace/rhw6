
clean_data <- raw_data

#re-use the dat from before
readStates<- function(states)
{
    #remove rows that are not needed
    
    states<- states<-[-1,]
    
    num.row<-nrow(states)
    states<- states[-num.row,]
    
    states<-states[,-1:4]
    
    colnames(states)<-c("stateName","population","popOver18","percentOver18")
    
}
