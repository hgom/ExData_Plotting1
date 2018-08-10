# use dplyr
library(dplyr)

#download and unzip file
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="epc.zip", method="curl")
unzip ("epc.zip", exdir = ".")

# select electric power consumption data
epc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", comment.char="", na.strings="?")

# translate Date field to Date type and filter the data from "2007-02-01" and "2007-02-02"
epc <- mutate(epc, Date = as.Date(Date, "%d/%m/%Y")) %>% 
  filter(Date >= "2007/02/01" & Date <= "2007/02/02")

# 1 graph in 1 row and 1 column
par(mfrow=c(1,1))

# draw histogram Global active power for the subset
hist(epc$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# print histogram to png file
dev.copy(png, file="figure/plot1.png", height=480, width=480)
dev.off()