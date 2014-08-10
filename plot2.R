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

png(filename="plot2.png", width=480, height=480, units="px")

plot(df$globalActivePower, 
     type="l",
     xaxt="n",
     xlab="", 
     ylab="Global Active Power (kilowatts)")

axis(1, at=c(1, as.integer(nrow(df)/2), nrow(df)), 
     labels=c("Thu", "Fri", "Sat")) #plot and save graph

dev.off()