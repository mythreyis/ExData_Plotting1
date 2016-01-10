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
png("plot3.png")

##Plot desired data
with(data, plot(datetime, Sub_metering_1, type = "l", 
                ylab = "Energy sub metering", xlab = " ", bg = "white"))
with(data, lines(datetime, Sub_metering_2, col = "red"))
with(data, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1, 1, 1), col=c("black", "red", "blue"))

##Turn off graphic device
dev.off()

