gettingdata_project
===================

The following code will perform a series of operations to download, reshape Human Activity Recognition
Using Smartphones Dataset and will save it then in the form of tidy data.

The first step is to download data to your current working directory and unzip it (note: make sure that R
can create files in your directory!). If you already have the data downloaded and unzipped, please, skip this step.
But in this case, please, make sure you have a folder "UCI HAR Dataset" in your working directory.
```
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file (fileUrl, destfile = paste(getwd(), '/data.zip', sep=''))
unzip('data.zip', exdir = getwd())
```
The next step is to read train and test data; as well as its  labels and names.
```
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_l <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_s <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_l <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_s <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_l <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
cnames <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
```
Then, we have to merge train and test data sets. After that we have 10299 observations in total.
```
data <- rbind(train, test)
data_l <- rbind(train_l, test_l)
data_s <- rbind(train_s, test_s)
```
Next, we use descriptive activity names (object "activity_l") to name the activities in the data set.
```
data_l <- factor (data_l[,1], labels = activity_l[,2])
```
Merging data set and activity names:
```
data <- cbind(data_l, data)
## Labeling the data set ("cnames")
colnames(data) <- c("activity", cnames[,2])
## Extracingt only the measurements on the mean and standard deviation for each measurement
data_t <- data[,c(1:7, 42:47, 82:87, 122:127, 162:167, 202, 203, 215, 216, 228, 229, 241, 242, 254, 255,
                  267:272, 346:351, 425:430, 504, 505, 517, 518, 530, 531, 543, 544)]
```
Here we are adding a column with subjects:
```
colnames(data_s) <- "subject"
subject <- factor(data_s$subject)
data_t <- cbind(subject, data_t)
```
Finally, it is time to create a second, independent tidy data set with the average of each variable for each
activity and each subject (30 obs. of 134 variables)
```
data <- melt(data_t, id.vars=c("subject", "activity"))
d1 <- dcast(data = data, subject ~ variable, fun = mean)
d2 <- dcast(data = data, activity ~ variable, fun = mean)
data <- cbind(d1, d2)
```
However, it is reasonable to reorder columns to put "subject" and "activity" at the beginning
```
colorder <- c("subject", "activity","tBodyAcc-mean()-X","tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X",
              "tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X","tGravityAcc-mean()-Y",
              "tGravityAcc-mean()-Z","tGravityAcc-std()-X","tGravityAcc-std()-Y","tGravityAcc-std()-Z",
              "tBodyAccJerk-mean()-X","tBodyAccJerk-mean()-Y",      
              "tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X","tBodyAccJerk-std()-Y",       
              "tBodyAccJerk-std()-Z","tBodyGyro-mean()-X","tBodyGyro-mean()-Y",         
              "tBodyGyro-mean()-Z","tBodyGyro-std()-X","tBodyGyro-std()-Y",          
              "tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X","tBodyGyroJerk-mean()-Y",     
              "tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X","tBodyGyroJerk-std()-Y",      
              "tBodyGyroJerk-std()-Z","tBodyAccMag-mean()","tBodyAccMag-std()", 
              "tGravityAccMag-mean()","tGravityAccMag-std()","tBodyAccJerkMag-mean()",     
              "tBodyAccJerkMag-std()", "tBodyGyroMag-mean()","tBodyGyroMag-std()",    
              "tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()","fBodyAcc-mean()-X",         
              "fBodyAcc-mean()-Y","fBodyAcc-mean()-Z","fBodyAcc-std()-X",           
              "fBodyAcc-std()-Y","fBodyAcc-std()-Z","fBodyAccJerk-mean()-X",      
              "fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z","fBodyAccJerk-std()-X",       
              "fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z","fBodyGyro-mean()-X",    
              "fBodyGyro-mean()-Y","fBodyGyro-mean()-Z","fBodyGyro-std()-X",    
              "fBodyGyro-std()-Y","fBodyGyro-std()-Z","fBodyAccMag-mean()",       
              "fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()","fBodyBodyAccJerkMag-std()",
              "fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()","fBodyBodyGyroJerkMag-mean()",
              "fBodyBodyGyroJerkMag-std()","tBodyAcc-mean()-X",
              "tBodyAcc-mean()-Y","tBodyAcc-mean()-Z","tBodyAcc-std()-X",           
              "tBodyAcc-std()-Y","tBodyAcc-std()-Z","tGravityAcc-mean()-X",       
              "tGravityAcc-mean()-Y","tGravityAcc-mean()-Z","tGravityAcc-std()-X",        
              "tGravityAcc-std()-Y","tGravityAcc-std()-Z","tBodyAccJerk-mean()-X",     
              "tBodyAccJerk-mean()-Y","tBodyAccJerk-mean()-Z","tBodyAccJerk-std()-X",       
              "tBodyAccJerk-std()-Y","tBodyAccJerk-std()-Z","tBodyGyro-mean()-X",    
              "tBodyGyro-mean()-Y","tBodyGyro-mean()-Z","tBodyGyro-std()-X",    
              "tBodyGyro-std()-Y","tBodyGyro-std()-Z","tBodyGyroJerk-mean()-X",     
              "tBodyGyroJerk-mean()-Y","tBodyGyroJerk-mean()-Z","tBodyGyroJerk-std()-X",      
              "tBodyGyroJerk-std()-Y","tBodyGyroJerk-std()-Z","tBodyAccMag-mean()",   
              "tBodyAccMag-std()","tGravityAccMag-mean()","tGravityAccMag-std()",    
              "tBodyAccJerkMag-mean()","tBodyAccJerkMag-std()","tBodyGyroMag-mean()",        
              "tBodyGyroMag-std()","tBodyGyroJerkMag-mean()","tBodyGyroJerkMag-std()",     
              "fBodyAcc-mean()-X","fBodyAcc-mean()-Y","fBodyAcc-mean()-Z",
              "fBodyAcc-std()-X","fBodyAcc-std()-Y","fBodyAcc-std()-Z",       
              "fBodyAccJerk-mean()-X", "fBodyAccJerk-mean()-Y","fBodyAccJerk-mean()-Z",      
              "fBodyAccJerk-std()-X","fBodyAccJerk-std()-Y","fBodyAccJerk-std()-Z",  
              "fBodyGyro-mean()-X","fBodyGyro-mean()-Y", "fBodyGyro-mean()-Z",  
              "fBodyGyro-std()-X","fBodyGyro-std()-Y","fBodyGyro-std()-Z",      
              "fBodyAccMag-mean()","fBodyAccMag-std()","fBodyBodyAccJerkMag-mean()",
              "fBodyBodyAccJerkMag-std()","fBodyBodyGyroMag-mean()","fBodyBodyGyroMag-std()", "fBodyBodyGyroJerkMag-mean()","fBodyBodyGyroJerkMag-std()"
)
tidydata <- data[,colorder]
```
With this command we are saving our tidy data set into the file "tidydata.txt"
```
write.table(tidydata, file = "tidydata.txt")
```
Now you can use it for any purpose. The file contains means of the initial variables by subject and activity.
