#Load Data
read_data <- read.table('household_power_consumption.txt', header = TRUE, sep = ';', na.strings = '?')
data <- read_data[read_data$Date %in% c("1/2/2007","2/2/2007"),]

Time_data <-strptime(paste(data$Date, data$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
data <- cbind(Time_data, data)
Sys.setlocale("LC_TIME", "C")

#plot 1

hist(data$Global_active_power, xlab = 'Global Active Power (kilowatts)', ylab = 'Frequency', col = 'red', main = 'Global Active Power')
dev.copy(png,"plot1.png", width=480, height=480)
dev.off()
