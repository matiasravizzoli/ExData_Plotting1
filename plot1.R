plot1 <- function() {
  
  ## Loading the data
  rawdata <- read.table("./household_power_consumption.txt", header=TRUE,
                        sep=";", na.strings="?")
  rawdata$Date <- as.Date(rawdata$Date, "%d/%m/%Y")
  
  ## Filtering dates
  data <- subset(rawdata, (Date >= "2007-02-01" & Date <= "2007-02-02"))
  
  ## Generating Plot
  hist(data$Global_active_power, main="Global Active Power",
       xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
  
  ## Copying to png 480x480
  dev.copy(png, file="plot1.png", height=480, width=480)
  dev.off()
  
}