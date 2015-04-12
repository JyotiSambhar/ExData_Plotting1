#Explorartory Data Analysys Project1 Plot2
#Assumption : file is present in working directory
library(plyr)

#Read csv file from wporking directory
hpc<-read.csv("household_power_consumption.txt",header=TRUE,sep=";",colClasses="character")

#subset data for required dates
subset<-subset(hpc,Date=="1/2/2007"|Date=="2/2/2007")

#change date and time column to POSIXct variable
datedata<-mutate(subset,datetime=strptime(paste(as.Date(Date,"%d/%m/%Y"),Time),"%Y-%m-%d %H:%M:%S"))

#Open PNG file device
png(file="plot2.png",width=480,height=480)

#draw the plot

with(datedata,plot(datetime,Global_active_power,type="l",ylab="Global Active Power (Kilowatts)",xlab=" "))
#switch off the device
dev.off()
