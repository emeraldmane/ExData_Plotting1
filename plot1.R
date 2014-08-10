#Database located in working directory

HPCData <- "household_power_consumption.txt" #file name


columnNames = c("date", "time", "globalActivePower", "globalReactivePower", "voltage", "globalIntensity", "subMetering1", "subMetering2", "subMetering3")

columnClasses = c("character", "character", rep("numeric",7) )  #column names

df <- read.table(HPCData, 
                 header=TRUE, 
                 sep=";", 
                 col.names=columnNames, 
                 na.strings="?") #read file

df$date = as.Date(df$date, format="%d/%m/%Y")

df = df[df$date >= as.Date("2007-02-01") & df$date<=as.Date("2007-02-02"),] #Data conversion and filtering

png(filename="plot1.png", width=480, height=480, units="px")

hist(df$globalActivePower, 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     col="red") #plot and save graph

dev.off()