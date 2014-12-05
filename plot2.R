

plot2 <- function(){
	
	#download and unzip the file 
	download.file('https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip',
		 'household_power_consumption.zip', method='curl')
	unzip('household_power_consumption.zip')
	
	#determine how many rows to skip when reading the file
	start <- strptime("2006-12-16 17:24:00", format = '%Y-%m-%d %H:%M:%S')
	feb1 <- strptime("2007-02-01 00:00:00", format = '%Y-%m-%d %H:%M:%S')
	skip <- difftime(feb1, start, unit='mins')

	#read only the relevant rows of the files
	nrow <- 2*24*60
	header <- c('Date', 'Time', "Global_active_power", "Global_reactive_power", 'Voltage', 'Global_intensity', 	
		'Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3')
	data <- read.table('household_power_consumption.txt', header = TRUE, sep = ";", skip = skip, nrow = nrow, col.names = header)
	
	#create plot2.png
	png(filename = "plot2.png", width = 480, height = 480, units = "px")
	time <- strptime(paste(data[,'Date'], data[, 'Time']), format = '%d/%m/%Y %T')
	plot(time, data[, 'Global_active_power'], type ='n', xlab ='', ylab='Global Active Power (kilowatts)')
	lines(time, data[, 'Global_active_power'])
	dev.off() 
}