
library(lubridate)
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =";", stringsAsFactors = FALSE)
rawData <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",nrows=2879, skip = grep("1/2/2007", readLines("household_power_consumption.txt")),header = FALSE, stringsAsFactors = FALSE)
colnames( rawData ) <- unlist(header)
rawData$DT <- dmy_hms(paste(rawData$Date,rawData$Time))

par(mfcol = c(2,2),mar = c(4, 4, 1, 1), oma = c(1, 0, 0, 0))
plot(rawData$DT,rawData$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "",type = "l",cex=.4)

plot(rawData$DT,rawData$Sub_metering_1, ylab = "Energy sub metering",xlab = "",type = "l",cex=.4,col="purple")
points(rawData$DT,rawData$Sub_metering_2,col="red",type = "l")
points(rawData$DT,rawData$Sub_metering_3,col="blue",type = "l")
legend("topright", lty = 1, col = c("purple", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = .6)

plot(rawData$DT,rawData$Voltage, ylab = "Voltage",xlab = "datetime",type = "l",cex=.4)

with(rawData,plot(DT,Global_reactive_power,ylab = "Global_reactive_power",xlab = "datetime",type = "l",cex=.4))
dev.copy(png,"plot4.png")
dev.off()