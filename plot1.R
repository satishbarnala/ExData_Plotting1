
# Read file with sep=";" and na.string = "?"
dfall <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";", na.strings="?",stringsAsFactors=FALSE)

# Create new column 'DateTime' by concatenating 'Date' and 'Time' and coverting to DateTime format
dfall$DateTime <- strptime(paste(dfall$Date,' ',dfall$Time),"%d/%m/%Y %H:%M:%S") 

# Convert 'Date' column to date format
dfall$Date <- as.Date(dfall$Date,"%d/%m/%Y") 

# Subset the data frame get observations for "2007-02-01" and "2007-02-02"
dfset <- dfall[(dfall$Date=="2007-02-01"|dfall$Date=="2007-02-02"),]


# Set the frame
png("plot1.png")  

# Plot the Chart
hist(as.numeric(dfset$Global_active_power),main="Global Active Power",  xlab="Global Active Power (kilowatts)",col="red")  

# Close the Frame
dev.off() 
