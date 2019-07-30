library(dplyr)

#  Begin by reading in the names of the activities and the measurement names (features)

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("num","activities"))
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("num","formulas"))

#  Read in the test and train datasets using the formula names from features
#  to name the columns. Also read in the subject and acivity codes.

X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features[,2])
activities_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features[,2])
activities_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")

#  Create an index vector for all functions in features which contain "mean()" or "std()"
#  then creates a data set with the subject number, activity, and relevant readings in
#  one combined data set. Note that this will NOT include mean frequencies, as those are
#  significantly different from the mean of the readings, and therefore are not what was
#  asked for.

meanstd <- grep("mean\\(\\)|std\\(\\)", features$formulas)
test_set <- cbind(subject_test, activity=activity_labels$activities[activities_test[,1]], X_test[,meanstd])
train_set <- cbind(subject_train, activity=activity_labels$activities[activities_train[,1]], X_train[,meanstd])
X_data <- arrange(rbind(test_set, train_set), subject, activity)

#  Cleans up the workspace, removing all created variables except the tidied data

rm(activities_test, activities_train, activity_labels, features, meanstd, subject_test, subject_train, test_set, train_set, X_test, X_train)

#  Create a new dataset with averages for every subject and activity

X_data <- group_by(X_data, subject, activity)
data_means <- summarize_all(X_data, ~mean(.))

#  Saves the new dataset as UCI_HAR_datameans.txt to the working directory

write.table(data_means, file="UCI_HAR_datameans.txt")