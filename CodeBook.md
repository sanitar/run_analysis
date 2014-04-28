CodeBook for run_analysis.R and initialize_data.R
=========================

initialize_data.R
-------------------------

The "initialize_data.R" script contains fuctiona with this steps:

1. It checks if data directory exists ("HAR" by default)
* If not, it will be created
2. Then it checks if data file exists (from previous downloads) and if not then downloads it from special url ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" by default)
3. Unzips data file to working directory


run_analysis.R
-------------------------

1. It loads reshape2-library (should be installed previously)
2. It loads initialize_data.R and runs function initialize_data() with default args to get input data files
3. It switches working directory to data direcotry
4. Then it will load all filtered features and all activites. 
5. There is one function named construct_data(), which can load both trains and tests:
  * It loads subjects, labels and sets (urls created by  using "name" argument)
  * Then it binds all 3 cols 
  * Clear variables from env and return data
6. Merge results of previous function with "train" and "test" arguments to get full dataset
7. The next step creates another dataframe that contains the mean of all columns by "subjectID" and "Acivity". This is reshape2 is used for.
8. Switches back to our working dirrectory and writes final tidy data to file "tidy_data.txt"

tidy_data.txt
-------------------------

Resulting data contains rhis cols:

1. subjectID: subject ID.
2. acitvity: type of acitivity
  *WALKING 
  *WALKING_UPSTAIRS 
  *WALKING_DOWNSTAIRS 
  *SITTING 
  *STANDING 
  *LAYING
3. feature: feaures: "tBodyAcc.mean...X", "tBodyAcc.mean...Y", "tBodyAcc.mean...Z", "tGravityAcc.mean...X", "tGravityAcc.mean...Y", "tGravityAcc.mean...Z", "tBodyAccJerk.mean...X", "tBodyAccJerk.mean...Y", "tBodyAccJerk.mean...Z", "tBodyGyro.mean...X", "tBodyGyro.mean...Y", "tBodyGyro.mean...Z", "tBodyGyroJerk.mean...X", "tBodyGyroJerk.mean...Y", "tBodyGyroJerk.mean...Z", "tBodyAccMag.mean..", "tGravityAccMag.mean..", "tBodyAccJerkMag.mean..", "tBodyGyroMag.mean..", "tBodyGyroJerkMag.mean..", "fBodyAcc.mean...X", "fBodyAcc.mean...Y", "fBodyAcc.mean...Z", "fBodyAcc.meanFreq...X", "fBodyAcc.meanFreq...Y", "fBodyAcc.meanFreq...Z", "fBodyAccJerk.mean...X", "fBodyAccJerk.mean...Y", "fBodyAccJerk.mean...Z", "fBodyAccJerk.meanFreq...X", "fBodyAccJerk.meanFreq...Y", "fBodyAccJerk.meanFreq...Z", "fBodyGyro.mean...X", "fBodyGyro.mean...Y", "fBodyGyro.mean...Z", "fBodyGyro.meanFreq...X", "fBodyGyro.meanFreq...Y", "fBodyGyro.meanFreq...Z", "fBodyAccMag.mean..", "fBodyAccMag.meanFreq..", "fBodyBodyAccJerkMag.mean..", "fBodyBodyAccJerkMag.meanFreq..","fBodyBodyGyroMag.mean..", "fBodyBodyGyroMag.meanFreq..", "fBodyBodyGyroJerkMag.mean..", "fBodyBodyGyroJerkMag.meanFreq..", "angle.tBodyAccMean.gravity.", "angle.tBodyAccJerkMean..gravityMean.", "angle.tBodyGyroMean.gravityMean.", "angle.tBodyGyroJerkMean.gravityMean.", "angle.X.gravityMean.", "angle.Y.gravityMean.", "angle.Z.gravityMean.", "tBodyAcc.std...X", "tBodyAcc.std...Y", "tBodyAcc.std...Z", "tGravityAcc.std...X", "tGravityAcc.std...Y", "tGravityAcc.std...Z", "tBodyAccJerk.std...X", "tBodyAccJerk.std...Y", "tBodyAccJerk.std...Z", "tBodyGyro.std...X", "tBodyGyro.std...Y", "tBodyGyro.std...Z", "tBodyGyroJerk.std...X", "tBodyGyroJerk.std...Y", "tBodyGyroJerk.std...Z", "tBodyAccMag.std..", "tGravityAccMag.std..", "tBodyAccJerkMag.std..", "tBodyGyroMag.std..", "tBodyGyroJerkMag.std..", "fBodyAcc.std...X", "fBodyAcc.std...Y", "fBodyAcc.std...Z", "fBodyAccJerk.std...X", "fBodyAccJerk.std...Y", "fBodyAccJerk.std...Z", "fBodyGyro.std...X", "fBodyGyro.std...Y", "fBodyGyro.std...Z", "fBodyAccMag.std..", "fBodyBodyAccJerkMag.std..", "fBodyBodyGyroMag.std..", "fBodyBodyGyroJerkMag.std..".