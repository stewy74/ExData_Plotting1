

# read input file and convert data types
hh <- read.table("household_power_consumption.txt", header=TRUE, sep=";")

# filter on dates
hh2 <- subset(hh, as.Date(hh$Date, format="%d/%m/%Y") %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")) )

# add converted date colummns
hh3 <- cbind(as.Date(hh2$Date, format="%d/%m/%Y"), strptime(paste(hh2$Date, hh2$Time), format="%d/%m/%Y %X"), hh2)

# remove old columns
hh4 <- subset(hh3, select = -c( Date, Time ))

# rename columns
colnames(hh4) <- names(hh) 
remove(hh) # clear up some space


# plot 3

png("plot3.png") # plot device and file name

sub1 <- as.numeric(as.character(hh4$Sub_metering_1))
sub2 <- as.numeric(as.character(hh4$Sub_metering_2))
sub3 <- as.numeric(as.character(hh4$Sub_metering_3))

yl <- "Energy sub metering"
plot(hh4$Time, sub1, type="l", xlab="", ylab=yl, ylim=c(0, 38)) # 0,38 looks just like example plot...
par(new=T)
plot(hh4$Time, sub2, type="l", xlab="", ylab=yl, col=2, ylim=c(0, 38))
par(new=T)
plot(hh4$Time, sub3, type="l", xlab="", ylab=yl, col=4, ylim=c(0, 38))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
par(new=F)

dev.off() # end png device