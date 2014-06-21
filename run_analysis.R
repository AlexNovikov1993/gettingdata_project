## The following code will perform a series of operations to download, reshape Human Activity Recognition
## Using Smartphones Dataset and will save it then in the form of tidy data.

## NOTE: to perform some of the following computations you have to install and load package "reshape2".
## If you haven't done it, run this code, otherwise, skip the step.
install.packages("reshape2")
library(reshape2)

## Downloading data to your current working directory and unziping it (NOTE: make sure R can create
## files in your directory!). If you already have the data downloaded and unzipped, skip this step.
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file (fileUrl, destfile = paste(getwd(), '/data.zip', sep=''))
unzip('data.zip', exdir = getwd())

## Reading train and test data; labels and names
train <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_l <- read.table("./UCI HAR Dataset/train/y_train.txt")
train_s <- read.table("./UCI HAR Dataset/train/subject_train.txt")
test <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_l <- read.table("./UCI HAR Dataset/test/y_test.txt")
test_s <- read.table("./UCI HAR Dataset/test/subject_test.txt")
activity_l <- read.table("./UCI HAR Dataset/activity_labels.txt", stringsAsFactors = FALSE)
cnames <- read.table("./UCI HAR Dataset/features.txt", stringsAsFactors = FALSE)
## Merging train and test data sets (10299 observations in total)
data <- rbind(train, test)
data_l <- rbind(train_l, test_l)
data_s <- rbind(train_s, test_s)
## Using descriptive activity names ("activity_l") to name the activities in the data set 
data_l <- factor (data_l[,1], labels = activity_l[,2])
## Merging data set and activity names
data <- cbind(data_l, data)
## Labeling the data set ("cnames")
colnames(data) <- c("activity", cnames[,2])
## Extracting only the measurements on the mean and standard deviation for each measurement
data_t <- data[,c(1:7, 42:47, 82:87, 122:127, 162:167, 202, 203, 215, 216, 228, 229, 241, 242, 254, 255,
                  267:272, 346:351, 425:430, 504, 505, 517, 518, 530, 531, 543, 544)]
## Creating factor "subect" containing subject names and adding it to the data set
subject <- factor(data_s[,1])
data_t <- cbind(subject, data_t)
## Creating a second, independent tidy data set with the average of each variable for each
## activity and each subject. Melting and casting data:
data <- melt(data_t, id.vars=c("subject", "activity"))
tidydata <- dcast(data = data, subject + activity ~ variable, fun = mean)
## Changing column names to more appropriate
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
## Writing the data into file "tidydata.txt"
write.table(tidydata, file = "tidydata.txt")
