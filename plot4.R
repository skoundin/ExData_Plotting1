data <-read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings ='?')

data_relevant <- subset(data, Date==('1/2/2007')|Date==('2/2/2007'))
fix(data_relevant)

# Divide the window into 4 subsets
par(mfcol=c(2, 2))
par(mar=c(4,4,2,2))

data_relevant$datetime <- strptime(paste(data_relevant$Date, data_relevant$Time),format = '%d/%m/%Y %H:%M:%S') 
plot(data_relevant$datetime, data_relevant$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

data_relevant$datetime <- strptime(paste(data_relevant$Date, data_relevant$Time),format = '%d/%m/%Y %H:%M:%S') 
plot(data_relevant$datetime, data_relevant$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data_relevant$datetime, data_relevant$Sub_metering_3,col='blue')
lines(data_relevant$datetime, data_relevant$Sub_metering_2,col='red')

#data_relevant$datetime <- strptime(paste(data_relevant$Date, data_relevant$Voltage),format = '%d/%m/%Y %H:%M:%S') 
plot(data_relevant$datetime, data_relevant$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 4th plot  --> Global reactive power 
plot(data_relevant$datetime, data_relevant$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.copy(png,file="plot4.png")

dev.off()
