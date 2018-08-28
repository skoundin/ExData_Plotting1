data <-read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings ='?')

data_relevant <- subset(data, Date==('1/2/2007')|Date==('2/2/2007'))
fix(data_relevant)


par(mfrow=c(1,1))

# Combine date and time into a single feature
data_relevant$datetime <- strptime(paste(data_relevant$Date, data_relevant$Time),format = '%d/%m/%Y %H:%M:%S') 
plot(data_relevant$datetime, data_relevant$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(data_relevant$datetime, data_relevant$Sub_metering_3,col='blue')
lines(data_relevant$datetime, data_relevant$Sub_metering_2,col='red')

legend("topright", col=c("black","red","blue"),legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),lty=1)

# Add to an existing plot use lines
dev.copy(png,file="plot3.png")

dev.off()



