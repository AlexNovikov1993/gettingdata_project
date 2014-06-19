## The following code will perform a series of operations to download, reshape Human Activity Recognition
## Using Smartphones Dataset and will save it then in the form of tidy data.

## Downloading data to your current working directory and unziping it (NOTE: make sure that R can create
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
## Adding subject names
colnames(data_s) <- "subject"
data_t <- cbind(subject, data_t)
## Creating a second, independent tidy data set with the average of each variable for each
## activity and each subject. To perform the following computations you have to install and load package
## "reshape2". If you haven't done it follow the next step, otherwise, skip it.

## Installing and loading "reshape2" package
install.packages("reshape2")
library(reshape2)
## Melting and casting data
data <- melt(data_t, id.vars=c("subject", "activity"))
d1 <- dcast(data = data, subject ~ variable, fun = mean)
d2 <- dcast(data = data, activity ~ variable, fun = mean)
