#load data file
        hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset the data file for specific dates (1/2/2007 & 2/2/2007)
        dates <- c("1/2/2007", "2/2/2007")
        specificdates <- hpc[hpc$Date %in% dates,]

#create vector with time
        dateandtime <- strptime(paste(specificdates$Date, specificdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#create vectors with desired data
        submeter1 <- as.numeric(specificdates$Sub_metering_1)
        submeter2 <- as.numeric(specificdates$Sub_metering_2)
        submeter3 <- as.numeric(specificdates$Sub_metering_3)
        GAP <- as.numeric(specificdates$Global_active_power)
        voltage <- as.numeric(specificdates$Voltage)
        GRP <- as.numeric(specificdates$Global_reactive_power)

#create plots
        png("plot4.png", width = 480, height = 480)
        par(mfrow = c(2,2))
        
        plot(dateandtime, GAP, type = "l", xlab = "", ylab = "Global Active Power")
        
        plot(dateandtime, voltage, type = "l", xlab = "datetime", ylab= "Voltage")
        
        plot(dateandtime, submeter1, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(dateandtime, submeter2, type = "l", col = "red")
        lines(dateandtime, submeter3, type = "l", col = "blue")
        legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty = "n")
        
        plot(dateandtime, GRP, type = "l", xlab = "datetime", ylab = "Global_reactive_power" )
        
        dev.off()
