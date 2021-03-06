data <- read.table("../Power Consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSet <- data[which(data$Date == as.Date("2007-02-01", "%Y-%m-%d") | data$Date == as.Date("2007-02-02", "%Y-%m-%d")), ]
par(mfrow = c(2,2), mar = c(4,4,2,1))
dateTime <- paste(dataSet$Date, dataSet$Time)
dataSet$DateTime <- as.POSIXct(dateTime)
plot(dataSet$DateTime, dataSet$Global_active_power, xlab = "", ylab = "Global Active Power", type = "l")
plot(dataSet$DateTime, dataSet$Voltage, xlab = "datetime", ylab = "Voltage", type = "l")
plot(dataSet$DateTime, dataSet$Sub_metering_1, type = "l", col = "black", xlab = "", ylab = "Energy sub metering")
lines(dataSet$DateTime, dataSet$Sub_metering_2, col = "orangered")
lines(dataSet$DateTime, dataSet$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "orangered", "blue"), lty = 1)
plot(dataSet$DateTime, dataSet$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type = "l")
dev.copy(png, filename = "plot4.png", width = 480, height = 480)
dev.off()
