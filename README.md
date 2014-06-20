Getting and Cleaning Data course project - README
===================

The following code will perform a series of operations to download and reshape Human Activity Recognition
Using Smartphones Dataset to obtain the average value of the represented variables; and it will save the Dataset then in the form of tidy data.

A full description is available at the site where the data was obtained:
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

Here are the data for the project:

<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

NOTE: to perform some of the following computations you have to install and load package "reshape2". If you haven't done it, run this code, otherwise, skip the step.
```
install.packages("reshape2")
library(reshape2)
```

The first step is to download data to your current working directory and unzip it (NOTE: make sure R
can create files in your directory!). If you already have the data downloaded and unzipped, please, skip this step. But in this case, please, make sure you have a folder "UCI HAR Dataset" with the Dataset in your working directory.
```
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file (fileUrl, destfile = paste(getwd(), '/data.zip', sep=''))
unzip('data.zip', exdir = getwd())
```
The next step is to read train and test data; as well as its labels and names. To do that we use command "read.table"
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
Following the assignment instructions, we have to merge train and test data sets. After that we have 10299 observations in total. We use "rbind" command to perform that.
```
data <- rbind(train, test)
data_l <- rbind(train_l, test_l)
data_s <- rbind(train_s, test_s)
```
Next, we use descriptive activity names (object "activity_l") to name the activities.
```
data_l <- factor (data_l[,1], labels = activity_l[,2])
```
Next, we have to merge our data with activity names.
```
data <- cbind(data_l, data)
```
The next step is to label data with variable names stored in the object "cnames". We are doing this as an intermediate step to check the variables in the data.
```
colnames(data) <- c("activity", cnames[,2])
```
Here we extract only the measurements on the mean and standard deviation for each measurement:
```
data_t <- data[,c(1:7, 42:47, 82:87, 122:127, 162:167, 202, 203, 215, 216, 228, 229, 241, 242, 254, 255,
                  267:272, 346:351, 425:430, 504, 505, 517, 518, 530, 531, 543, 544)]
```
Next, we have to add subject names to the data set. To do that we, firstly, create a factor out of the object "data_s" (to have all groups by which we will count means as factors). Then, we add it to our data.
```
subject <- factor(data_s[,1])
data_t <- cbind(subject, data_t)
```
It is time to create a second, independent tidy data set with the average of each variable for each activity and each subject. Having 30 subjects and 6 types of activity we will have a data set with 180 obs. of 68 variables. To do that we use functions "melt" to melt the data and "dcast" to calculate means by two groups.
```
data <- melt(data_t, id.vars=c("subject", "activity"))
tidydata <- dcast(data = data, subject + activity ~ variable, fun = mean)
```
According to the article of H. Wickham (<http://vita.had.co.nz/papers/tidy-data.pdf>), one of the properties of "tidy data" is that column headers must be readible and appropriate variable names. The following commands change the names os the variables in the data set.
```
colnames <- c("subject","activity","avg_tBodyAcc-mean()-X","avg_tBodyAcc-mean()-Y","avg_tBodyAcc-mean()-Z",
"avg_tBodyAcc-std()-X","avg_tBodyAcc-std()-Y","avg_tBodyAcc-std()-Z","avg_tGravityAcc-mean()-X",
"avg_tGravityAcc-mean()-Y","avg_tGravityAcc-mean()-Z","avg_tGravityAcc-std()-X","avg_tGravityAcc-std()-Y",
"avg_tGravityAcc-std()-Z","avg_tBodyAccJerk-mean()-X","avg_tBodyAccJerk-mean()-Y","avg_tBodyAccJerk-mean()-Z",
"avg_tBodyAccJerk-std()-X","avg_tBodyAccJerk-std()-Y","avg_tBodyAccJerk-std()-Z","avg_tBodyGyro-mean()-X",
"avg_tBodyGyro-mean()-Y","avg_tBodyGyro-mean()-Z","avg_tBodyGyro-std()-X","avg_tBodyGyro-std()-Y",
"avg_tBodyGyro-std()-Z","avg_tBodyGyroJerk-mean()-X","avg_tBodyGyroJerk-mean()-Y","avg_tBodyGyroJerk-mean()-Z",
"avg_tBodyGyroJerk-std()-X","avg_tBodyGyroJerk-std()-Y","avg_tBodyGyroJerk-std()-Z","avg_tBodyAccMag-mean()",
"avg_tBodyAccMag-std()","avg_tGravityAccMag-mean()","avg_tGravityAccMag-std()","avg_tBodyAccJerkMag-mean()",
"avg_tBodyAccJerkMag-std()","avg_tBodyGyroMag-mean()","avg_tBodyGyroMag-std()","avg_tBodyGyroJerkMag-mean()",
"avg_tBodyGyroJerkMag-std()","avg_fBodyAcc-mean()-X","avg_fBodyAcc-mean()-Y","avg_fBodyAcc-mean()-Z",
"avg_fBodyAcc-std()-X","avg_fBodyAcc-std()-Y","avg_fBodyAcc-std()-Z","avg_fBodyAccJerk-mean()-X",
"avg_fBodyAccJerk-mean()-Y","avg_fBodyAccJerk-mean()-Z","avg_fBodyAccJerk-std()-X","avg_fBodyAccJerk-std()-Y",
"avg_fBodyAccJerk-std()-Z","avg_fBodyGyro-mean()-X","avg_fBodyGyro-mean()-Y","avg_fBodyGyro-mean()-Z",
"avg_fBodyGyro-std()-X","avg_fBodyGyro-std()-Y","avg_fBodyGyro-std()-Z","avg_fBodyAccMag-mean()",
"avg_fBodyAccMag-std()","avg_fBodyBodyAccJerkMag-mean()","avg_fBodyBodyAccJerkMag-std()",
"avg_fBodyBodyGyroMag-mean()", "avg_fBodyBodyGyroMag-std()","avg_fBodyBodyGyroJerkMag-mean()","avg_fBodyBodyGyroJerkMag-std()")
colnames(tidydata) <- colnames
```
Finally, with this command we are saving our tidy data set into the file "tidydata.txt"
```
write.table(tidydata, file = "tidydata.txt")
```
Now you can use it for any purpose. The file contains means of the initial variables by subject and activity. To explore the variables and the dataset in depth, have a look at CodeBook.md.
