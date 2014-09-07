
# Plot 3: Multi-line plot of submetering values over time

# !! Manually set the working directory !!
# - Session | Set working directory | To source file location
# TODO: Figure out how to do this programmatically

# For plot 3 with legend in upper right...
#
# If I created the plot to the screen then copy to png, the legend was being clipped.
#
# One solution is to completely replot to the png device. So I created a function
# to plot to the currently device. Then plotted twice.


# Function to do create plot3 with the given data set
#
plot3 <- function (DT) {
  
  # Set some of the plotting parameters
  # - make the chart background transparent
  # - Setting fg seemed to affect the legend text, so don't set for this plot
  # - Text scaling was not needed for png, don't scale text size to 75%
  
  par(bg='transparent'
      #    fg='gray50',
      #   cex=.75
  )
  
  # Plot 3 submetering series over time:
  # - For the series 1:
  #   . Use a line (rather than the default 'point' which gives a scatterplot)
  #   . Color black
  # - For labels:
  #   . No main title
  #   . Turn off the x-axis title, use just the x-axis tic labels
  #   . Set the y-axis title
  
  plot(x=DT$Timestamp,
       y=DT$Sub_metering_1,
       type='l',
       col='black',
       main="",
       xlab="",
       ylab="Energy sub metering"
  )
  
  # plot the other 2 series as lines with the desired colors
  
  lines(x=DT$Timestamp,
        y=DT$Sub_metering_2,
        type='l',
        col='red')
  
  lines(x=DT$Timestamp,
        y=DT$Sub_metering_3,
        type='l',
        col='blue')
  
  # Move the legend to the upper right. Set for each series:
  # - label
  # - line
  # - color
  #
  # We were mucking with the par forground color as gray and getting gray
  # text coloring in legend. Set it to black here just make sure.

  legend('topright',
         legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
         lty=1,
         col=c('black','red','blue'),
         text.col = 'black'
  )  
}

# Here's where we start doing the plot

## Get the data, using our helper function, into data table DT
## For first execution, set download=TRUE to get and unzip the data file

source('getdata.R')
DT <- getdata(download=FALSE)
str(DT)
head(DT)

##  Plot to the screen and verify everything looks close
##
##  Text scaling will be off on screen, but be OK in png
##  TODO: Can we size screen to be like png?

plot3(DT)

##  Open a png device, redo entire plot, close device

png(filename="plot3.png",
    width=480,
    height=480
    )
plot3(DT)
dev.off()

##  Now manually verify the png plot looks like the reference plot

