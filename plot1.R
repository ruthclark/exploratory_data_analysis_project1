# Read full dataset into R
mydata <- read.csv("./household_power_consumption.txt", head=T, sep=";", na.strings="?", stringsAsFactors=F)  
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Subset the data
subsetted <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

# Create histogram (Plot 1)
hist(subset$Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", main="Global Active Power", col="red")

# Save plot as PNG file
dev.copy(png, file = "plot1.png", height=480, width=480)
dev.off()
