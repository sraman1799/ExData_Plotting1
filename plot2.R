# Coursera Course ID: exdata-031 - Exploratory Data Analysis
# Course Project 1
# Plot 2 


plot2 <- function() {
    
    fl <- "~/Workspace/R/Input Data/exdata-031/household_power_consumption.txt"
    
    DF <- read.table(file=fl, sep=";",header = TRUE, quote = "", 
                     skip=66637,nrows = 2880)
    
    names(DF) <- c("Date","Time","Global_active_power",
                   "Global_reactive_power","Voltage","Global_intensity",
                   "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    DF$newDate <- with(DF,as.POSIXct(paste(Date,Time),
                                     format="%d/%m/%Y %H:%M:%S"))
    
    png("plot2.png",width = 480,height = 480)
    
    plot(DF$newDate,DF$Global_active_power, type='l',xlab = "",
        ylab = "Global Active Power (kilowatts)")
    
    dev.off()
}
