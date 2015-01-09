########################################################################
## OS: Windows 7 R-ver: v3.1.2
##
## script to be used with the plotx.R files for downloading the data file 
## 
#########################################################################
library(data.table)
getFileData<- function(){
  
  #download and unzip file in ./data/household_power_consumption.txt
  
  fileURL="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  temp="./data/household_power_consumption.zip"
  
  message("Downloading file....")
  download.file(fileURL,temp)
  
  message("Unzipping file....")
  dataFolder="./data"
  unzip(temp,exdir=dataFolder)
  dataFile="./data/household_power_consumption.txt"
  
}

########################################################################
## OS: Windows 7 R-ver: v3.1.2
##
## Reads the data from the file and cleans it 
## (numeric coercion & date vectors). The data tables are stored in the
## global env, so they can be read by any of the other scripts
########################################################################


cleanFileData <- function(){
  
  
  # count the number of observations in the window between: 2007-02-01 and 2007-02-02
  dtime <- difftime(as.POSIXct("2007-02-03"), as.POSIXct("2007-02-01"),units="mins")
  nobs <-as.numeric(dtime)  
  
  message("Reading downloaded file....")
  dataFile="./data/household_power_consumption.txt"
  
  # read only relevant observations from the file for the above two days
  gAPTable<<-suppressWarnings(fread(dataFile,sep=';',na.strings=';?;',skip="1/2/2007",nrows=nobs))
  
  message("Cleaning Data....")
  # set names for the columns
  setnames(gAPTable,c("Date","Time","Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  #Prepare date/day vector to be used as the x-variable
  dayTime<<-paste(gAPTable$Date,gAPTable$Time)
  dayVector<<-as.POSIXct(strptime(dayTime,format="%d/%m/%Y %H:%M:%S"))
  
  #coerce to numeric data frame
  gAPDF<<-data.frame(as.numeric(gAPTable$Global_Active_Power),as.numeric(gAPTable$Global_Reactive_Power),as.numeric(gAPTable$Voltage),as.numeric(gAPTable$Global_Intensity))
  meterDF<<-data.frame(as.numeric(gAPTable$Sub_metering_1),as.numeric(gAPTable$Sub_metering_2),as.numeric(gAPTable$Sub_metering_3))
  
  # set names of data frame
  names(gAPDF)<<-c("Global_Active_Power","Global_Reactive_Power","Voltage","Global_Intensity")
  names(meterDF)<<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
  
  #removes the temporary data frames
  rm(list="gAPTable","dayTime",envir=globalenv())
}
