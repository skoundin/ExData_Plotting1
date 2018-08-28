data <-read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings ='?')

data_relevant <- subset(data, Date==('1/2/2007')|Date==('2/2/2007'))
fix(data_relevant)

#?strptime

# Combine date and time into a single feature
data_relevant$datetime <- strptime(paste(data_relevant$Date, data_relevant$Time),format = '%d/%m/%Y %H:%M:%S') 
plot(data_relevant$datetime, data_relevant$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,file="plot2.png")
dev.off()


  
  