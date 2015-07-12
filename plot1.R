## this is part 1 (of 4) of the first assignment of the 
## Getting and Cleaing Data class on Coursera 
## more comments in the markup file in the assignment's 
## repository on github
## to execute place file in R working directory and run:
##    source("plot1.R")
##    plot1()

plot1 <- function() {

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
## this step is not required in part1

##
## Plot data 
##
hist(power_usage$Global_active_power,col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##
## Save plot as .png file
## 
## required resolution 480x480 turns out to be the default 
dev.copy(device=png,file="plot1.png")
dev.off()

}