## OS: Windows 7 R-ver: v3.1.2
##
## This script plots the variable Global_active_power as a line chart 
## for values between the following dates : 2007-02-01 to 2007-02-02
## and stores it in plot2.png. The plot files are stored in the following
## figure folder
## data file "household_power_consumption.txt" is stored inside the data folder
##

library(data.table)

fileName="./data/household_power_consumption.txt"

# count the number of observations in the window between: 2007-02-01 and 2007-02-02
# number of obs = 2 days * 24 hrs * 60 min  = 2880
nobs = 2*24*60

# read only relevant observations from the file 
gAPTable<-suppressWarnings(fread(fileName,sep=';',na.strings=';?;',header=TRUE,select=1:3,skip="31/1/2007;23:59:00;",nrows=nobs))

# coerce to numeric vector
setnames(gAPTable,c("Date","Time","Global_Active_Power"))
gAPVector<-as.numeric(gAPTable$Global_Active_Power)
dayVector<-(paste(gAPTable$Date,gAPTable$Time))

# make a call to device driver
#png(filename="./figure/plot2.png",width=480,height=480)
# plot global_active_power as a line chart
plot(gAPVector~dayVector,main="",ylab="Global Active Power(kilowatts)",type='l')

#dev.off()




