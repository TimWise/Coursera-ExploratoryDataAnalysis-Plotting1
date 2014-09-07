

# Plot 2: A line plot of Global Active Power over the interesting days

# !! Manually set the working directory !!
# - Session | Set working directory | To source file location
# TODO: Figure out how to do this programmatically

# Get the data, using our helper function, into data table DT
# For first execution, set download=TRUE to get and unzip the data file

source('getdata.R')
DT <- getdata(download=FALSE)
str(DT)
head(DT)

# Set some of the plotting parameters
# - make the chart background transparent
# - make the color for axis and the box around the chart gray
# - scale back the text size to 75% of standard size

par(bg='transparent',
    fg='gray50',
    cex=.75)

# Plot power over time:
# - For the line:
#   . Use a line (rather than the default 'point' which gives a scatterplot)
#   . Use a gray color, which doesn't create solid areas when points are dense
# - For the axis color:
#   . Try to override the gray with black to better match the reference chart
#     But the override doesn't appear to happen. Axis are colored using fg setting.
# - For labels:
#   . No main title
#   . Turn off the x-axis title
#   . Set the y-axis title

plot(x=DT$Timestamp,
     y=DT$Global_active_power,
     type='l',
     col='gray20',
     col.axis='black',
     main="",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)


# Dump the plot to a .png file of the desired size

dev.copy(png, 
         filename="plot2.png",
         width=480,
         height=480
)
dev.off()

