# Read full dataset into R
mydata <- read.csv("./household_power_consumption.txt", head=T, sep=";", na.strings="?", stringsAsFactors=F)  
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Subset the data
subsetted <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

# Convert dates
datetime <- paste(as.Date(subsetted$Date), subsetted$Time)
subset$Datetime <- as.POSIXct(datetime)

# Create plot (Plot 2)
plot(subset$Global_active_power~subset$Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")

# Save plot as PNG file
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
