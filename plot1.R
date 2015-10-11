#load data file
        hpc <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

#subset the data file for specific dates (1/2/2007 & 2/2/2007)
        dates <- c("1/2/2007", "2/2/2007")
        specificdates <- hpc[hpc$Date %in% dates,]

#pull data on Global Active Power
        GAP <- as.numeric(specificdates$Global_active_power)

#create plot
        png("plot1.png", width = 480, height = 480)
        hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
        