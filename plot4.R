
# Read file with sep=";" and na.string = "?"
dfall <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?",stringsAsFactors=FALSE)

# Create new column 'DateTime' by concatenating 'Date' and 'Time' and coverting to DateTime format
dfall$DateTime <- strptime(paste(dfall$Date,' ',dfall$Time),"%d/%m/%Y %H:%M:%S") 

# Convert 'Date' column to date format
dfall$Date <- as.Date(dfall$Date,"%d/%m/%Y") 

# Subset the data frame get observations for "2007-02-01" and "2007-02-02"
dfset <- dfall[(dfall$Date=="2007-02-01"|dfall$Date=="2007-02-02"),]


# Set the frame

png("plot4.png")  

# Plot the Chart
par(mfrow=c(2,2))
with(dfset, {
  
  plot(DateTime,Global_active_power, type="l", xlab = "", ylab="Global Active Power")
  
  plot(DateTime,Voltage, type="l", xlab = "datetime", ylab="Voltage")
  
  plot(DateTime,Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering")
  
    lines(DateTime,Sub_metering_1)
    lines(DateTime,Sub_metering_2, col="red")
    lines(DateTime,Sub_metering_3, col="blue")
    legend("topright",lty=1,col=c("black", "red","blue"), bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  plot(DateTime,Global_reactive_power, type="l", xlab = "datetime", ylab="Global_reactive_power")
  
})

# Close the Frame
dev.off()