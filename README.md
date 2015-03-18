
## Synopsis

Course project for the Coursera / John Hopkins course 'Getting and Cleaning Data'

## Motivation

The purpose of the project is to transform, clean and summarize data from the
"Human Activity Recognition Using Smartphones" project and to demonstrate
the principles of tidy data.

The main principles of tidy data are described at http://vita.had.co.nz/papers/tidy-data.pdf

In particular, this project operates on the Smartphone data to enforce the following principles

* Multiple variables are stored in one column.
* Variables are stored in both rows and columns.
* Multiple types of observational units are stored in the same table

## Running

* Fetch the human activity smartphone sample data set using the make target:
```
% make get_data
wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
--2015-03-18 16:18:08--  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
Resolving d396qusza40orc.cloudfront.net... 54.192.7.243, 54.230.4.145, 54.230.4.208, ...
Connecting to d396qusza40orc.cloudfront.net|54.192.7.243|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 62556944 (60M) [application/zip]
Saving to: 'getdata%2Fprojectfiles%2FUCI HAR Dataset.zip'
```

* Transform and clean the data using the run_analysis.R script:
```
% make clean_data
./run_analysis.R
Loading required package: dplyr
```

* Examine the resulting tidy dataset
```
% head -2 meansByActivityAndSubject.txt
"subject.id" "activity.type" "tBodyAcc.mean().X" "tBodyAcc.mean().Y" "tBodyAcc.mean().Z" "tBodyAcc.std().X" "tBodyAcc.std().Y" "tBodyAcc.std().Z" "tGravityAcc.mean().X" "tGravityAcc.mean().Y" "tGravityAcc.mean().Z" "tGravityAcc.std().X" "tGravityAcc.std().Y" "tGravityAcc.std().Z" "tBodyAccJerk.mean().X" "tBodyAccJerk.mean().Y" "tBodyAccJerk.mean().Z" "tBodyAccJerk.std().X" "tBodyAccJerk.std().Y" "tBodyAccJerk.std().Z" "tBodyGyro.mean().X" "tBodyGyro.mean().Y" "tBodyGyro.mean().Z" "tBodyGyro.std().X" "tBodyGyro.std().Y" "tBodyGyro.std().Z" "tBodyGyroJerk.mean().X" "tBodyGyroJerk.mean().Y" "tBodyGyroJerk.mean().Z" "tBodyGyroJerk.std().X" "tBodyGyroJerk.std().Y" "tBodyGyroJerk.std().Z" "tBodyAccMag.mean()" "tBodyAccMag.std()" "tGravityAccMag.mean()" "tGravityAccMag.std()" "tBodyAccJerkMag.mean()" "tBodyAccJerkMag.std()" "tBodyGyroMag.mean()" "tBodyGyroMag.std()" "tBodyGyroJerkMag.mean()" "tBodyGyroJerkMag.std()" "fBodyAcc.mean().X" "fBodyAcc.mean().Y" "fBodyAcc.mean().Z" "fBodyAcc.std().X" "fBodyAcc.std().Y" "fBodyAcc.std().Z" "fBodyAcc.meanFreq().X" "fBodyAcc.meanFreq().Y" "fBodyAcc.meanFreq().Z" "fBodyAccJerk.mean().X" "fBodyAccJerk.mean().Y" "fBodyAccJerk.mean().Z" "fBodyAccJerk.std().X" "fBodyAccJerk.std().Y" "fBodyAccJerk.std().Z" "fBodyAccJerk.meanFreq().X" "fBodyAccJerk.meanFreq().Y" "fBodyAccJerk.meanFreq().Z" "fBodyGyro.mean().X" "fBodyGyro.mean().Y" "fBodyGyro.mean().Z" "fBodyGyro.std().X" "fBodyGyro.std().Y" "fBodyGyro.std().Z" "fBodyGyro.meanFreq().X" "fBodyGyro.meanFreq().Y" "fBodyGyro.meanFreq().Z" "fBodyAccMag.mean()" "fBodyAccMag.std()" "fBodyAccMag.meanFreq()" "fBodyBodyAccJerkMag.mean()" "fBodyBodyAccJerkMag.std()" "fBodyBodyAccJerkMag.meanFreq()" "fBodyBodyGyroMag.mean()" "fBodyBodyGyroMag.std()" "fBodyBodyGyroMag.meanFreq()" "fBodyBodyGyroJerkMag.mean()" "fBodyBodyGyroJerkMag.std()" "fBodyBodyGyroJerkMag.meanFreq()"
"1" "1" "LAYING" 0.22159824394 -0.0405139534294 -0.11320355358 -0.9280564692 -0.83682740562 -0.826061401628 -0.24888179828 0.70554977346 0.4458177198 -0.8968300184 -0.90772000676 -0.85236629022 0.0810865342 0.0038382040088 0.010834236361 -0.958482112 -0.9241492736 -0.9548551108 -0.016553093978 -0.064486124088 0.14868943626 -0.87354386782 -0.9510904402 -0.9082846626 -0.107270949192 -0.04151728689 -0.0740501211 -0.9186085208 -0.9679072436 -0.9577901596 -0.8419291525 -0.79514486386 -0.8419291525 -0.79514486386 -0.9543962646 -0.9282456284 -0.874759548 -0.81901016976 -0.96346103 -0.9358409828 -0.9390990524 -0.86706520518 -0.8826668762 -0.9244374346 -0.8336255561 -0.81289155944 -0.158792670508 0.097534841586 0.08943765522 -0.9570738838 -0.9224626098 -0.9480609042 -0.9641607086 -0.9322178704 -0.9605869872 0.132419092398 0.024513618956 0.02438794528 -0.850249174586 -0.9521914948 -0.909302721 -0.8822964508 -0.9512320494 -0.9165825082 -0.003546795856 -0.091529130882 0.01045812566 -0.8617676481 -0.7983009404 0.08640856294 -0.9333003608 -0.9218039756 0.26639115416 -0.8621901854 -0.82431943968 -0.1397750127 -0.9423669466 -0.9326606676 0.17648590708
```
