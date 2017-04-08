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

##Creating Plot1
hist(datasubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

## Save to device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()