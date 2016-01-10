##Install and load sqldf package to read subset of data from file
install.packages("sqldf")
library(sqldf)

##Read subset of data
data <- read.csv.sql("household_power_consumption.txt", 
                    sql = "select * from file 
                    where Date in (\"1/2/2007\", \"2/2/2007\")", 
                    sep=";", header=TRUE)

##Open graphic device
png("plot1.png")

##Create a histogram of desired data
hist(data$Global_active_power, 
    col="red", 
    xlab = "Global Active Power (kilowatts)",
    main = "Global Active Power", bg = "white")

##Turn off graphic device
dev.off()
                      


   
        
        
