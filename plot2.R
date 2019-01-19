# Plot 2
data.power <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data.subset <- subset(data.power, Date %in% c("1/2/2007","2/2/2007"))
data.subset$Date <- as.Date(data.subset$Date, format="%d/%m/%Y")
day <- paste(as.Date(data.subset$Date), data.subset$Time)
data.subset$Date.Time <- as.POSIXct(day)

## Plot 2
with(data.subset, {
  plot(Global_active_power~Date.Time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})


dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
