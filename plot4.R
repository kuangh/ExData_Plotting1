setwd("~/Desktop/R/assignment/ExData_Plotting1")
library(data.table)
library(lubridate)

all <- fread(file="household_power_consumption.txt", sep = ";", na.strings = "?")
all[, Date:=dmy(Date)]

start.date <- ymd("2007-02-01") 
end.date <- ymd("2007-02-02")

dt <- all[Date >= start.date & Date <= end.date,]

dt[, Date.Time:=paste(Date, Time)][, Date.Time:=ymd_hms(Date.Time)]

#plot#4
png(file="plot4.png")
#initiate a 2 by 2 plot
par(mfcol=c(2,2))
#add upper left plot
with(dt, plot(y=Global_active_power, x=Date.Time, type="l", ylab="Global Active Power", xlab=""))
#add lower left plot
with(dt, plot(y=Sub_metering_1, x=Date.Time, type="l", ylab="Energy sub metering", xlab=""))
lines(y=dt$Sub_metering_2, x=dt$Date.Time, col="red")
lines(y=dt$Sub_metering_3, x=dt$Date.Time, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), text.font=1, bty = "n")
#add upper right plot
with(dt, plot(y=Voltage, x=Date.Time, type="l", ylab="Voltage", xlab="datetime"))
#add lower right plot
with(dt, plot(y=Global_reactive_power, ylim=c(0, 0.5), x=Date.Time, type="l", xlab="datetime"))
axis(side=2, at=seq(from=0.1, to=0.5, by=0.1), labels=seq(from=0.1, to=0.5, by=0.1))
dev.off()
