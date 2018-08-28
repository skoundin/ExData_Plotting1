data <-read.csv("household_power_consumption.txt",header=TRUE,sep=';',na.strings ='?')

data_relevant <- subset(data, Date==('1/2/2007')|Date==('2/2/2007'))
fix(data_relevant)

data_relevant$Date <- as.Date(data_relevant$Date,format="%d/%m/%Y")
# Use the as.Date inbuilt to store the date column as the number of days since 01-010-1970

hist(data_relevant$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power(kilowatts)",ylab="Frequency")

# copy to the device
dev.copy(png,file="plot1.png")
dev.off()
