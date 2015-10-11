#load data file
        hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset the data file for specific dates (1/2/2007 & 2/2/2007)
        dates <- c("1/2/2007", "2/2/2007")
        specificdates <- hpc[hpc$Date %in% dates,]
        
#create vector with time
        dateandtime <- strptime(paste(specificdates$Date, specificdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#pull data on sub_metering power
        submeter1 <- as.numeric(specificdates$Sub_metering_1)
        submeter2 <- as.numeric(specificdates$Sub_metering_2)
        submeter3 <- as.numeric(specificdates$Sub_metering_3)
        
#create plot
        png("plot3.png", width = 480, height = 480)
        plot(dateandtime, submeter1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(dateandtime, submeter2, type = "l", col = "red")
        lines(dateandtime, submeter3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col=c("black", "red", "blue"))
        dev.off()
