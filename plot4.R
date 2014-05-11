

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
