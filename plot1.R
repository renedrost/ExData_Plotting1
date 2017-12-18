## Include genfun.R. This script has a generic function to read the data.
source("genfun.R")

## Get data.
data <- getDataFile()

## Start PNG-file: plot1.png, with dimension 480x480px
png(filename="plot1.png", width=480, height=480, units="px")

## Plot histogram
hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab = "Global Active Power (kilowatts)")

## Close device
dev.off()
