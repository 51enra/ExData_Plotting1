Sys.setlocale("LC_ALL", 'en_US.UTF-8')
power <- read.csv2("~/household_power_consumption.txt", 
                   dec = ".", skip = 66600, nrows = 3000)
names(power) <- c("Date", "Time", "Global_active_power", 
                  "Global_reactive_power", "Voltage", "Global_intensity",
                  "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
                )
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- power[power$Date >= as.Date("2007-02-01") & 
                   power$Date <= as.Date("2007-02-02"),]
power$dateTime <- strptime(paste(strftime(power$Date), power$Time, sep = " "),
                           format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png")
plot(power$dateTime, power$Global_active_power, main = "", xlab = "",
     ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()