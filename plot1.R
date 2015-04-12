power <- read.csv2("~/household_power_consumption.txt", 
                   dec = ".", skip = 66600, nrows = 3000)
names(power) <- c("Date", "Time", "Global_active_power", 
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
                )
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- power[power$Date >= as.Date("2007-02-01") & 
                   power$Date <= as.Date("2007-02-02"),]
png(filename = "plot1.png")
hist(power$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.off()