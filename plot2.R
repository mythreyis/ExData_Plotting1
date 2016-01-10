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
png("plot2.png")

##Plot desired data
with(data, plot(datetime, Global_active_power, 
     type="l", xlab=" ", 
     ylab = "Global Active Power (kilowatts)",bg = "white"))  

##Turn off graphic device
dev.off()
        
        
    
     