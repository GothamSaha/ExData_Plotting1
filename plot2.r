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


#Generate line plot and send to png device
png("plot2.png", width = 480, height = 480)

plot(DF2$DateTime,DF2$Global_active_power,
     type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(DF2$DateTime,DF2$Global_active_power, type="l") 

#close device
invisible(dev.off())




  


