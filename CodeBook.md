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
 + x component of the average body linear acceleration measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-mean()-Y
 + y component of the average body linear acceleration measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-mean()-Z
 + z component of the average body linear acceleration measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-mean()-X
 + x component of the average body gravitational acceleration measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-mean()-Y
 + y component of the average body gravitational acceleration measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-mean()-Z
 + z component of the average body gravitational acceleration measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-mean()-X  
 + x component of the average body acceleration jerk measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-mean()-Y
 + y component of the average body acceleration jerk measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-mean()-Z
 + z component of the average body acceleration jerk measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-mean()-X
 + x component of the average body gyroscope measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-mean()-Y
 + y component of the average body gyroscope measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-mean()-Z
 + z component of the average body gyroscope measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-mean()-X
 + x component of the average body gyroscope jerk measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-mean()-Y
 + y component of the average body gyroscope jerk measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-mean()-Z
 + z component of the average body gyroscope jerk measurement in time domain
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccMag-mean()
 + average magnitude of 3-dimension body acceleration using the Euclidean norm
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAccMag-mean()
 + average magnitude of 3-dimension gravitational acceleration using the Euclidean norm
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerkMag-mean()
 + average magnitude of 3-dimension body acceleration jerk using the Euclidean norm
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroMag-mean()
 + average magnitude of 3-dimension body gyroscope measurement using the Euclidean norm
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerkMag-mean()
 + average magnitude of 3-dimension body gyroscope jerk measurement using the Euclidean norm
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-mean()-X
 + x component of the average body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-mean()-Y
 + y component of the average body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-mean()-Z
 + z component of the average body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-meanFreq()-X
 + x component of the average frequency for the body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-meanFreq()-Y
 + y component of the average frequency for the body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-meanFreq()-Z
 + z component of the average frequency for the body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-mean()-X
 + x component of the average body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-mean()-Y
 + y component of the average body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-mean()-Z
 + z component of the average body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-meanFreq()-X
 + x component of the average frequency of body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-meanFreq()-Y
 + y component of the average frequency of body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-meanFreq()-Z
 + z component of the average frequency of body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-mean()-X
 + x component of the average body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-mean()-Y
 + y component of the average body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-mean()-Z
 + z component of the average body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-meanFreq()-X
 + x component of the average frequency of body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-meanFreq()-Y
 + y component of the average frequency of body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-meanFreq()-Z
 + z component of the average frequency of body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccMag-mean()
 + average magnitude of body acceleration using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccMag-meanFreq()
 + average frequency magnitude of body acceleration using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyBodyAccJerkMag-mean()
 + average magnitude of body acceleration jerk using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyBodyAccJerkMag-meanFreq()
 + average frequency magnitude of body acceleration jerk using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyBodyGyroMag-mean()
 + average magnitude of body acceleration using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyBodyGyroMag-meanFreq()
 + average frequency magnitude of body gyroscope measurement using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyBodyGyroJerkMag-mean()
 + average magnitude of body gyroscope measurement using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyBodyGyroJerkMag-meanFreq()
 + average frequency magnitude of body gyroscope measurement using the Euclidean norm after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-std()-X
 + x component of standard deviation for body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-std()-Y
 + y component of standard deviation for  body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAcc-std()-Z
 + z component of standard deviation for  body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-std()-X
 + x component of standard deviation for body gravitional acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-std()-Y
 + y component of standard deviation for body gravational acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tGravityAcc-std()-Z
 + z component of standard deviation for body gravitational acceleration measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-std()-X
 + x component of standard deviation for body acceleration jerk measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-std()-Y
 + y component of standard deviation for body acceleration jerk measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccJerk-std()-Z
 + z component of standard deviation for body acceleration jerk measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-std()-X
 + x component of standard deviation for body gyroscope measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-std()-Y
 + y component of standard deviation for body gyroscope measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyro-std()-Z
 + z component of standard deviation for body gyroscope measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-std()-X
 + x component of standard deviation for body gyroscope jerk measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-std()-Y
 + y component of standard deviation for body gyroscope jerk measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyGyroJerk-std()-Z
 + z component of standard deviation for body gyroscope measurement
 + numeric values in the range -1.0 ... 1.0
 
- tBodyAccMag-std()
 + magnitude of standard deviation for body acceleration measurement
 + numeric values in the range -1.0 ... 1.0
  
- tGravityAccMag-std()
 + magnitude of standard deviation for body gravitational acceleration measurement
 + numeric values in the range -1.0 ... 1.0
  
- tBodyAccJerkMag-std()
 + magnitude of standard deviation for body acceleration jerk measurement
 + numeric values in the range -1.0 ... 1.0
  
- tBodyGyroMag-std()
 + magnitude of standard deviation for body gyroscope measurement
 + numeric values in the range -1.0 ... 1.0
  
- tBodyGyroJerkMag-std()
 + magnitude of standard deviation for body gyroscope jerk measurement
 + numeric values in the range -1.0 ... 1.0
  
- fBodyAcc-std()-X
 + x component of standard deviation for body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-std()-Y
 + y component of standard deviation for body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAcc-std()-Z
 + z component of standard deviation for body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-std()-X
 + x component of standard deviation for body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-std()-Y
 + y component of standard deviation for body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccJerk-std()-Z
 + z component of standard deviation for body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-std()-X
 + x component of standard deviation for body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-std()-Y
 + y component of standard deviation for body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyGyro-std()-Z
 + z component of standard deviation for body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
 
- fBodyAccMag-std()
 + magnitude of standard deviation for body acceleration measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
  
- fBodyBodyAccJerkMag-std()
 + magnitude of standard deviation for body acceleration jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
  
- fBodyBodyGyroMag-std()
 + magnitude of standard deviation for body gyroscope measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
  
- fBodyBodyGyroJerkMag-std()
 + magnitude of standard deviation for body gyroscope jerk measurement after applying fast fourier transform
 + numeric values in the range -1.0 ... 1.0
  
