
## Overview
This codebook describes the data, variables, and transformation performed to create a tidy data set and summary from raw data from the "Human Activity Recognition Using Smartphones Dataset" samples.

## Variables

The variables used in the raw human activity data set are enumerated in several refernce files:

* 'features_info.txt' - Shows information about the variables used on the feature vector.
* 'features.txt' - List of all features.
* 'activity_labels.txt' -  Links the class labels with their activity name.

## Data

The raw source data is spread across several files:

* 'train/X_train.txt' - Training set.
* 'train/y_train.txt' - Training labels.
* 'train/subject_train.txt' - Identities of the training subjects
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'train/subject_test.txt' - Identities of the test subjects

The raw data set can be obtained from the source using the following make target:
```
% make get_data
```

## Transformation
Following the principles of tidy data, the following transformations are applied on the data:

* The training and test data sets are merged
* Descriptive names are associated with the activities in the data set
* Labels are applied with associated variable names
* Subject ids are associated with corresponding feature data
* A new tidy data set is produced and the key features summarized

## Output

Running the script run_analysis.R produces the tidy data set meansByActivityAndSubject.txt.

The script can be run using the following make target:
```
% make clean_data
```
