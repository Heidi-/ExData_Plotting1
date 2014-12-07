## Exploratory Data Analysis Project 1
## See README.md for information about the dataset and project goal
## This file is a working space. It will create all required plots but is not
## the submission.

# define path variables for working directory
dCoursera <- "/Users/heidi/files/Box Sync/classes/Coursera/"
dExAnalysis <- file.path(dCoursera, "ExploratoryAnalysis")
dProject1 <- file.path(dExAnalysis, "Project1/ExData_Plotting1")

# set working directory
setwd(dProject1)

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

# make plot 2
png("plot2.png")
yname <- "Global Active Power (kilowatts)"
xname <- ""
plot(data$DateTime, data$Global_active_power, type="l", xlab=xname, ylab=yname)
dev.off()

# make plot 3
png("plot3.png")
yname <- "Energy sub metering"
xname <- ""
leg = names(data[grepl("Sub", names(data))])
plot(data$DateTime, data$Sub_metering_1, type="l", xlab=xname, ylab=yname)
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "blue", "red"), legend=leg)
dev.off()

# make plot 4
png("plot4.png")

par(mfrow=c(2,2), mar=c(5, 4, 3, 1)+0.1)

# subplot 1
xname <- ""
yname <- "Global Active Power"
plot(data$DateTime, data$Global_active_power, type="l", xlab=xname, ylab=yname)

# subplot 2
xname <- "datetime"
yname <- "Voltage"
plot(data$DateTime, data$Voltage, type="l", xlab=xname, ylab=yname)

# subplot 3
yname <- "Energy sub metering"
xname <- ""
leg = names(data[grepl("Sub", names(data))])
plot(data$DateTime, data$Sub_metering_1, type="l", xlab=xname, ylab=yname)
points(data$DateTime, data$Sub_metering_2, type="l", col="red")
points(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col=c("black", "blue", "red"), legend=leg, bty="n")

# subplot 4
xname <- "datetime"
yname <- "Global_reactive_power"
plot(data$DateTime, data$Global_reactive_power, type="l", xlab=xname, ylab=yname)

dev.off()