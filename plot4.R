hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc2 <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
hpc2 <- hpc2 %>% mutate(datetime = paste(Date, Time))
hpc2$datetime <- strptime(hpc2$datetime, format = "%Y-%m-%d %H:%M:%S")

par(mfrow = c(2,2), mar = c(4,4,1,1))

#graph1
with(hpc2, plot(datetime, Global_active_power, type = "s", xlab = "", ylab = "Global Active Power"))
#graph2
with(hpc2, plot(datetime, Voltage, type = "s"))
#graph3
with(hpc2, plot(datetime, Sub_metering_1, type = "s", xlab = "", ylab = "Energy sub metering"))
with(hpc2, lines(datetime, Sub_metering_2, col = "red"))
with(hpc2, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", cex = 0.3, lty = 1, lwd = 1, bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"))
#graph4
with(hpc2, plot(datetime, Global_reactive_power, type = "s"))

dev.copy(png, file = "plot4.png")
dev.off()