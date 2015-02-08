#setting the directory
setwd("C:/Users/vieir_000/Dropbox/Doutorado/Coursera/Exploratory Data Analysis/Assignment 1")

#reading the raw data
raw_data <- read.table(file = "household_power_consumption.txt", sep=";", header = TRUE, na.strings = "?")

#converting data and time to a POSIXct object
raw_data$Date <- as.POSIXct(paste(raw_data[,1], raw_data[,2]), format="%d/%m/%Y %H:%M:%S")

#Subsetting data
selected_period <- subset(raw_data, Date >= as.POSIXct("2007-02-01 00:00:00") & Date < as.POSIXct("2007-02-03 00:00:00"))

#Creating plot4 by png device
png(filename = "plot4.png",width = 480, height = 480, bg = "transparent")

#Adjusting 2 x 2 graph window and margins
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))   
with(selected_period, {
        #plotting graph (1, 1)
        plot(Date, Global_active_power, type = "l",  ylab = "Global Active Power (kilowatts)")
        #plotting graph (1, 2)
        plot(Date, Voltage, type = "l",  ylab = "Voltage", xlab = "datetime") 
        #plotting graph (2, 1)
        with (selected_period, {
                plot(Date, Sub_metering_1,  ylab = "Energy sub metering", ylim = yrange, type = "l", xlab = NA)
                lines (Date, Sub_metering_2, col = "red",  ylim = yrange)
                lines (Date, Sub_metering_3, col = "blue", ylim = yrange) 
                legend("topright", lty = 1, col = c("black","red","blue"),legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))
        })
        #plotting graph (2, 2)
        plot(Date, Global_reactive_power, type = "l",  ylab = "Global_reactive_power", xlab = "datetime")        
        
})
dev.off()