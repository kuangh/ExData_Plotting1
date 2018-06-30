setwd("~/Desktop/R/assignment/data")
library(data.table)
library(lubridate)

all <- fread(file="household_power_consumption.txt", sep = ";", na.strings = "?")
all[, `:=`(Date=dmy(Date), Time=hms(Time))]

start.date <- ymd("2007-02-01") 
end.date <- ymd("2007-02-02")

my.dt <- all[Date >= start.date & Date <= end.date,]
