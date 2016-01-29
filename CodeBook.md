## Code Book for the Getting and Cleaning Data Project

This code book describes the variables, data, and transformations performed in the file run_analysis.R to clean up the original data.

The data is downloaded from the link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Original data and description of the files and variables can be found at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following steps were taken to clean and transform the original data:

1. Read the zip file from the link above and unzips its contents.

2. Read the file activity_labels.txt. This file contains the six activities performed by the 30 subjects in the study: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING and their numeric label (1 through 6).

3. Read the file features.txt. This file contains the names of 561 different features consisting of time and frequency domain variables. 

4. Extract only the names of the features related to the mean and standard deviation for each measurement/variable. This results in a subset of 79 feature names.

5. Modify the names of the features to appropriate column headers for a data frame by replacing: '-mean' with '.Mean', '-std' with '.Std', removing empty brackets '()' and replacing all '-' in each feature name with '.'. For example: 'tBodyAcc-mean()-X' is replaced with 'tBodyAcc.Mean.X', 'tBodyAcc-std()-Y' is replaced with 'tBodyAcc.Std.Y', and 'tBodyAccMag-mean()' is replaced with 'tBodyAccMag.Mean'.

6. Read the file 'X_train.txt' which contains 7352 different activities and 561 features for each activity for the 21 subjects (70% of the data is used for the training data) and extract only the 79 features related to the mean and standard deviation. Read the file 'Y_train.txt' containing the activity label (1 through 6) for the 7352 activities performed by the 21 training subjects. Read the file 'subject_train.txt' containing  the subject label (number between 1 and 30) for the 7352 activities performed by the 21 training subjects.

7. Combine the three data sets from Step 6 into a single data frame called 'train' (7352 x 81) containing 7352 different activities, the subject label (column 1), the activity label (column 2) and the 79 features related to the mean and standard deviation for each measurement/variable.

8. Perform the same steps for the test data consisting of the files 'X_test.txt', 'Y_test.txt', and 'subject_test.txt' for the 9 test subjects (30% of the data is used for the testing data set) and create a single data frame called 'test' (2947 x 81) containing 2947 different activities, the subject label (column 1), the activity label (column 2) and the 79 features related to the mean and standard deviation for each measurement/variable.

9. Merge the train and testing data set to create a data frame that is 10299 x 81 and replace the column names of the 81 columns with the names: 'Subject', 'Activity', and the 79 names of the features created in Step 5. 

10. Replace the numeric labels for the activity performed by the subjects to the names WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING collected in Step 2 and treat this column in the data frame as a factor variable. 

11. Write this large tidy data set to a csv file called **activity.csv**. The rows in this data set represent 10299 measurements for the 30 subjects and the 6 different activities performed. The first column represents the numeric label for each Subject (1 through 30), the second column represents the activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and the remaining 79 columns represent the features related to the mean and standard deviation for each measurement/variable.

12. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 
We use the reshape package in R and the functions 'melt' and 'dcast' to calculate the mean of each variable. This results
in a data frame consisting of 180 rows and 81 columns where the rows represent the mean of each variable for each of the 30 subjects and the 6 different activities, the first column represents the numeric label for each Subject (1 through 30), the second column represents the activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) and the remaining 79 columns represent the features related to the mean and standard deviation for each measurement/variable. This second tidy 
data set is saved to a csv file called **meanActivity.csv**.
