## Exploratory Data Analysis Project 1
## This script will produce plot 3, Sub metering data over time
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

