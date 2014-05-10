library(data.table)
elec<-fread(input="C:/Users/aazhang/workspace/R/household_power_consumption.txt", sep=";"
            , na.strings=c("?"))

elec$Date<-as.Date(elec$Date, "%d/%m/%Y")

elec1<-subset(elec,Date=="2007-02-01" | Date=="2007-02-02")
elec1$GAP<-as.numeric(elec1$Global_active_power)

png("C:/Users/aazhang/workspace/R/plot1.png", width = 480, height = 480)

elec1$GAP<-as.numeric(elec1$Global_active_power)
xlab<-"Global Active Power (kilowatts)"
main="Global Active Power"
hist(elec1$GAP,xlab=xlab,main=title,col="RED")

dev.off()
