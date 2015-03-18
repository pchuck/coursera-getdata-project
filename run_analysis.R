#! /usr/bin/env Rscript
##
## coursera, Getting and Cleaning Data, getdata-012
## course project - Patrick Charles
##
if(!require(dplyr)){
    install.packages("dplyr")
    library(dplyr)
}

## An R script that does the following:
##  * Merges the training and the test sets to create one data set.
##  * Extracts only the measurements on the mean and standard deviation for each measurement.
##  * Uses descriptive activity names to name the activities in the data set
##  * Appropriately labels the data set with descriptive variable names.
##  * From the data set in step 4, creates a second, independent tidy data set
##      with the average of each variable for each activity and each subject.

## key principles
##  - one variable of measurement per column
##  - one observation per row

## transform and clean human activity recognition dataset
##
## this function accepts five dataframes
##   activities - a cross-reference between activity ids and names
##   features - the elements of the fine-grain features being measured
##   dataSet - the feature data set
##   activitySet - the activity type data set
##   subjectSet - the subject id data set
readAndCleanActivityData <- function(activities, features, dataSet, activitySet, subjectSet) {
    ## clean up the feature type column labels
    features$V2 <- gsub("-", ".", features$V2) # replace -'s with .'s

    ## (4) label the data set with descriptive variable names. 
    colnames(dataSet) <- features$V2

    ## (2) extract only the measurements on the mean and standard deviation
    cleanSet <- dataSet[, grep("mean|std", names(dataSet))]

    ## organize data w/ one variable per column, one observation per row..

    ## (3) Use descriptive activity names to name the activities in the data set
    cleanSet$activity.type <- activities[activitySet$V1, ]$V2
    ## ..add the subject id as an additional column
    cleanSet$subject.id <- as.factor(subjectSet$V1)

    # return the transformed and cleaned data frame
    cleanSet
}

## read the reference data: activity type xref and feature types
activities <- read.csv("UCI HAR Dataset/activity_labels.txt", sep=" ", header=F)
features <- read.csv("UCI HAR Dataset/features.txt", sep=" ", header=F)

## read and clean the test data set - activities, types and subject ids
test.dataSet <- read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=F)
test.activitySet <- read.csv("UCI HAR Dataset/test/y_test.txt", header=F)
test.subjectSet <- read.csv("UCI HAR Dataset/test/subject_test.txt", header=F)
test.cleanSet = readAndCleanActivityData(activities, features,
    test.dataSet, test.activitySet, test.subjectSet)

## read and clean the training data set - activities, types and subject ids
train.dataSet <- read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=F)
train.activitySet <- read.csv("UCI HAR Dataset/train/y_train.txt", header=F)
train.subjectSet <- read.csv("UCI HAR Dataset/train/subject_train.txt", header=F)
train.cleanSet = readAndCleanActivityData(activities, features,
    train.dataSet, train.activitySet, train.subjectSet)

## merge the test and training clean data sets
merged.cleanSet = rbind(train.cleanSet, test.cleanSet)

## (5) create an independent tidy data set with the average of each variable for each activity and each subject
tidySet.meansByActivityAndSubject <- # using a dplyr pipeline
    tbl_df(merged.cleanSet) %>%  # convert to tbl_df
        group_by(subject.id, activity.type) %>% # group by subject and activity
            summarise_each(funs(mean)) # calculate the averages

## write the new tidy data set to disk
write.table(tidySet.meansByActivityAndSubject, file="meansByActivityAndSubject.txt")
