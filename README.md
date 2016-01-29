# Getting and Cleaning Data Project

This repo contains the files for the final project for the *Getting and Cleaning Data Course*  on Coursera. The purpose of the project is to read the data from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This data set represent data collected from accelerometers from the Samsung Galaxy S smartphone for 30 different subjects in the ages 19 to 48 years. Each of the subjects performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on their waist. The data captured represents 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments were video-recorded and the data was labeled manually. The data set was randomly partitioned into two sets with 21 (70%) of the volunteers selected for the training data and 9 (30%) of the volunteers for test data. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The purpose of the project is to to prepare a tidy data set that can be used for later analysis. This repository contains an R script called **run_analysis.R** that reads the zip file from the link above, unzips the files, reads the following files: activity_labels.txt, features.txt, X_train.txt, Y_train.txt, subject_train.txt, X_test.txt, Y_test.txt, and subject_test.txt that are all contained in the zip file and then does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names. This tidy data set is 

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
The two tidy data sets that are created as part of this project are stored in comma separated (csv) files.  The first tidy data set created in Step 4 is called **activity.csv**. The second tidy data set created in Step 5 with the average of each variable for each activity and each subject is called **meanActivity.csv**. Finally, there is file called **CodeBook.md** that describes the variables, the data, and the transformations performed to clean up the data.
