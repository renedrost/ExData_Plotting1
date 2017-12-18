## Function to retrieve the data. If necessary, download if from the internet, and unzip it.
## Only the needed lines (1/2/2007 and 2/2/2007) are returned.
## Colnames are set.

library(lubridate)
library(data.table)

getDataFile <- function() {
    ## Does the datafile already exists? Of not, download and unzip it.
    if (!file.exists("household_power_consumption.txt")) {
        download.file(url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="edhpc.zip")
        unzip("edhpc.zip")
    }

    ## Open fileconnection to the data.    
    fileConnection <- file("household_power_consumption.txt",open="rt")

    ## Find the last line which we don't want to use.
    notFound <- TRUE
    while (notFound)
        {notFound <- !grepl("31/1/2007;23:59:00", readLines(fileConnection, n=1))}
    
    ## Read required data from file.
    data <- read.table(fileConnection, nrows=2880, sep=";", na.strings="?", stringsAsFactors = FALSE)
    
    ## Convert to data.table
    setDT(data)
    
    ## Close file.
    close(fileConnection)
    
    ## Set colnames, because we skippped it frome the file.
    colnames(data) <- c("Date", 
                        "Time", 
                        "Global_active_power",
                        "Global_reactive_power",
                        "Voltage",
                        "Global_intensity",
                        "Sub_metering_1",
                        "Sub_metering_2",
                        "Sub_metering_3")
    
    ## Create a column with the date/time.
    data[, datetime := as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]

    data
}