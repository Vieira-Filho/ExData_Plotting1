#setting the directory
setwd("C:/Users/vieir_000/Dropbox/Doutorado/Coursera/Exploratory Data Analysis/Assignment 1")

#reading the raw data
raw_data <- read.table(file = "household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#converting data and time to a POSIXct object
raw_data$Date <- as.POSIXct(paste(raw_data[,1], raw_data[,2]), format="%d/%m/%Y %H:%M:%S")

#Subsetting data
selected_period <- subset(raw_data, Date >= as.POSIXct("2007-02-01 00:00:00") & Date < as.POSIXct("2007-02-03 00:00:00"))

#Creating plot2
png(filename = "plot2.png",width = 480, height = 480, bg = "transparent")
plot(selected_period$Date, selected_period$Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)")
dev.off()