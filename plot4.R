
install.packages("Cairo")
library(Cairo)
?Cairo

# Plot 4: Multiple plots in a 'page'
#
# Notes:
# - Looks like we need show plot2 and plot3
# - Just replicate the code here (yuk) but do put them their own functions 
# - TODO: Restructure to remove duplicate code 
# - Removed the comments for plot2 and plot3 since we've already discussed it.
# - Renamed plot2 and plot3
# - Made functions for the 2 new plots. 
# - Looks like we should've named our Timestamp column datetime ;-)
# - Do what we did in plot 3 and plot everything to png device, don't just copy.
#   . Text and legends are mucked when we copy.


# Plot 3: Multi-line plot of submetering values over time
#
plot.submetering <- function (DT) {
  
  plot(x=DT$Timestamp,
       y=DT$Sub_metering_1,
       type='l',
       col='black',
       main="",
       xlab="",
       ylab="Energy sub metering"
  )
  
  lines(x=DT$Timestamp,
        y=DT$Sub_metering_2,
        type='l',
        col='red')
  
  lines(x=DT$Timestamp,
        y=DT$Sub_metering_3,
        type='l',
        col='blue')
  
  # Different from plot3
  # - turn off box around legent
  # - make legend text a bit smaller
  
  legend('topright',
         legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
         lty=1,
         col=c('black','red','blue'),
         text.col = 'black',
         bty='n',
         cex=0.9
  )  
}


# Plot 2: A line plot of Global Active Power over the interesting days
#
plot.global_active_power <- function(DT) {
  
  plot(x=DT$Timestamp,
       y=DT$Global_active_power,
       type='l',
#        col='gray20',
       main="",
       xlab="",
       ylab="Global Active Power"
       ) 
}


# New Plot: Line plot of voltage over time
#
plot.voltage <- function(DT) {
  
  plot(x=DT$Timestamp,
       y=DT$Voltage,
       type='l',
#        col='gray20',
       lwd=0.5,
       main="",
       xlab="datetime",
       ylab="Voltage"
  ) 
}


# New Plot: Line plot of global_reactive_power over time
#
plot.global_reactive_power <- function(DT) {
  
  plot(x=DT$Timestamp,
       y=DT$Global_reactive_power,
       type='l',
#        col='gray20',
       lwd=0.5,
       main="",
       xlab="datetime",
       ylab="Global_reactive_power"
  )  
}


# Function to make the multi-plot chart
#
plot.plot4 <- function (DT) {
  
  ##  Make chart background transparent, like the reference charts.
  ##  Create a 2x2 grid of plots
  
  par(bg='transparent',
      mfrow=c(2,2)
  )
  
  # Charts fill row-wise, left to right
  
  plot.global_active_power(DT)
  plot.voltage(DT)
  plot.submetering(DT)
  plot.global_reactive_power(DT)
}

#
##  Read in the data
##
## Get the data, using our helper function, into data table DT
## For first execution, set download=TRUE to get and unzip the data file

source('getdata.R')
DT <- getdata(download=FALSE)
str(DT)
head(D)

# plot to screen to get idea if things are working

plot.plot4(DT)

##  Plot again to png and hopefully all text, legends, etc. will size correctly
##  Open a png device, redo entire plot, close device

CairoPNG(filename="plot4.png",
         bg='transparent',
         width=480,
         height=480
)

plot.plot4(DT)

dev.off()



