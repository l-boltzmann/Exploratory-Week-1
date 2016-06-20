
# Read the header into a vector for later use as column headers
header <- read.table("household_power_consumption.txt", nrows = 1, header = FALSE, sep =";", stringsAsFactors = FALSE)

# Read only the lines of interest into a data frame. 
rawData <- read.table("household_power_consumption.txt",sep=";",na.strings = "?",nrows=2879, skip = grep("1/2/2007", readLines("household_power_consumption.txt")),header = FALSE, stringsAsFactors = FALSE)
# Add discritpive column heads to data frame
colnames( rawData ) <- unlist(header)
# Do the actual plotting
 with(rawData,hist(Global_active_power,main = "Global Active Power",col = "red",xlab = "Global Active Power (kilowatts)"))
 # All the above was done on the screen device. Now copy it to a png file.
 par(cex = 0.6)
 dev.copy(png,"plot1.png")