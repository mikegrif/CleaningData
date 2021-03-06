## Getting and Cleaning Data Course Project

### Overview 
This document contains information on how to use the *run_analysis.R* script that implements the requirements for the **Getting and Cleaning Data** course project. The script uses the **dplyr** package which is automatically loaded when you run it.

When you run the script, it will call methods within the script to perform each step specified in the requirments. Please refer to the **Running the Script** section below for more information on the methods called during the script's execution.

### Configuring Your Workspace to Run Script

1. Copy the **run_analysis.R** script to your working directory
2. Create the following directories under your working directory:
   + data
   + data/testing
   + data/training
3. Copy the following files to the **data/training** directory:
   + X_train.txt
   + y_train.txt
   + subject_train.txt
   + features.txt
4. Copy the following files to the **data/testing** directory:
   + X_test.txt
   + y_test.txt
   + subject_test.txt

Note:
You can get the above data files from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


### Running the Script
1. Source the script by entering command: **source("run_analysis.R")**
2. Run the script by entering command: **do_analysis()**
3. The **do_analysis()** method will do the following:
   + calls method **getDataset()** to merge the training and test sets into a single dataset. 
   + This *getDataset()* also assign descriptive names to each column in the combined dataset
   + calls method **getSubDataset()** to create a sub dataset whose column's name has the string "mean()" or "std()"
   + calls method **setActivityNames()** to set descriptive names for each activities
   + calls method **tidy_data()** to create a tidy dataset and save it in file *data/tidy_data.txt*
   
   

