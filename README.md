# Getting-and-Cleaning-Data
Human Activity Recognition Using Smartphones Data Set

### Goals of Assignment
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### Data Processing Steps
- Load the test and training subject_numbers
- Load test and training features
- Load the test and training activity labels and the list of descriptive names (activity_labels).
- Add the label names to the targets
- Drop unneed variables
- Combine the subject, labels, and data together into a single dataframe
- Retain only the test subject_number, activity_labels, and all columns that are std and mean of each measurement
- Use dyplr package to group_by the subject and activity label, then summarize

##### Source of data
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##### Topic of Exercise
http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/
