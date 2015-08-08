# Coursera Course ID: exdata-031 - Exploratory Data Analysis
# Course Project 1
# Plot 4

plot4 <- function() {
    
    fl <- "~/Workspace/R/Input Data/exdata-031/household_power_consumption.txt"
    
    DF <- read.table(file=fl, sep=";",header = TRUE, quote = "", 
                     skip=66637,nrows = 2880)
    
    names(DF) <- c("Date","Time","Global_active_power",
                   "Global_reactive_power","Voltage","Global_intensity",
                   "Sub_metering_1","Sub_metering_2","Sub_metering_3")
    DF$datetime <- with(DF,as.POSIXct(paste(Date,Time),
                                     format="%d/%m/%Y %H:%M:%S"))
    
    png("plot4.png", width = 480, height = 480)
    
    par(mfrow=c(2,2))
    
    with(DF, {
        plot(datetime,Global_active_power,type="l",xlab="",
             ylab="Global Active Power")
        plot(datetime,Voltage,type="l",xlab="datetime",ylab='Voltage')
        
        plot(Sub_metering_1 ~ datetime,type='n',xlab="",
             ylab="Energy sub metering")
        lines(Sub_metering_1 ~ datetime, DF,col="black")
        lines(Sub_metering_2 ~ datetime, DF,col="red")
        lines(Sub_metering_3 ~ datetime, DF,col="blue")
        legend("topright",lty=c(1,1),col = c("black","blue","red"), 
               cex = 0.8,
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        
        plot(datetime,Global_reactive_power,type="l")
    })
    
    dev.off()
}
