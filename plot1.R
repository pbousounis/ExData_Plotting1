if(!require(data.table)) {install.packages("data.table")}

hpcData <- fread("household_power_consumption.txt", na.strings="?")
hpc1.2 <- rbind(hpcData[hpcData$Date=="1/2/2007",], hpcData[hpcData$Date=="2/2/2007"])

png(filename="plot1.png")

hist(hpc1.2$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)"
     )

dev.off()
