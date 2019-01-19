# Plot 3

data.power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data.subset <- subset(data.power, Date %in% c("1/2/2007","2/2/2007"))
data.subset$Date <- as.Date(data.subset$Date, format="%d/%m/%Y")
day <- paste(as.Date(data.subset$Date), data.subset$Time)
data.subset$Date.Time <- as.POSIXct(day)

## Plot 2
with(data.subset, {
  plot(Sub_metering_1~Date.Time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Date.Time,col='Red')
  lines(Sub_metering_3~Date.Time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
