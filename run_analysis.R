# Download and unzip the dataset
if (!file.exists("dataset.zip")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
    download.file(fileURL, "dataset.zip",mode="wb")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip("dataset.zip") 
}

require(reshape2)

# Load activity labels and features
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# Extract only the data on mean and standard deviation
extractFeatures <- grep(".*mean.*|.*std.*", features[,2])
names <- features[extractFeatures,2]
names <- gsub('-mean', '.Mean', names)
names <- gsub('-std', '.Std', names)
names <- gsub('[()]', '', names)
names <- gsub('-', '.', names)

# Load the training dataset
trainData <- read.table("UCI HAR Dataset/train/X_train.txt")
trainData <- trainData[,extractFeatures]
trainActivities <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainSubjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(trainSubjects, trainActivities, trainData)

# Load the testing dataset
testData <- read.table("UCI HAR Dataset/test/X_test.txt")
testData <- testData[,extractFeatures]
testActivities <- read.table("UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(testSubjects, testActivities, testData)

# Merge the train and test datasets and add labels
combinedData <- rbind(train, test)
colnames(combinedData) <- c("Subject", "Activity", names)

# Convert activities to factors
combinedData$Activity <- factor(combinedData$Activity, levels = activityLabels[,1], labels = activityLabels[,2])
write.csv(combinedData, "activity.csv", row.names = FALSE, quote = FALSE)

tmp_data <- melt(combinedData, id = c("Subject", "Activity"))
activityData <- dcast(tmp_data, Subject + Activity ~ variable, mean)

write.csv(activityData, "meanActivity.csv", row.names = FALSE, quote = FALSE)
