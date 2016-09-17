# start with a clean environment
rm(list=ls())

old_dir <- getwd()
setwd("/Users/jmmg57/coursera/ExData_Plotting1")
df <- read.csv("household_power_consumption.txt",sep = ";")
df$Global_active_power <- as.numeric(df$Global_active_power)
quartz()
hist(as.numeric(df$Global_active_power),
     col = "red",
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     axes=FALSE,
     breaks=12)
axis(1, at=axTicks(1), labels=paste( axTicks(1)/1000,sep=""))
axis(2, at=axTicks(2), labels=paste(axTicks(2)/1000,sep=""))

dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
setwd(old_dir)