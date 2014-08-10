plot2 <- function() {
  
  ## Loading the data
  rawdata <- read.table("./household_power_consumption.txt", header=TRUE, sep=";",
                        na.strings="?")
  rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
  
  ## Filtering and putting Date & Time together
  data <- subset(rawdata, (Date >= "2007-02-01" & Date <= "2007-02-02"))
  data$Date_time <- as.POSIXct(paste(as.Date(data$Date), data$Time))
  
  ## Generating Plot
  plot(data$Global_active_power~data$Date_time, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  
  ## Copying to png 480x480
  dev.copy(png, file="plot2.png", height=480, width=480)
  dev.off()
  
}