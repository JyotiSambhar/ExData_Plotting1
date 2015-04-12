#Explorartory Data Analysys Project1 Plot3
#Assumption : file is present in working directory
library(plyr)

#Read csv file from wporking directory
hpc<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

#subset data for required dates
subset<-subset(hpc,Date=="1/2/2007"|Date=="2/2/2007")

#change date and time column to POSIXct variable
datedata<-mutate(subset,datetime=strptime(paste(as.Date(Date,"%d/%m/%Y"),Time),"%Y-%m-%d %H:%M:%S"))

#Open PNG file device
png(file="plot3.png",width=480,height=480)

#draw the plot

#Sub metering1
with(datedata,plot(datetime,Sub_metering_1,type="l",ylab="Energy Sub Metering", xlab=""))

#Sub metering2
with(datedata,points(datetime,Sub_metering_2,type="l",col="Red"))

#Sub metering1
with(datedata,points(datetime,Sub_metering_3,type="l",col="Blue"))

#Legends
legend("topright",col=c("black","red","blue"), legend = colnames(datedata)[7:9],lwd=1)

#switch off the device
dev.off()