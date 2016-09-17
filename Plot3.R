# start with a clean environment
rm(list=ls())

old_dir <- getwd()
setwd("/Users/jmmg57/coursera/ExData_Plotting1")
df <- read.csv("household_power_consumption.txt",sep = ";")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(df$Global_active_power)
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
quartz()
plot(df$timestamp,
     df$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")
lines(df$timestamp,df$Sub_metering_2,col="red")
lines(df$timestamp,df$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), lwd=c(1,1))
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()
setwd(old_dir)