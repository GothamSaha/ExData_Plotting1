#This R Script reads in household power consumption and generates a histogram of the
#Global Active Power data for 2 days for 2007-02-01 and 2007-02-02 


#Read file, converting missing data coded as '?' into NAs
DF0<-read.table(file="./data/household_power_consumption.txt",
                na.strings=c("?",NA),
                sep = ";",header=TRUE,stringsAsFactors=FALSE)

#Remove NAs
DF1<-na.omit(DF0)

#convert Date field from character to date
DF1$Date<-as.Date(DF1$Date,"%d/%m/%Y")

#Get data for 2007-02-01 and 2007-02-02 only 
DF2<-DF1[DF1$Date>="2007-02-01 00:00:00" & DF1$Date<"2007-02-03 00:00:00",]


#Generate Histogram and send plot to png device
png("plot1.png", width = 480, height = 480)

hist(DF2$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

#close device
invisible(dev.off())









