##Install and load sqldf package to read subset of data from file
install.packages("sqldf")
library(sqldf)

##Read subset of data
data <- read.csv.sql("household_power_consumption.txt", 
                     sql = "select * from file 
                    where Date in (\"1/2/2007\", \"2/2/2007\")", 
                     sep=";", header=TRUE)

##Create a new column datetime by formatting Date and Time columns
data$datetime <- strptime(paste(data$Date, data$Time, sep = " "),
                          format="%d/%m/%Y %H:%M:%S")  

##Open graphic device
png("plot4.png")

##Set mfrow parameter to plot 2*2 graphs
par(mfrow = c(2,2))

##Plot desired data
with(data, plot(datetime, Global_active_power, 
                type="l", xlab=" ", 
                ylab = "Global Active Power",bg = "white")) 

with(data, plot(datetime, Voltage, type = "l", bg = "white",
                xlab = "datetime"))

with(data, plot(datetime, Sub_metering_1, type = "l", 
                ylab = "Energy sub metering", xlab = " "))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), col=c("black", "red", "blue"))

with(data, plot(datetime, Global_reactive_power, 
                type="l", xlab="datetime", 
                ylab = "Global_reactive_power",bg = "white")) 

##Turn off graphic device
dev.off()

