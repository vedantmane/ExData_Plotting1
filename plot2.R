data <- read.table("../Power Consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSet <- data[which(data$Date == as.Date("2007-02-01", "%Y-%m-%d") | data$Date == as.Date("2007-02-02", "%Y-%m-%d")), ]
par(mfrow = c(1,1), mar = c(4,4,2,1))
dateTime <- paste(dataSet$Date, dataSet$Time)
dataSet$DateTime <- as.POSIXct(dateTime)
plot(dataSet$DateTime, as.numeric(dataSet$Global_active_power), type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.R")
dev.off()
