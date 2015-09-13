# Read full dataset into R
mydata <- read.csv("./household_power_consumption.txt", head=T, sep=";", na.strings="?", stringsAsFactors=F)  
mydata$Date <- as.Date(mydata$Date, format="%d/%m/%Y")

# Subset the data
subsetted <- subset(mydata, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(mydata)

# Convert dates
datetime <- paste(as.Date(subsetted$Date), subsetted$Time)
subsetted$datetime <- as.POSIXct(datetime)
na.omit(subsetted)

# Create plot (Plot 4)
global_active_power <- as.numeric(subsetted$Global_active_power)
global_reactive_power <- as.numeric(subsetted$Global_reactive_power)
voltage <- as.numeric(subsetted$Voltage)
sub_metering_1 <- as.numeric(subsetted$Sub_metering_1)
sub_metering_2 <- as.numeric(subsetted$Sub_metering_2)
sub_metering_3 <- as.numeric(subsetted$Sub_metering_3)

par(mfrow=c(2,2), mar=c(4,4,1,0.5), oma=c(0,0,2,1)) 
with (subsetted, {
  plot(Global_active_power~datetime, type="l", ylab="Global Active Power", xlab="")
  plot(Voltage~datetime, type="l", ylab="Voltage", xlab="datetime")
  plot(Sub_metering_1~datetime, type="l", ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~datetime, type="l", col="red")
  lines(Sub_metering_3~datetime, type="l", col="blue")  
  
  # Add legend to plot
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.6)
  
  plot(Global_reactive_power~datetime, type="l", ylab="Global_reactive_power",xlab="datetime")
})

# Save plot as PNG file
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()
