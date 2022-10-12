
data <- read.csv("C:/Users/BHPData/OneDrive - Johns Hopkins/Documents/TEMP/Exploratory Data Analysis/w1_project/household_power_consumption.txt",sep=";")

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data <- data[year(data$Date)==2007 & month(data$Date)==2 ,]
data <- data[day(data$Date)==1 | day(data$Date)==2,]
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$datetime <- data$Date + data$Time


dev.new(width=10, height=5, unit="in")
par(mfrow=c(2,2),mar=c(6,6,2,1))

plot(data$datetime,data$Global_active_power,type='l',ylab="Global Active Power(kilowatts)",
     xlab="")

plot(data$datetime,data$Voltage,type='l',ylab="Voltage",
     xlab="datetime")

plot(data$datetime,data$Sub_metering_1,type='l',xlab="",ylab="Energy sub metering")
lines(data$datetime,data$Sub_metering_2,col='red')
lines(data$datetime,data$Sub_metering_3,col='blue')
legend("topright",legend=c("sub_metering_1","sub_metering_2","sub_metering_3"), 
       col=c("black","red","blue"),bty='n',lty=c(1,1,1), ncol=1)

plot(data$datetime,data$Global_reactive_power,type='l',ylab="Global_reactive_power",
     xlab="datetime")
