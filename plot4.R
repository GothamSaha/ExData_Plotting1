setwd("./ExploratoryDataAnalysis/Prj1")


#Read file, converting missing data coded as '?' into NAs
DF0<-read.table(file="./data/household_power_consumption.txt",
                na.strings=c("?",NA),
                sep = ";",header=TRUE,stringsAsFactors=FALSE)

#Remove NAs
DF1<-na.omit(DF0)

#convert Date and time field from character to date
DF1$DateTime <- strptime(paste(DF1$Date, DF1$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

#Get data for 2007-02-01 and 2007-02-02 only 
DF2<-DF1[DF1$DateTime>="2007-02-01 00:00:00" & DF1$DateTime<"2007-02-03 00:00:00",]

#Generate plotsplot and send to png device
png("plot4.png", width = 480, height = 480)

#set 2 X 2 frame
par(mfcol=c(2,2))

#plot1
plot(DF2$DateTime,DF2$Global_active_power,
     type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(DF2$DateTime,DF2$Global_active_power, type="l") 

#plot2
plot(DF2$DateTime,DF2$Sub_metering_1,
     type="n",xlab="",ylab="Energy sub metering",)
lines(DF2$DateTime,DF2$Sub_metering_1, type="l",col="black")
lines(DF2$DateTime,DF2$Sub_metering_2, type="l",col="red") 
lines(DF2$DateTime,DF2$Sub_metering_3, type="l",col="blue") 
legend("topright", cex=0.8,lty = c(1, 1, 1),col = c("black","blue", "red"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#plot3
plot(DF2$DateTime,DF2$Voltage,
     type="n",     xlab="datetime",ylab="Voltage")
lines(DF2$DateTime,DF2$Voltage, type="l") 

#plot4
plot(DF2$DateTime,DF2$Global_reactive_power,
     type="n",xlab="datetime",ylab="Global_reactive_power")
lines(DF2$DateTime,DF2$Global_reactive_power, type="l") 


#close device
invisible(dev.off())












