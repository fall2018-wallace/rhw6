
dfStatesNew

raw_data<-arrests
#Merging both data sets
DataSetMerged<-merge(dfStatesNew,arrests)


#Generating histograms of the columns specified
ggplot(data=DataSetMerged, aes(population)) + geom_histogram()
ggplot(data=DataSetMerged, aes(Murder)) + geom_histogram()
ggplot(data=DataSetMerged, aes(Assault)) + geom_histogram()
ggplot(data=DataSetMerged, aes(UrbanPop)) + geom_histogram()
ggplot(data=DataSetMerged, aes(Rape)) + geom_histogram()

#Q5

#Generating the boxplot of columns specified
ggplot(data=DataSetMerged, aes("population in million",population)) + geom_boxplot()

ggplot(data=DataSetMerged, aes("murder in million",Murder)) + geom_boxplot()



#Q6

#Histogram is better because shows the whole data with frequency
counts <- table(DataSetMerged$Murder)
barplot(counts, main="Murders per State", 
        xlab="State", ylab="Murder")


#Step 7
#Q7

#The number of murders per state
DataSetMerged$MurderperState <- (DataSetMerged$Murder * DataSetMerged$population)/100000


#Q8

# bar chart with the number of murders per state
ggplot(data=DataSetMerged, aes(stateName,MurderperState)) + geom_col()

#Q9

# Rotated text (on the X axis), so we can see x labels, also added a title named “Total Murders”.
w<-ggplot(data=DataSetMerged, aes(stateName,MurderperState)) + geom_col()
w1<-w+geom_line()
w1<-w1+theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle("Total Murders")
w1

#Q10
# Sorted the x-axis by the murder rate
w2<-ggplot(data=DataSetMerged, aes(x=reorder(stateName,MurderperState), y=MurderperState)) + geom_col()
w2<-w2+geom_line()
w2<-w2+theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle("Total Murders")
w2

#Q11

# Showing percentOver18 as the color of the bar
w3<-ggplot(data=DataSetMerged, aes(x=reorder(stateName,MurderperState), y=MurderperState, fill=percentOver18)) + geom_col()
w3<-w3+geom_line()
w3<-w3+theme(axis.text.x = element_text(angle = 90, hjust = 1))+ggtitle("Total Murders")
w3

#Step D
#Q12

# Generated a scatter plot – have population on the X axis, the percent over 18 on the y axis, and the size & color represent the murder rate
w4<-ggplot(data=DataSetMerged, aes(population,percentOver18))
w4<-w4+geom_point(aes(size=Murder, color=Murder))
w4

