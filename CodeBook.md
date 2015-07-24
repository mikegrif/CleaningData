## Overview
This document contains information from an experiment conducted on 30 subjects whose age ranges from 19 - 48 years. Each subject was measured performing the activities below while wearing a Samsung Galaxy S II on the waist.
1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing
6. Laying

Using the embedded accelerometer and gyroscope in the phone, the 3-axial linear acceleration and 3-axial angular velocity were captured at a sampling rate of 50 Hz. The variables representing these measurements have a prefix of *'t'* to dentote time. After capturing the sensor signals (accelerometer and gyroscope), they were filtered using a median filter and a 3rd order low-pass Butterworth filter to remove noise. 

 The sensor acceleration signal was separated into two components below via another Butterworh low-pass filter:
- gravitational force
- body acceleration
 
The next step was to derive the *jerk* signal measurements from the body linear acceleration and angular velocty. The magnitude of the 3-dimensional signals were calculated using Euclidean norm. Finally a Fast Fourier Transform (FFT) was applied to some of the signals. These measurements have a prefix of *'f'* to denote frequency.

## Data Transformation
The original data had 563 variables and 10,299 observations. To transform the data, I did the following:
- Extracted only variables with the word *mean()* or *std()* in its name
- This reduced the dataset to 81 variables, since I retained variables with *subject* and *activity* information
- Next I replaced the numeric activity values with more descriptive names such as walking, standing, etc.
- Then I used the *group_by* method in the *dplyr* package to create a grouping based on subject and activity
- Next I used the *summarise_each* method in the *dplyr* package to find the mean of each column based on my grouping
- Finally I used the *write.table* method to store my *tidy* data to a file
 
## Variable Description
- subject
  + integer identifier for each subject
  + values varies from 1 to 30
  
- activity
 + descriptive activity performed by each subject
 + values: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS or WALKING_UPSTAIRS

- tBodyAcc-mean()-X
- tBodyAcc-mean()-Y
- tBodyAcc-mean()-Z
- tGravityAcc-mean()-X
- tGravityAcc-mean()-Y
- tGravityAcc-mean()-Z
- tBodyAccJerk-mean()-X
- tBodyAccJerk-mean()-Y
- tBodyAccJerk-mean()-Z
- tBodyGyro-mean()-X
- tBodyGyro-mean()-Y
- tBodyGyro-mean()-Z
- tBodyGyroJerk-mean()-X
- tBodyGyroJerk-mean()-Y
- tBodyGyroJerk-mean()-Z
- tBodyAccMag-mean()
- tGravityAccMag-mean()
- tBodyAccJerkMag-mean()
- tBodyGyroMag-mean()
- tBodyGyroJerkMag-mean()
- fBodyAcc-mean()-X
- fBodyAcc-mean()-Y
- fBodyAcc-mean()-Z
- fBodyAcc-meanFreq()-X
- fBodyAcc-meanFreq()-Y
- fBodyAcc-meanFreq()-Z
- fBodyAccJerk-mean()-X
- fBodyAccJerk-mean()-Y
- fBodyAccJerk-mean()-Z
- fBodyAccJerk-meanFreq()-X
- fBodyAccJerk-meanFreq()-Y
- fBodyAccJerk-meanFreq()-Z
- fBodyGyro-mean()-X
- fBodyGyro-mean()-Y
- fBodyGyro-mean()-Z
- fBodyGyro-meanFreq()-X
- fBodyGyro-meanFreq()-Y
- fBodyGyro-meanFreq()-Z
- fBodyAccMag-mean()
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-meanFreq()
- tBodyAcc-std()-X
- tBodyAcc-std()-Y
- tBodyAcc-std()-Z
- tGravityAcc-std()-X
- tGravityAcc-std()-Y
- tGravityAcc-std()-Z
- tBodyAccJerk-std()-X
- tBodyAccJerk-std()-Y
- tBodyAccJerk-std()-Z
- tBodyGyro-std()-X
- tBodyGyro-std()-Y
- tBodyGyro-std()-Z
- tBodyGyroJerk-std()-X
- tBodyGyroJerk-std()-Y
- tBodyGyroJerk-std()-Z
- tBodyAccMag-std()
- tGravityAccMag-std()
- tBodyAccJerkMag-std()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-std()
- fBodyAcc-std()-X
- fBodyAcc-std()-Y
- fBodyAcc-std()-Z
- fBodyAccJerk-std()-X
- fBodyAccJerk-std()-Y
- fBodyAccJerk-std()-Z
- fBodyGyro-std()-X
- fBodyGyro-std()-Y
- fBodyGyro-std()-Z
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-std()
