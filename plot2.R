## OS: Windows 7 R-ver: v3.1.2
##
## This script plots the variable Global_active_power as a line chart 
## for values between the following dates : 2007-02-01 to 2007-02-02
## and stores it in plot2.png. The plot files are stored in the figure folder
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

tryCatch( {
  temp<-is.character(gAPDF$Global_Active_Power[1])
},
error=function(e){
  cleanFileData()}
)

message("Plotting graph plot2.png....")
# make a call to device driver
png(filename="./figure/plot2.png",width=480,height=480,bg="transparent")
# plot global_active_power as a line chart
plot(gAPDF$Global_Active_Power~dayVector,main="",xlab="",ylab="Global Active Power(kilowatts)",type='l')

dev.off()

