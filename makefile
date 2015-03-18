# coursera, Getting and Cleaning Data, getdata-012
#

# resources
#   README.md - documentation
#   CodeBook.md - descriptions of the variables, data and transformations
#   run_analysis.R - data transformation script

# download data set
get_data:
	wget https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
	mv "getdata%2Fprojectfiles%2FUCI HAR Dataset.zip" getdata-projectfiles-UCI\ HAR\ Dataset.zip
	unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip

# invoke the data cleaning process
clean_data:
	./run_analysis.R


# README.txt - docs
# data files
#   X_
#   y_
#   subject_test - subject identifiers
# activity_labels.txt
#   1 WALKING
#   2 WALKING_UPSTAIRS
#   3 WALKING_DOWNSTAIRS
#   4 SITTING
#   5 STANDING
#   6 LAYING
# features - 561 variables
# features_info - description of the process

