setwd("~/Desktop/R/assignment/ExData_Plotting1")
library(data.table)
library(lubridate)

all <- fread(file="household_power_consumption.txt", sep = ";", na.strings = "?")
all[, Date:=dmy(Date)]

start.date <- ymd("2007-02-01") 
end.date <- ymd("2007-02-02")

dt <- all[Date >= start.date & Date <= end.date,]

dt[, Date.Time:=paste(Date, Time)][, Date.Time:=ymd_hms(Date.Time)]

#plot#1
png(file="plot1.png")
hist(dt$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
