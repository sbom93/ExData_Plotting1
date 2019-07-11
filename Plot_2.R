#Load Data (if not loaded yet in the previous R files)
read_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
data <- read_data[read_data$Date %in% c("1/2/2007","2/2/2007"),]

Time_data <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(Time_data, data)

# Plot 2
plot(data$Global_active_power~data$Time_data,type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png,"plot2.png", width=480, height=480)
dev.off()