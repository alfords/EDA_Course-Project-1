library(data.table)
elec<-fread(input="C:/Users/aazhang/workspace/R/household_power_consumption.txt", sep=";"
            , na.strings=c("?"))

elec1<-subset(elec,Date=="1/2/2007" | Date=="2/2/2007")

rm(elec)

elec1<-as.data.frame(elec1)

elec1$DateTime<-paste(elec1$Date,elec1$Time)
elec1$DateTime<-strptime(elec1$DateTime, "%d/%m/%Y %H:%M:%S")
elec1$Sub_metering_1<-as.numeric(elec1$Sub_metering_1)

png("C:/Users/aazhang/workspace/R/plot3.png", width = 480, height = 480)

ylab<-"Energy sub metering"
plot(elec1$DateTime,elec1$Sub_metering_1,type="l",col="black",ylab=ylab,xlab="")
lines(elec1$DateTime,elec1$Sub_metering_2,col="red")
lines(elec1$DateTime,elec1$Sub_metering_3,col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) 

dev.off()
