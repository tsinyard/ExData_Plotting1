#load data file
        hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset the data file for specific dates (1/2/2007 & 2/2/2007)
        dates <- c("1/2/2007", "2/2/2007")
        specificdates <- hpc[hpc$Date %in% dates,]

#create vector with time
        dateandtime <- strptime(paste(specificdates$Date, specificdates$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
        
#pull data on Global Active Power
        GAP <- as.numeric(specificdates$Global_active_power)

#create plot
        png("plot2.png", width = 480, height = 480)
        plot(dateandtime, GAP, type="l", ylab = "Global Active Power (kilowatts)", xlab = "")
        dev.off()
