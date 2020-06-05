data <- read.table("../Power Consumption/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
dataSet <- data[which(data$Date == as.Date("2007-02-01", "%Y-%m-%d") | data$Date == as.Date("2007-02-02", "%Y-%m-%d")), ]
par(mfrow = c(1,1), mar = c(4,4,2,1))
hist(as.numeric(dataSet$Global_active_power), ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "orangered")
dev.copy(png, file = "plot1.png")
dev.off()