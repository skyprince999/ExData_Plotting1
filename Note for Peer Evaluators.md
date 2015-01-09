Note for Peer Evaluators 

Dear friends, 
Kindly note the following:
1. The data required for the project is not stored in the github repo, due to the file size restrictions
2. The following functions are used for downloading and cleaning the data
getFileData() and cleanDataFile()
The functions are stored in getFileData.R
3. In case you plan to clone and run the scripts on your machine, kindly run the following commands
4. first set the working directory to the folder in which you have cloned the files
setwd("..../ExData_Plotting1")
then source the following script -- 
source(".../ExData_Plotting1/getFileData.R")
5. After this you can run the plotX.R scripts in any order
6. The function getFileData() downloads the file from the url given in the instructions and unzips it at "....ExData_Plotting1/data"
7. The function cleanDataFile() opens the text file and reads the relevant rows into a data table. The data is coerced to numeric 
8. The data tables are stored in the global env, to ensure that all the other scripts can use them 
9. When any of the plotX.R scripts are executed. They first check if the data file is present in the data folder. If it doesn't exist, then getFileData() function is executed to download and unzip the file
10. Then the code checks if any of the data has been loaded into the global env by any of the previous scripts. If not, then the function cleanDataFile() is run for reading the relevant rows into a data frame. The data is then coerced to numeric and the day vector for the x-axis is prepared.