# My motto: always use lubridate when dealing with dates and times.
library(lubridate)
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =";", stringsAsFactors = FALSE)
rawData <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",nrows=2879, skip = grep("1/2/2007", readLines("household_power_consumption.txt")),header = FALSE, stringsAsFactors = FALSE)
colnames( rawData ) <- unlist(header)
rawData$DT <- dmy_hms(paste(rawData$Date,rawData$Time))
plot(rawData$DT,rawData$Global_active_power, ylab = "Global Active Power (kilowatts)",xlab = "",type = "l",cex=.4)
dev.copy(png,"plot2.png")
dev.off()