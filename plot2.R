hpc <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc2 <- subset(hpc, Date == "2007-02-01" | Date == "2007-02-02")
hpc2 <- hpc2 %>% mutate(datetime = paste(Date, Time))
hpc2$datetime <- strptime(hpc2$datetime, format = "%Y-%m-%d %H:%M:%S")
plot(hpc2$datetime, hpc2$Global_active_power, type = "s", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.copy(png, file = "plot2.png")
dev.off()