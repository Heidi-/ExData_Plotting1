## Exploratory Data Analysis Project 1
## This script will produce plot 1, Global Active Power histogram
## See README.md for information about the dataset

# read in data, just for Feb 1-2, 2007 
firstline <- 66638
fname <- "household_power_consumption.txt"
head <- scan(fname, what=character(), nlines=1, sep=";", quiet=TRUE)
data <- read.table(fname, sep=";", na.strings="?", 
                   header=TRUE, col.names=head, 
                   nrows=1440*2, skip=firstline-1)

# make datetime variables from the Date and Time fields
data$DateTime <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")


# make plot 1
binsize <- 0.5
bedges <- seq(0, max(data$Global_active_power)+binsize, binsize)
xname <- "Global Active Power (kilowatts)"
title = "Global Active Power"
png("plot1.png")
hist(data$Global_active_power, breaks=bedges, xlab=xname, main=title, col="red")
dev.off()

