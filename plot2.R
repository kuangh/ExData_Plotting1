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
png(file="plot2.png")
with(dt, plot(y=Global_active_power, x=Date.Time, type="l", ylab="Global Active Power (kilowatts)", xlab=""))
dev.off()
