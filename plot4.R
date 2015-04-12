#Explorartory Data Analysys Project1 Plot4
#Assumption : file is present in working directory
library(plyr)

#Read csv file from wporking directory
hpc<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

#subset data for required dates
subset<-subset(hpc,Date=="1/2/2007"|Date=="2/2/2007")

#change date and time column to POSIXct variable
datedata<-mutate(subset,datetime=strptime(paste(as.Date(Date,"%d/%m/%Y"),Time),"%Y-%m-%d %H:%M:%S"))

#Open PNG file device
png(file="plot4.png",width=480,height=480)

#draw 4 plots column wise
par(mfcol=c(2,2))

#draw the plot
with(datedata, {
  plot(Global_active_power,type="l",,ylab="Global Active Power",xlab=" ")
  
  plot(Sub_metering_1,type="l",ylab="Energy Sub Metering", xlab="")
  points(Sub_metering_2,type="l",col="Red")
  points(Sub_metering_3,type="l",col="Blue")
  legend("topright",col=c("black","red","blue"), legend = colnames(datedata)[7:9],lwd=1)
  
  plot(datetime,Voltage,type='l')
  
  plot(datetime,Global_reactive_power,type='l')
})

#switch off the device
dev.off()
