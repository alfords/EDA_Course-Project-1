library(data.table)
elec<-fread(input="C:/Users/aazhang/workspace/R/household_power_consumption.txt", sep=";"
            , na.strings=c("?"))

elec1<-subset(elec,Date=="1/2/2007" | Date=="2/2/2007")
rm(elec)
elec1<-as.data.frame(elec1)
elec1$DateTime<-paste(elec1$Date,elec1$Time)
elec1$DateTime<-strptime(elec1$DateTime, "%d/%m/%Y %H:%M:%S")
elec1$GAP<-as.numeric(elec1$Global_active_power)

png("C:/Users/aazhang/workspace/R/plot2.png", width = 480, height = 480)

ylab<-"Global Active Power (kilowatts)"
plot(elec1$DateTime,elec1$GAP,type="l",ylab=ylab,xlab="")

dev.off()
