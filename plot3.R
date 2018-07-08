setwd("~/Desktop/R/assignment/ExData_Plotting1")
library(data.table)
library(lubridate)

all <- fread(file="household_power_consumption.txt", sep = ";", na.strings = "?")
all[, Date:=dmy(Date)]

start.date <- ymd("2007-02-01") 
end.date <- ymd("2007-02-02")

dt <- all[Date >= start.date & Date <= end.date,]

dt[, Date.Time:=paste(Date, Time)][, Date.Time:=ymd_hms(Date.Time)]

#plot#3
png(file="plot3.png")
with(dt, plot(y=Sub_metering_1, x=Date.Time, type="l", ylab="Energy sub metering", xlab=""))
lines(y=dt$Sub_metering_2, x=dt$Date.Time, col="red")
lines(y=dt$Sub_metering_3, x=dt$Date.Time, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
