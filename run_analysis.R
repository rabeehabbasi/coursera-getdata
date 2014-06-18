## This scripts reads the smart phone data, makes it tidy and
## writes the tidy data output to "data.csv"

## Load feature names
features <- read.table("UCI HAR Dataset/features.txt", colClasses=c("numeric","character"))

## Load activity names
activities <- read.table("UCI HAR Dataset/activity_labels.txt", colClasses=c("numeric","character"))
activities <- activities$V2

## Find the indexes of mean and std variables
idx_mean <- features$V1[grep("mean\\(\\)",features$V2)]
names_mean <- sub("([a-zA-Z]+)\\-mean\\(\\)(-([XYZ]))?","mean_\\1\\3",features$V2[idx_mean])

idx_std <- features$V1[grep("std\\(\\)",features$V2)]
names_std <- sub("([a-zA-Z]+)\\-std\\(\\)(-([XYZ]))?","std_\\1\\3",features$V2[idx_std])

## Load the train and test data
test_data <- read.table("UCI HAR Dataset/test/X_test.txt", colClasses="numeric")
train_data <- read.table("UCI HAR Dataset/train/X_train.txt", colClasses="numeric")

## Load subject data
train_subject <- read.table("UCI HAR Dataset/train/subject_train.txt", colClasses="numeric")
test_subject <- read.table("UCI HAR Dataset/test/subject_test.txt", colClasses="numeric")

## Load activity data
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt", colClasses="numeric")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt", colClasses="numeric")

train_subject <- train_subject$V1
test_subject <- test_subject$V1
train_activity <- train_activity$V1
test_activity <- test_activity$V1

## Combine subjects, activities, and variables
data_train <- cbind(train_subject, activities[train_activity], train_data[,idx_mean], train_data[,idx_std])

## Assign names to variables
names(data_train) <- c("subject", "activity", names_mean, names_std)

## Combine subjects, activities, and variables
data_test <- cbind(test_subject, activities[test_activity], test_data[,idx_mean], test_data[,idx_std])

## Assign names to variables
names(data_test) <- c("subject", "activity", names_mean, names_std)

## Combine train and test data
data <- rbind(data_train,data_test)

## Make tidy data file
write.csv(data,file="data.csv", row.names=F)

## Merge training and test datasets into a single dataset
