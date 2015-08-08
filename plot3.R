# Coursera Course ID: exdata-031 - Exploratory Data Analysis
# Course Project 1
# Plot 3


plot3 <- function() {
    
    fl <- "~/Workspace/R/Input Data/exdata-031/household_power_consumption.txt"
    
    DF <- read.table(file=fl, sep=";",header = TRUE, quote = "", 
                     skip=66637,nrows = 2880)
    
    names(DF) <- c("Date","Time","Global_active_power",
                   "Global_reactive_power","Voltage","Global_intensity",
                   "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    DF$newDate <- with(DF,as.POSIXct(paste(Date,Time),
                                     format="%d/%m/%Y %H:%M:%S"))
    
    png("plot3.png",width = 480, height = 480)
    
    plot(DF$Sub_metering_1 ~ DF$newDate,type='n',xlab="",
         ylab="Energy sub metering")
    lines(Sub_metering_1 ~ newDate, DF,col="black")
    lines(Sub_metering_2 ~ newDate, DF,col="red")
    lines(Sub_metering_3 ~ newDate, DF,col="blue")
    legend("topright",lty=c(1,1),col = c("black","blue","red"), 
           cex = 1.0,
          legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    
    dev.off()
}
