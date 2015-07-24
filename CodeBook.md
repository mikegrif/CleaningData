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
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-mean()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-mean()-X  
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-mean()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-mean()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccMag-mean()
- tGravityAccMag-mean()
- tBodyAccJerkMag-mean()
- tBodyGyroMag-mean()
- tBodyGyroJerkMag-mean()
- fBodyAcc-mean()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-meanFreq()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-meanFreq()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-meanFreq()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-mean()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-meanFreq()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-meanFreq()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-meanFreq()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-mean()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-mean()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-mean()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-meanFreq()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-meanFreq()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-meanFreq()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccMag-mean()
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-meanFreq()
- tBodyAcc-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccMag-std()
- tGravityAccMag-std()
- tBodyAccJerkMag-std()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-std()
- fBodyAcc-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-std()-X
 + x component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-std()-Y
 + y component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-std()-Z
 + z component of body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-std()
