# CodeBook for tidy_data.txt

## General approach for coming up with the final tidy data set:

1. Merge the training and test sets to create one data set.
2. Extract mean and standard deviation of each measurement. (get all columns with "[mM]ean" or "[sS]td" in the name).
3. Replace with descriptive names
4. Merge activity and subject information in the merged observation data set
5. Replace activy id with more descriptive activity label
6. Get average (mean) per activity and subject
7. Rename columns (except activity and subject) to include '* Average.' as prefix.
8. Write results to a comma delimited file 'tidy_data.txt'.

## Resulting Data:
* 88 Columns (1 activity, 1 subject, 86 from observation data set)
* 180 rows (check: 6 activities x 30 subjects)
* Comma delimited (for more convenient loading via read.csv)

## Columns

Column 1: activity
* WALKING            
* WALKING_UPSTAIRS   
* WALKING_DOWNSTAIRS
* SITTING
* STANDING           
* LAYING 

Column 2: subject
* Observed Values ranging from 1-30

Columns 3-88:

* Average.tBodyAccmeanX
* Average.tBodyAccmeanY
* Average.tBodyAccmeanZ
* Average.tBodyAccstdX
* Average.tBodyAccstdY
* Average.tBodyAccstdZ
* Average.tGravityAccmeanX
* Average.tGravityAccmeanY
* Average.tGravityAccmeanZ
* Average.tGravityAccstdX
* Average.tGravityAccstdY
* Average.tGravityAccstdZ
* Average.tBodyAccJerkmeanX
* Average.tBodyAccJerkmeanY
* Average.tBodyAccJerkmeanZ
* Average.tBodyAccJerkstdX
* Average.tBodyAccJerkstdY
* Average.tBodyAccJerkstdZ
* Average.tBodyGyromeanX
* Average.tBodyGyromeanY
* Average.tBodyGyromeanZ
* Average.tBodyGyrostdX
* Average.tBodyGyrostdY
* Average.tBodyGyrostdZ
* Average.tBodyGyroJerkmeanX
* Average.tBodyGyroJerkmeanY
* Average.tBodyGyroJerkmeanZ
* Average.tBodyGyroJerkstdX
* Average.tBodyGyroJerkstdY
* Average.tBodyGyroJerkstdZ
* Average.tBodyAccMagmean
* Average.tBodyAccMagstd
* Average.tGravityAccMagmean
* Average.tGravityAccMagstd
* Average.tBodyAccJerkMagmean
* Average.tBodyAccJerkMagstd
* Average.tBodyGyroMagmean
* Average.tBodyGyroMagstd
* Average.tBodyGyroJerkMagmean
* Average.tBodyGyroJerkMagstd
* Average.fBodyAccmeanX
* Average.fBodyAccmeanY
* Average.fBodyAccmeanZ
* Average.fBodyAccstdX
* Average.fBodyAccstdY
* Average.fBodyAccstdZ
* Average.fBodyAccmeanFreqX
* Average.fBodyAccmeanFreqY
* Average.fBodyAccmeanFreqZ
* Average.fBodyAccJerkmeanX
* Average.fBodyAccJerkmeanY
* Average.fBodyAccJerkmeanZ
* Average.fBodyAccJerkstdX
* Average.fBodyAccJerkstdY
* Average.fBodyAccJerkstdZ
* Average.fBodyAccJerkmeanFreqX
* Average.fBodyAccJerkmeanFreqY
* Average.fBodyAccJerkmeanFreqZ
* Average.fBodyGyromeanX
* Average.fBodyGyromeanY
* Average.fBodyGyromeanZ
* Average.fBodyGyrostdX
* Average.fBodyGyrostdY
* Average.fBodyGyrostdZ
* Average.fBodyGyromeanFreqX
* Average.fBodyGyromeanFreqY
* Average.fBodyGyromeanFreqZ
* Average.fBodyAccMagmean
* Average.fBodyAccMagstd
* Average.fBodyAccMagmeanFreq
* Average.fBodyBodyAccJerkMagmean
* Average.fBodyBodyAccJerkMagstd
* Average.fBodyBodyAccJerkMagmeanFreq
* Average.fBodyBodyGyroMagmean
* Average.fBodyBodyGyroMagstd
* Average.fBodyBodyGyroMagmeanFreq
* Average.fBodyBodyGyroJerkMagmean
* Average.fBodyBodyGyroJerkMagstd
* Average.fBodyBodyGyroJerkMagmeanFreq
* Average.angletBodyAccMeangravity
* Average.angletBodyAccJerkMeangravityMean
* Average.angletBodyGyroMeangravityMean
* Average.angletBodyGyroJerkMeangravityMean
* Average.angleXgravityMean
* Average.angleYgravityMean
* Average.angleZgravityMean
