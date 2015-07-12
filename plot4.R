## this is part 4 (of 4) of the first assignment of the 
## Exploratory Data Analysis class on Coursera 
## more comments in the markup file in the assignment's 
## repository on github https://github.com/dandybits/ExData_Plotting1.git
## to execute place file in R working directory and run:
##    source("plot4.R")
##    plot4()

plot4 <- function() {

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
par(mfrow=c(2,2))


plot(pu$Time,pu$Global_active_power, type="l", xlab="", ylab = "Global Active Power")

with(pu, plot(Time, Voltage, type="l", xlab="datetime"))

plot(pu$Time,pu$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(pu$Time,pu$Sub_metering_2, type="l", col="red")
points(pu$Time,pu$Sub_metering_3, type="l", col="blue")
legend("topright", lty=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(pu, plot(Time, Global_reactive_power, type="l", xlab="datetime"))

##
## Save plot as .png file
## 
## required resolution 480x480 turns out to be the default 
dev.copy(device=png,file="plot4.png")
dev.off()

}