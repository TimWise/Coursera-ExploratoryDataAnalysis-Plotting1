

# This file has a helper function to read, filter, and pretty up the sourc data
# It is used is all 4 plotting exercises in this assignment

# install.packages("lubridate")

library(data.table)
library(lubridate)


# Get the data we want to plot into data table

getdata <- function (download=TRUE) {

  ##  download an unzip the data file
  
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  zip <- "household_power_consumption.zip"
  txt <- "household_power_consumption.txt"
  
  if (download) {
    download.file(url, destfile=zip)
    unzip(zip, files=txt, overwrite=TRUE)
  }
  
  ##  read the data file into a data table
  ##  leave all the columns a character
  
  DT <- fread (txt,
               sep=";",
               na.strings='?',               
               colClasses=c('character'))
  
  ##  subset the days we want using character comparison
  
  DT <- DT[DT$Date == "1/2/2007" | DT$Date == "2/2/2007", ]
  
  ##  add timestamp column for use in plot x-axis
  
  DT[, Timestamp := dmy_hms(paste(DT$Date, DT$Time))]
  
  ##  make columns to be plotted as numeric
  ##  TODO: has to be a better way
  
  DT$Global_reactive_power  <- as.numeric(DT$Global_reactive_power) 
  DT$Global_active_power    <- as.numeric(DT$Global_active_power)
  DT$Sub_metering_1         <- as.numeric(DT$Sub_metering_1)
  DT$Sub_metering_2         <- as.numeric(DT$Sub_metering_2)
  DT$Sub_metering_3         <- as.numeric(DT$Sub_metering_3)
  DT$Voltage                <- as.numeric(DT$Voltage)

  ## Failed better way
#   cols <- c('Global_active_power',
#             'Global_reactive_power',
#             'Sub_metering_1',
#             'Sub_metering_2',
#             'Sub_metering_3',
#             'Voltage'
#             )
#   lapply(cols, function(col) { DT[,col] <- as.numeric(DT[,col]) })
#   str(DT)
#   head(DT)
  
  return(DT)
}
