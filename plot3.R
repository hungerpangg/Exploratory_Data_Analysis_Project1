hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc2 <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
hpc2 <- hpc2 %>% mutate(datetime = paste(Date, Time))
hpc2$datetime <- strptime(hpc2$datetime, format = "%Y-%m-%d %H:%M:%S")

with(hpc2, plot(datetime, Sub_metering_1, type = "s", xlab = "", ylab = "Energy sub metering"))
with(hpc2, lines(datetime, Sub_metering_2, col = "red"))
with(hpc2, lines(datetime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, lty = 1, cex = 0.5, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, file = "plot3.png")
dev.off()