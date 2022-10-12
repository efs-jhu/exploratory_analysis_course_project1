library(tidyverse)
library(lubridate)

data <- read.csv("C:/Users/BHPData/OneDrive - Johns Hopkins/Documents/TEMP/Exploratory Data Analysis/w1_project/household_power_consumption.txt",sep=";")

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data <- data[year(data$Date)==2007 & month(data$Date)==2 ,]
data <- data[day(data$Date)==1 | day(data$Date)==2,]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$datetime <- data$Date + data$Time

plot(data$datetime,data$Global_active_power,type='l',ylab="Global Active Power(kilowatts)",
     xlab="")



