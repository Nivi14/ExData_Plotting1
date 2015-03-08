##Read data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##convert date time to posixct
data$Date1<-as.Date(factor(as.character(data$Date)),"%d/%m/%Y")
data1<-subset(data,Date1=="2007-2-1"|Date1=="2007-2-2")

data1$DateTime <- paste(data1$Date, data1$Time)
data1$DateTime1 <- as.POSIXct(data1$DateTime, format="%d/%m/%Y %H:%M:%S")

data1$Global_active_power<-as.numeric(as.character(data1$Global_active_power))

##create png file
png("Plot2.png", width = 480, height = 480)
plot(data1$DateTime1, data1$Global_active_power, type='l', xlab="",
     ylab="Global Active Power(kilowatts)")
dev.off()
