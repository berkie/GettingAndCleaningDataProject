# Getting and Cleaning Data Project
This repo contains the files for the final project for the *Getting and Cleaning Data Course*  on Coursera.

The purpose of the project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data for the the project can be found here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repository contains an R script called **run_analysis.R** that does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
The two tidy data sets that are created as part of this project are stored in comma separated (csv) files.  The first tidy data set created in Step 4 is called **activity.csv**. The second tidy data set created in Step 5 with the average of each variable for each activity and each subject is called **meanActivity.csv**. Finally, there is file called **CodeBook.md** that describes the variables, the data, and the transformations performed to clean up the data.
