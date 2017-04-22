# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for 
#   each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data 
#   set with the average of each variable for each activity and each subject.

setwd("/Users/joelgraves/coursera/data")

# Load the test and training subject_numbers
subject_test <- read.table("./test/subject_test.txt")
subject_train <- read.table("./train/subject_train.txt")
subject_number <- rbind(subject_test, subject_train)$V1

# Load test and training features
features <- read.csv('features.txt', sep = " ", header = FALSE)$V2
X_test <- read.table("./test/X_test.txt", col.names = features)
X_train <- read.table("./train/X_train.txt", col.names = features)
X <- rbind(X_test, X_train)

# Load the test and training activity labels and the list of 
# descriptive names (activity_labels).
labels <- read.csv('activity_labels.txt', sep = " ", header = FALSE)$V2
y_test <- read.table("./test/y_test.txt")
y_train <- read.table("./train/y_train.txt")
y <- rbind(y_test, y_train)$V1

# Add the label names to the targets
activity_labels <- factor(y,labels=labels)

# Drop unneed variables
rm(subject_test, subject_train, 
   X_test, X_train,
   y_test, y_train)

# Combine the subject, labels, and data together into
# a single dataframe
data <- cbind(subject_number, activity_labels, X)

# Retain only the test subject_number, activity_labels, and
# all columns that are std and mean of each measurement
mean_stdev <- 'subject|activity_labels|std\\.|mean\\.'
data_mean_stdev <- data[, grep(mean_stdev, names(data))]

library(dyplr)
summary <- data_mean_stdev %>%
    group_by(subject_number, activity_labels) %>%
    summarize_each(funs(mean))

dim(summary)
str(summary)
