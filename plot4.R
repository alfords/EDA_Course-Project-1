library(data.table)
elec<-fread(input="C:/Users/aazhang/workspace/R/household_power_consumption.txt", sep=";"
            , na.strings=c("?"))

elec1<-subset(elec,Date=="1/2/2007" | Date=="2/2/2007")

rm(elec)

elec1<-as.data.frame(elec1)

elec1$DateTime<-paste(elec1$Date,elec1$Time)
elec1$DateTime<-strptime(elec1$DateTime, "%d/%m/%Y %H:%M:%S")

elec1$Sub_metering_1<-as.numeric(elec1$Sub_metering_1)
elec1$Sub_metering_2<-as.numeric(elec1$Sub_metering_2)
elec1$Sub_metering_3<-as.numeric(elec1$Sub_metering_3)
elec1$Global_active_power<-as.numeric(elec1$Global_active_power)
elec1$Voltage<-as.numeric(elec1$Voltage)
elec1$Global_reactive_power<-as.numeric(elec1$Global_reactive_power)

dev.off()
png("C:/Users/aazhang/workspace/R/plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))

#plot 1
ylab<-"Global Active Power"
plot(elec1$DateTime,elec1$Global_active_power,type="l",ylab=ylab,xlab="")

#plot 2
ylab<-"Voltage"
xlab<-"datetime"
plot(elec1$DateTime,elec1$Voltage,type="l",ylab=ylab,xlab=xlab)

#plot 3
ylab<-"Energy sub metering"
plot(elec1$DateTime,elec1$Sub_metering_1,type="l",col="black",ylab=ylab,xlab="")
lines(elec1$DateTime,elec1$Sub_metering_2,col="red")
lines(elec1$DateTime,elec1$Sub_metering_3,col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", 
       lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) 

#plot 4
ylab<-"Global_reactive_power"
xlab<-"datetime"
plot(elec1$DateTime,elec1$Global_reactive_power,type="l",ylab=ylab,xlab=xlab)

dev.off()
