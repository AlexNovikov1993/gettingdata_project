Codebook
--------------------------------------------

The purpose of the following codebook is to provide you some information about the data used and about the transformations used to obtain the tidy data set (look at README.md). 

### General overview and expiremenal design

The data set "tidydata" contains data about the average values of the means and standard deviations from different variables measured during the Human Activity Recognition Using Smartphones data set experiments. Overall, there are 180 observations (rows) and 68 variables (columns) in the data set. This data is based on the original raw data from the above mentioned experiment. You can easily obtain full description of the initial data set and experimental design at the [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data" [[Human Activity Recognition Using Smartphones data set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)].

### Transformations of the initial data set

To obtain the variables that are needed for the purposes of the assignment, we had to perform a series of transformations with the raw data provided:

1. Merged train and test data sets;
2. Used descriptive activity names to label the activities;
3. Merged the data with labeled activity names;
4. Named columns in the data set to simplify operations with the data;
4. Extracted only the measurements on the mean and standard deviation for each measurement;
5. Added subject names to the data set
6. Calculated means of the original measures by activity and subject and saved the results in the new variables;
7. Added appropriate variable names to represent its content.


### List of variables
**1. "subject"**: Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.

**2. "activity"**: Represents activities which each subject performed

The following variables represent the averages of the means and standard deviations from the measures in the raw data. Full description of the original measures are stored at the data set [website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

**3. "avg_tBodyAcc-mean()-X"**

**4. "avg_tBodyAcc-mean()-Y"** 

**5. "avg_tBodyAcc-mean()-Z"**

**6. "avg_tBodyAcc-std()-X"**

**7. "avg_tBodyAcc-std()-Y"**

**8. "avg_tBodyAcc-std()-Z"**         

**9. "avg_tGravityAcc-mean()-X"**

**10. "avg_tGravityAcc-mean()-Y"**     

**11. "avg_tGravityAcc-mean()-Z"**

**12. "avg_tGravityAcc-std()-X"**       

**13. "avg_tGravityAcc-std()-Y"**

**14. "avg_tGravityAcc-std()-Z"**     

**15. "avg_tBodyAccJerk-mean()-X"**

**16. "avg_tBodyAccJerk-mean()-Y"**    

**17. "avg_tBodyAccJerk-mean()-Z"**

**18. "avg_tBodyAccJerk-std()-X"**     

**19. "avg_tBodyAccJerk-std()-Y"**

**20. "avg_tBodyAccJerk-std()-Z"**      

**21. "avg_tBodyGyro-mean()-X"**

**22. "avg_tBodyGyro-mean()-Y"**       

**23. "avg_tBodyGyro-mean()-Z"**

**24. "avg_tBodyGyro-std()-X"**        

**25. "avg_tBodyGyro-std()-Y"**

**26. "avg_tBodyGyro-std()-Z"**        

**27. "avg_tBodyGyroJerk-mean()-X"**

**28. "avg_tBodyGyroJerk-mean()-Y"**    

**29. "avg_tBodyGyroJerk-mean()-Z"**

**30. "avg_tBodyGyroJerk-std()-X"**    

**31. "avg_tBodyGyroJerk-std()-Y"**

**32. "avg_tBodyGyroJerk-std()-Z"**    

**33. "avg_tBodyAccMag-mean()"**

**34. "avg_tBodyAccMag-std()"**        

**35. "avg_tGravityAccMag-mean()"**

**36. "avg_tGravityAccMag-std()"**

**37. "avg_tBodyAccJerkMag-mean()"**

**38. "avg_tBodyAccJerkMag-std()"**    

**39. "avg_tBodyGyroMag-mean()"**

**40. "avg_tBodyGyroMag-std()"**     

**41. "avg_tBodyGyroJerkMag-mean()"**

**42. "avg_tBodyGyroJerkMag-std()"**   

**43. "avg_fBodyAcc-mean()-X"**

**44. "avg_fBodyAcc-mean()-Y"**       

**45. "avg_fBodyAcc-mean()-Z"**

**46. "avg_fBodyAcc-std()-X"**          

**47. "avg_fBodyAcc-std()-Y"**

**48. "avg_fBodyAcc-std()-Z"**         

**49. "avg_fBodyAccJerk-mean()-X"**

**50. "avg_fBodyAccJerk-mean()-Y"**  

**51. "avg_fBodyAccJerk-mean()-Z"**

**52. "avg_fBodyAccJerk-std()-X"**       

**53. "avg_fBodyAccJerk-std()-Y"**

**54. "avg_fBodyAccJerk-std()-Z"**     

**55. "avg_fBodyGyro-mean()-X"**

**56. "avg_fBodyGyro-mean()-Y"**       

**57. "avg_fBodyGyro-mean()-Z"**

**58. "avg_fBodyGyro-std()-X"**       

**59. "avg_fBodyGyro-std()-Y"**

**60. "avg_fBodyGyro-std()-Z"**        

**61. "avg_fBodyAccMag-mean()"**

**62. "avg_fBodyAccMag-std()"**    

**63. "avg_fBodyBodyAccJerkMag-mean()"**

**64. "avg_fBodyBodyAccJerkMag-std()"**

**65. "avg_fBodyBodyGyroMag-mean()"**

**66. "avg_fBodyBodyGyroMag-std()"**  

**67. "avg_fBodyBodyGyroJerkMag-mean()"**

**68. "avg_fBodyBodyGyroJerkMag-std()"**
