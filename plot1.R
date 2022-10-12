library(tidyverse)
library(lubridate)

data <- read.csv("C:/Users/BHPData/OneDrive - Johns Hopkins/Documents/TEMP/Exploratory Data Analysis/w1_project/household_power_consumption.txt",sep=";")

data$Date <- dmy(data$Date)

data <- data[year(data$Date)==2007 & month(data$Date)==2 ,]
data <- data[day(data$Date)==1 | day(data$Date)==2,]
data$Global_active_power <- as.numeric(data$Global_active_power)
#counts <- table()
hist(data$Global_active_power,col ='red',main="Global Active Power",ylab='Frequency',
     xlab = 'Global Active Power(kilowatts)')