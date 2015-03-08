##Read Data
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses = "character")

##convert date time to posixct
data$Date<-as.Date(factor(data$Date),"%d/%m/%Y")
data1<-subset(data,Date=="2007-2-1"|Date=="2007-2-2")

data1$Global_active_power<-as.numeric(data1$Global_active_power)

##create png file
png("Plot1.png", width = 480, height = 480)
hist(data1$Global_active_power,col="red",
     main="Global Active Power",xlab ="Global Active Power(Kilowatts)")
dev.off()

