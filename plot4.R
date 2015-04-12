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
power$datetime <- strptime(paste(strftime(power$Date), power$Time, sep = " "),
                           format = "%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png")
par(mfrow = c(2,2))
with(power, {
    plot(datetime, Global_active_power, main = "", xlab = "",
         ylab = "Global Active Power (kilowatts)", type = "l")
    plot(datetime, Voltage, main = "", type = "l")
    plot(datetime, Sub_metering_1, main = "", xlab = "",
         ylab = "Energy Sub Metering", type = "l")
    lines(datetime, Sub_metering_2, col = "Red")
    lines(datetime, Sub_metering_3, col = "Blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"),
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           bty = "n")
    plot(datetime, Global_reactive_power, main = "", type = "l")
})
dev.off()
