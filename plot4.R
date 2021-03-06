plot4 <- function() {
  
  ## Loading the data
  rawdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",
                        na.strings="?")
  rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
  
  ## Filtering and putting Date & Time together
  data <- subset(rawdata, (Date >= "2007-02-01" & Date <= "2007-02-02"))
  data$Date_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))
  
  ## Generating Plot
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data, {
    plot(Global_active_power~Date_time, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~Date_time, type="l", 
         ylab="Voltage", xlab="datetime")
    plot(Sub_metering_1~Date_time, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Date_time,col='Red')
    lines(Sub_metering_3~Date_time,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Date_time, type="l", 
         ylab="Global_rective_power",xlab="datetime")
  })
  
  ## Copying to png 480x480
  dev.copy(png, file="plot4.png", height=480, width=480)
  dev.off()
  
}