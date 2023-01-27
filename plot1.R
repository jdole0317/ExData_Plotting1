fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(fileUrl,destfile="./hhpowerconsumption.zip") 

unzip("./hhpowerconsumption.zip")

power<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880, header=F,sep=";",na.string=c("?"), comment.char="") 

colnames(power)<-read.table("./household_power_consumption.txt",nrows=1,header=F,sep=";")

power$Date<-as.Date(power$Date)
power$Time<-strptime(power$Time, format='%H:%M:%OS') 

hist(power$Global_active_power, xlim = c(0,6), ylim=c(0,1000),col="red", xlab="Global Active Power (kilowatts)" ,
        main="Global Active Power")

setwd("C:/Users/jdole/OneDrive - Research Triangle Institute/Related to R/Coursera/Exploratory Data Analysis")

dev.copy(png, file= 'plot1.png', width=480, height=480)
dev.off()
