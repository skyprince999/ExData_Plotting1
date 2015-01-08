## OS: Windows 7 R-ver: v3.1.2
##
## This script plots an histogram of Global_active_power 
## for values between the following dates : 2007-02-01 to 2007-02-02
## and stores it in plot1.png. The plot files are stored in the following
## figure folder
## data file "household_power_consumption.txt" is stored inside the data folder
##

library(data.table)

fileName="./data/household_power_consumption.txt"

# count the number of observations in the window between: 2007-02-01 and 2007-02-02
# number of obs = 2 days * 24 hrs * 60 min  = 2880
nobs = 2*24*60

# read only relevant observations from the file 
gAPTable<-suppressWarnings(fread(fileName,sep=';',na.strings=';?;',header=TRUE,select=3,skip="31/1/2007;23:59:00;",nrows=nobs,colClasses=c("numeric")))

# coerce to numeric vector
setnames(gAPTable,"Global_Active_Power")
gAPVector<-as.numeric(gAPTable$Global_Active_Power)

# make a call to device driver
png(filename="./figure/plot1.png",width=480,height=480)
# plot histogram
hist(gAPVector,main="Global Active Power",xlab="Global Active Power(kilowatts)",col="red")

dev.off()





