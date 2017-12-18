source("genfun.R")

data <- getDataFile()
##str(data)

## Start PNG-file: plot3.png, with dimension 480x480px
png(filename="plot3.png", width=480, height=480, units="px")

## Draw an empty plot
plot(data$datetime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type = "n")

## Draw the lines for the three submeterings
lines(data$datetime, data$Sub_metering_1, type = "l", col="black")
lines(data$datetime, data$Sub_metering_2, type = "l", col="red")
lines(data$datetime, data$Sub_metering_3, type = "l", col="blue")

## Add a legend
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

## Close device
dev.off()
