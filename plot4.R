source("genfun.R")

data <- getDataFile()
##str(data)

## Start PNG-file: plot4.png, with dimension 480x480px
png(filename="plot4.png", width=480, height=480, units="px")

## Setup 2x2 plots, setup margins and fontsize
par(mfrow=c(2,2), mar=c(5,4,3,2), ps=10)

## Plot upperleft: global active power
plot(data$datetime, 
     data$Global_active_power, 
     xlab = "", 
     ylab = "Global Active Power", 
     type = "l")

## Plot upperright: Voltage
with(data, plot(datetime, 
     Voltage, 
     type = "l"))


## Plot lowerleft: Energy sub metering
## Draw an empty plot
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")

## Draw the lines for the three submeterings
lines(data$datetime, data$Sub_metering_1, type = "l", col="black")
lines(data$datetime, data$Sub_metering_2, type = "l", col="red")
lines(data$datetime, data$Sub_metering_3, type = "l", col="blue")

## Add a legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"), bty = "n")

## Plot lowerright: global reactive power
with(data, plot(datetime, 
     Global_reactive_power, 
     type = "l"))

## Close device
dev.off()
