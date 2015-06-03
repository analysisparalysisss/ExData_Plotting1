##Download and unzip file
download.file(url="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
unzip("data.zip")
##Subset data for set dates only.
consumption <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE,na.strings="?")
Date<-strptime(consumption$Date,format="%d/%m/%Y")
cut<-consumption[Date=="2007-02-01"|Date=="2007-02-02",]
##Create Date and Time column with defined time format
cut$DateTime<-strptime(paste(cut$Date,cut$Time),format="%d/%m/%Y %H:%M:%S")
##Create Plot 4 and save into png
png(file="plot4.png",width=480,height=480)
par(mfrow=c(2,2))
with(cut,{
  plot(DateTime,Global_active_power,type="l",ylab="Global Active Power",xlab="")
  plot(DateTime,Voltage,type="l",ylab="Voltage",xlab="datetime")
  plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",col="black")
  lines(DateTime,Sub_metering_2,type="l",col="red")
  lines(DateTime,Sub_metering_3,type="l",col="blue")
  legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),bty="n",lwd=2)
  plot(DateTime,Global_reactive_power,type="l",ylab="Global_reactive_power",xlab="datetime")
})
dev.off()