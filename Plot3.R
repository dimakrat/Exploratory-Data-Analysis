## Plot3.R
## part of epcCharts.R
## Exploratory Data Analysis: Course Project 1
## files Plot3.R and Plot3.png
## data frame loaded by epcCharts.R - dt

setwd("/Users/dimakrat/Documents/Study Data Sience/Exploratory Data Analysis/data")
# download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="pwrconsum.zip", method="curl")
# unzip("pwrconsum.zip")
# file.remove("pwrconsum.zip")

## Loading the data
## Read data from "household_power_consumption.txt"
## The time difference "2006-12-16 17:24:00" and "2007-02-03 00:00:00" = 66636 mins
## The time difference "2007-02-03 00:00:00" and "2007-02-01 00:00:00" = 2880 mins
## Each minut is 1 row


dtNames <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
dtNames <- names(dtNames)
dt <- read.table("household_power_consumption.txt", col.names = dtNames, sep = ";", skip = 66637, nrows = 2880)
rm(dtNames)
names(dt) <- tolower(names(dt))

## Convert data and time
dt$time <- strptime(paste(as.character(dt$date),dt$time), format="%d/%m/%Y %H:%M:%S")
dt$date <- as.Date(dt$date,format="%d/%m/%Y")

## Make bitmap PNG file with chart

png(file= "Plot3.png",width = 480, height = 480)
plot(dt$time, dt$sub_metering_1, type="l", xlab= "", ylab="Enegy sub metering")
lines(dt$time,dt$sub_metering_2, col= "red")
lines(dt$time,dt$sub_metering_3, col= "blue")
legend("topright", lty=c(1,1,1), col = c("black","blue", "red"), legend = c("sub_metering_1","sub_metering_2", "sub_metering_3"))
dev.off()
