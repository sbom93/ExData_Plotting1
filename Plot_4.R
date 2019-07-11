#Load Data (if not loaded yet in the previous R files)
read_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
data <- read_data[read_data$Date %in% c("1/2/2007","2/2/2007"),]

Time_data <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(Time_data, data)

par(mfrow=c(2,2))
plot(data$Global_active_power~data$Time_data,type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(data$Time_data, data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
plot(data$Time_data, data$Sub_metering_1, col = 'black', type = 'l', xlab = '', ylab = 'Energy sub meeting')
lines(data$Time_data,data$Sub_metering_2, col = 'red', type = 'l')
lines(data$Time_data,data$Sub_metering_3, col = 'blue', type = 'l')
legend('topright', legend = c('Sub_meting_1','Sub_meting_2','Sub_meting_3'), col = c('black','red','blue'),lty="solid")
plot(data$Time_data, data$Global_reactive_power, xlab = 'datetime', type = 'l', ylab = 'Global_reactive_power')
