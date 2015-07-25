require(dplyr)


#*********************************************************************
"
This script implements the programming project for Coursera course
Getting and Cleaning Data. This script does the following:
    a. merges the training and test sets into on data set
    b. extracts the mean and standard deviation for each measurement
    c. uses descriptive activity names to name activities in each data set
    d. labels data set with descriptive variable names
    e. creates an independent tidy data set with the average of
       each variable for each activity and each subject
"
#*********************************************************************
maxRows <- 10299
maxCols <- 561

#**************************************************************************
# top-level function that performs each step for project.
#**************************************************************************
do_analysis <- function() {
    # step 1: merge training and test sets into one dataset
    df <- getDataset()
    
    # step 2: extract mean and standard deviation for each measurement
    df2 <- getSubDataset(df)
    
    # step 3: use descriptive names for activities
    df2 <- setActivityNames(df2)
    
    
    # step 4: use descriptive names for variables
    # NOTE: this step is performed when data was built in step 1
    
    # step 5: create tidy dataset with average of each variable
    #         for each activity per subject
    tidy_data(df2)
}

#*******************************************************************
# creates a tidy dataset and save it to a file
#*******************************************************************
tidy_data <- function(df) {
    data <- tbl_df(df)
    data <- group_by(data, subject, activity)
    fdata <- summarise_each(data,funs(mean)) 
        
    #  save data to a file
    write.table(fdata, "data/tidy-data.txt",row.names=FALSE)
}

#*********************************************************************
"
This function does the following:
    1. extracts columns from a dataset if column name contains 'mean()'
    2. extracts columns from a dataset if column name contains 'std()'
    3. returns a dataset containing the extracted data
"
#*********************************************************************
getSubDataset <- function(df) {
    cols <- colnames(df)
    size <- length(cols)
    meanIdx <- grep("mean()", cols)
    stdIdx <- grep("std()", cols)
    result <- subset(df, select=c(meanIdx,stdIdx,(size-1),size))
    
    print(paste0("Dimension of sub dataset: ",dim(result)))
    return(result)
}

#*********************************************************************
"
This function does the following:
    1. read data files containing training data set
    2. read data files containing testing data set
    3. combines both data from both files into a single date set
    4. returns combined dataset as a dataframe
"
#*********************************************************************
getDataset <- function() {
    trainingDataFile = "data/training/X_train.txt"
    testingDataFile = "data/testing/X_test.txt"
    trainingLabelFile = "data/training/y_train.txt"
    testingLabelFile = "data/testing/y_test.txt"
    trainingSubjFile = "data/training/subject_train.txt"
    testingSubjFile = "data/testing/subject_test.txt"
    
    # combine data from input files into a single dataset
    labels <- getColData(trainingLabelFile, testingLabelFile)
    subjects <- getColData(trainingSubjFile, testingSubjFile)
    data <- getData(trainingDataFile, testingDataFile)
    df <- data.frame(data, labels, subjects)
    
    # assign column names to each column    
    names <- scan("data/training/features.txt", what=character())
    names <- names[seq(from=2,to=length(names),by=2)]
    names <- c(names,"activity","subject")
    colnames(df) <- names
    
    print("Successfully built data set")
    print(paste0("Dimension of dataset: ",dim(df)))
    return(df)
}

#*********************************************************************
# This function does the following:
#   1. reads data from 2 files where each file has a single column
#   2. returns combined data from both files as a vector
#*********************************************************************
getColData <- function(trainFile, testFile) {    
    label1 <- scan(trainFile)
    label2 <- scan(testFile)
    labels <- c(label1, label2)
    return(labels)
}

#*********************************************************************
# Reads data from training and test data files and return it as a matrix
#*********************************************************************
getData <- function(trainFile, testFile) {    
    k <- 1
    files <- c(trainFile, testFile)
    data <- matrix(nrow=maxRows, ncol=maxCols)
    
    for (dataFile in files) {
        fhand <- file(dataFile)
        open(fhand)
            
        while (length(line <- readLines(fhand, n=1)) > 0) {
            if (k %% 1000 == 0) {
                print(paste0("Processing record: ",k))
            }
            line <- as.numeric(unlist(strsplit(line, split=" ")))
            line <- na.omit(line)
            data[k,] <- line
            k <- k+1
        }    
        close(fhand)   
    }
        
    print(paste0("Number of records in processed: ", (k-1)))    
    return(data)
}


#*********************************************************************************
"
This function does the following:
    1. reads file with list of descriptiive names for activites
    2. replaces numeric values with descriptive values for activities in dataframe
    3. returns the dataframe with updated activity names
"
#*********************************************************************************
setActivityNames <- function(df) {
    activities <- scan("data/training/activity_labels.txt",what=character())
    activities <- activities[seq(from=2,to=length(activities),by=2)]
    
    act_col <- as.character(df$activity)
    for (k in 1:length(activities)) {       
        act_col <- gsub(as.character(k), activities[k], act_col)
    }
    
    df$activity <- act_col
    return(df)
}

