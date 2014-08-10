plot3 <- function() {
  
  ## Loading the data
  rawdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",
                        na.strings="?")
  rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
  
  ## Filtering and putting Date & Time together
  data <- subset(rawdata, (Date >= "2007-02-01" & Date <= "2007-02-02"))
  data$Date_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))
  
  ## Generating Plot
  with(data, {plot(Sub_metering_1~Date_time, type="l", ylab="Energy sub metering", xlab="")
              lines(Sub_metering_2~Date_time,col='Red')
              lines(Sub_metering_3~Date_time,col='Blue')})
  
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2,
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  ## Copying to png 480x480
  dev.copy(png, file="plot3.png", height=480, width=480)
  dev.off()
  
}