## this is part 3 (of 4) of the first assignment of the 
## Exploratory Data Analysis class on Coursera 
## more comments in the markup file in the assignment's 
## repository on github https://github.com/dandybits/ExData_Plotting1.git
## to execute place file in R working directory and run:
##    source("plot3.R")
##    plot3()

plot3 <- function() {

##
## Read data, subset to the required date interval
##
## assumes input file is in the current working directory
power_usage_all <- read.csv("household_power_consumption.txt",sep=";", na.strings="?")
## date is at this point stored as character. 
## note that date format is different from those typically used in the USA
power_usage <- power_usage_all[power_usage_all$Date=="1/2/2007" | power_usage_all$Date=="2/2/2007",]

##
## Process data as necessary
##
## Time column is reused for date/time combination. 
## An alternative way would be add a new column.
pu <- copy(power_usage)
pu$Time <- strptime(paste(as.character(pu$Date), as.character(pu$Time)), format="%d/%m/%Y %H:%M:%S")

##
## Plot data 
##
plot(pu$Time,pu$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(pu$Time,pu$Sub_metering_2, type="l", col="red")
points(pu$Time,pu$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

##
## Save plot as .png file
## 
## required resolution 480x480 turns out to be the default 
dev.copy(device=png,file="plot3.png")
dev.off()

}