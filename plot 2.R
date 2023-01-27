# Download and unzip file
fileUrl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile="./hhpowerconsumption.zip") 
unzip("./hhpowerconsumption.zip")

# Read in text file, but just for 2 day period in February. Add column names
power<-read.table("./household_power_consumption.txt",skip=66637,nrows=2880, header=F,sep=";",na.string=c("?"), comment.char="") 
colnames(power)<-read.table("./household_power_consumption.txt",nrows=1,header=F,sep=";")

# Convert date to date type, then paste date and time variables together
power$Date2<-as.Date(power$Date,"%d/%m/%Y")
power$date_time<-strptime(paste(power$Date2, power$Time),"%Y-%m-%d %H:%M:%S")

# Plot days and global active power
plot(power$date_time, power$Global_active_power, type ='l',ylab="Global Active Power (kilowatts)", xlab="")

# Save as png file
setwd("C:/Users/jdole/OneDrive - Research Triangle Institute/Related to R/Coursera/Exploratory Data Analysis")
dev.copy(png, file= 'plot2.png', width=480, height=480)
dev.off()

     
