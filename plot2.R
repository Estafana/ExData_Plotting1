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

##Code for plot2.png
png(filename = "plot2.png")
plot(household$Time, household$Global_active_power, ylab = "Global Active Power(kilowatts)", xlab = "", type = "l")
dev.off()