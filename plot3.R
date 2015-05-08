
# Read file with sep=";" and na.string = "?"
dfall <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?",stringsAsFactors=FALSE)

# Create new column 'DateTime' by concatenating 'Date' and 'Time' and coverting to DateTime format
dfall$DateTime <- strptime(paste(dfall$Date,' ',dfall$Time),"%d/%m/%Y %H:%M:%S") 

# Convert 'Date' column to date format
dfall$Date <- as.Date(dfall$Date,"%d/%m/%Y") 

# Subset the data frame get observations for "2007-02-01" and "2007-02-02"
dfset <- dfall[(dfall$Date=="2007-02-01"|dfall$Date=="2007-02-02"),]


# Set the frame
png("plot3.png")  

# Plot the Chart
with(dfset,plot(DateTime,Sub_metering_1, type="n", xlab = "", ylab="Energy sub metering"))

  with(dfset,lines(DateTime,Sub_metering_1))
  with(dfset,lines(DateTime,Sub_metering_2, col="red"))
  with(dfset,lines(DateTime,Sub_metering_3, col="blue"))

legend("topright",lty=1,col=c("black", "red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Close the Frame
dev.off() 
