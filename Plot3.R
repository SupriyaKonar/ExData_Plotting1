## Save the datafile
data <- "./exdata_data_household_power_consumption/household_power_consumption.txt"

## REading the entire dataset
dataset <- read.csv(data, header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

##Subsetting the data
datasubset <- subset(dataset, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(dataset)

## COnverting Dates and Datetime
datetime <- paste(as.Date(datasubset$Date), datasubset$Time)
datasubset$Datetime <- as.POSIXct(datetime)

##Creating Plot3
with(datasubset, {
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
})

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save to device
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()