##Download and unzip file
download.file(url="http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","data.zip")
unzip("data.zip")
##Subset data for set dates only.
consumption <- read.csv("household_power_consumption.txt", header=TRUE, sep=";",stringsAsFactors=FALSE,na.strings="?")
Date<-strptime(consumption$Date,format="%d/%m/%Y")
cut<-consumption[Date=="2007-02-01"|Date=="2007-02-02",]
##Create Date and Time column with defined time format
cut$DateTime<-strptime(paste(cut$Date,cut$Time),format="%d/%m/%Y %H:%M:%S")

##Create Plot 2 and save into png
png(file="plot2.png",width=480,height=480)
plot(cut$DateTime,cut$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
