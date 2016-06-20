# My motto: always use lubridate when dealing with dates and times.
library(lubridate)
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =";", stringsAsFactors = FALSE)
rawData <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",nrows=2879, skip = grep("1/2/2007", readLines("household_power_consumption.txt")),header = FALSE, stringsAsFactors = FALSE)
colnames( rawData ) <- unlist(header)

# Need a column of date-time data to be my x axis.  Construct one from the two character
# variables Date and Time.
rawData$DT <- dmy_hms(paste(rawData$Date,rawData$Time))
# Now do the actual plotting
plot(rawData$DT,rawData$Sub_metering_1, ylab = "Energy sub metering",xlab = "",type = "l",cex=.4,col="purple")
points(rawData$DT,rawData$Sub_metering_2,col="red",type = "l")
points(rawData$DT,rawData$Sub_metering_3,col="blue",type = "l")
legend("topright", lty = 1, col = c("purple", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = .6)
# and make the png file.
dev.copy(png,"plot3.png")
dev.off()