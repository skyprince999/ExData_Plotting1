## OS: Windows 7 R-ver: v3.1.2
##
## This script plots four line graphs for the following variables
## Global_active_power, Voltage, sub_metering_1/2/3 and Global_reactive_power
## in a single plot area 
## These values are plotted for the following dates : 2007-02-01 to 2007-02-02
## and stored in plot4.png. The plot files are stored in the figure folder
## 
## data file "household_power_consumption.txt" is stored inside the data folder
##
## if the file is not present in the folder, the script will call the routine 
## getFileData() and download and unzip the file in the data folder
## This function is defined in getFileData.R
## kindly read "Note for Peer Evaluators.md" before running this script
##

if(!file.exists("./data/household_power_consumption.txt")){
  getFileData()
  
}

## This checks if the data has been read and cleaned into a data table by some
## other script. If the data table is not present in the global env then the 
## function cleanFileData() is called. This function is defined in getFileData.R
##

tryCatch( {
  temp<-is.character(gAPDF$Global_Active_Power[1])
  },
  error=function(e){
    cleanFileData()}
  )


message("Plotting graph plot4.png....")
# make a call to device driver
png(filename="./figure/plot4.png",width=480,height=480,bg="transparent")

# plot global_active_power as a line chart
par(mfrow=c(2,2),cex=0.8)
plot(gAPDF$Global_Active_Power~dayVector,main="",xlab="",ylab="Global Active Power",type='l')

plot(gAPDF$Voltage~dayVector,main="",xlab="datetime",ylab="Voltage",type='l')

plot(meterDF$Sub_metering_1~dayVector,main="",xlab="",ylab="Energy sub metering",type='l')
lines(meterDF$Sub_metering_2~dayVector,type='l',col='red')
lines(meterDF$Sub_metering_3~dayVector,type='l',col='blue')
legend('topright',pch="",lwd=1,col=c("black","red","blue"),legend=names(meterDF),bty='n')

plot(gAPDF$Global_Reactive_Power~dayVector,main="",xlab="datetime",ylab="Global_reactive_power",type='l')

dev.off()


