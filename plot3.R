
# Plot 3: Multi-line plot of submetering values over time

# !! Manually set the working directory !!
# - Session | Set working directory | To source file location
# TODO: Figure out how to do this programmatically

# Get the data, using our helper function, into data table DT
# For first execution, set download=TRUE to get and unzip the data file

source('getdata.R')
DT <- getdata(download=FALSE)
str(DT)
head(DT)


png( 
         filename="plot3.png",
         width=480,
         height=480
)

# Set some of the plotting parameters
# - make the chart background transparent
# - make the color for axis and the box around the chart gray
# - scale back the text size to 75% of standard size

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
#   . Turn off the x-axis title
#   . Set the y-axis title

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

legend('topright',
       legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       col=c('black','red','blue'),
       lty=1,
       text.col = 'black'
       )

# Dump the plot to a .png file of the desired size

#dev.copy(png, 
#        filename="plot3.png",
#         width=480,
#         height=480
#)
dev.off()

