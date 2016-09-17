# start with a clean environment
rm(list=ls())

old_dir <- getwd()
setwd("/Users/jmmg57/coursera/ExData_Plotting1")
df <- read.csv("household_power_consumption.txt",sep = ";")
df$Date <- as.Date(df$Date, format="%d/%m/%Y")
df <- df[(df$Date=="2007-02-01") | (df$Date=="2007-02-02"),]
df$Global_active_power <- as.numeric(df$Global_active_power)/1000
df <- transform(df, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
quartz()
plot(df$timestamp,df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# axis(2, at=axTicks(2), labels=paste(axTicks(2)/1000,sep=""))
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
setwd(old_dir)