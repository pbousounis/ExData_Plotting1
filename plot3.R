# Load "data.table" pkg or install and load if it doesn't exist
if(!require(data.table)) {install.packages("data.table")}

# Read and subset data
hpcData <- fread("household_power_consumption.txt", na.strings="?")
hpc1.2 <- rbind(hpcData[hpcData$Date=="1/2/2007",], hpcData[hpcData$Date=="2/2/2007"])

# Combine date and time columns, convert to date/time obj
x <- strptime(paste(hpc1.2$Date, hpc1.2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


# Open png device, plot to it, and close it
png("plot3.png")

plot(x, y=hpc$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(x, hpc$Sub_metering_2, type="l", col="red")
lines(x, hpc$Sub_metering_3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()