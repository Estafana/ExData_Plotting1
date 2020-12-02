##The data is already downloaded on the directory and unzipped.

##Setting the working directory and loading required libraries
setwd("E:/DataScienceCoursera")
library(lubridate)

##Loading the data in the form of a table
household = read.table("Household.txt", na.strings = "?", sep = ";", header = TRUE)
##Extracting indices where the date is as required and subsetting as appropriate
indices = grep("^[1-2]/2/2007", household$Date)
household = household[indices,]
##Converting the Date and Time column in the appropriate format
household$Date = dmy(household$Date) 
household$Time = ymd_hms(paste(household$Date, household$Time))
str(household)

##Code for plot4.png
png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(household$Time, household$Global_active_power, ylab = "Global Active Power", xlab = "", type = "l")
plot(household$Time, household$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(household$Time, household$Sub_metering_1, type = "l", xlab = "", ylab = "Energy Sub Metering")
points(household$Time, household$Sub_metering_2, type = "l", col = "red")
points(household$Time, household$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black","red","blue"), lwd = 1, bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.7)
plot(household$Time, household$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()