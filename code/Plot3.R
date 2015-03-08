##Read Data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")

##convert date time to posixct
data$Date1<-as.Date(factor(as.character(data$Date)),"%d/%m/%Y")
data1<-subset(data,Date1=="2007-2-1"|Date1=="2007-2-2")
data1$DateTime <- paste(data1$Date, data1$Time)
data1$DateTime1 <- as.POSIXct(data1$DateTime, format="%d/%m/%Y %H:%M:%S")

data1$Sub_metering_1<-as.numeric(as.character(data1$Sub_metering_1))
data1$Sub_metering_2<-as.numeric(as.character(data1$Sub_metering_2))
data1$Sub_metering_3<-as.numeric(as.character(data1$Sub_metering_3))

##create png
png("Plot3.png", width = 480, height = 480)

plot(data1$DateTime1, data1$Sub_metering_1, type='l', xlab="",
     ylab="Energy Submetering",col="darkslateblue")
     
lines(data1$DateTime1, data1$Sub_metering_2,col="red")
lines(data1$DateTime1, data1$Sub_metering_3,col="blue")
legend("topright",lty=1,col=c("darkslateblue","red","blue"),legend=c("Sub_metering_1",
                                                               "Sub_metering_2",
                                                               "Sub_metering_3"))
dev.off()



