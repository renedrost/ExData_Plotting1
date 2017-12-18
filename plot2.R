## Include genfun.R. This script has a generic function to read the data.
source("genfun.R")

## Get data.
data <- getDataFile()

## Start PNG-file: plot2.png, with dimension 480x480px
png(filename="plot2.png", width=480, height=480, units="px")

## Draw the plot
plot(data$datetime, 
     data$Global_active_power, 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)", 
     type = "l")

## Close device
dev.off()
