

# Plot 1: A histogram for the Global Active Power field

# !! Manually set the working directory !!
# - Session | Set working directory | To source file location
# TODO: Figure out how to do this programmatically

# Get the data, using our helper function into data table DT
# For first execution, set download=TRUE to get and unzip the data file

source('getdata.R')
DT <- getdata(download=FALSE)
str(DT)
head(DT)

# Set some of the plotting parameters
# - make the chart background transparent
# - make the color for axis gray
# - scale back the text size to 75% of standard size

par(bg='transparent',    
    fg='gray50',
    cex=.75)

# Plot the histogram, setting the x-axis label and the title

hist(DT$Global_active_power, 
     col='firebrick1',
     main='Global Active Power',
     xlab='Global Active Power (kilowatts)')

# Dump the histogram to a .png file of the desired size

dev.copy(png, 
         filename="plot1.png",
         width=480,
         height=480
         )
dev.off()

