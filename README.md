Getting and Cleaning Data Project
=================================

Repository for submission the course project of Getting and Cleaning DataCourse at Johns Hopkins Bloomberg School of Public Health (Coursera)

Overview
--------

The purpose of this project is to demonstrate how to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

About the raw data
------------------

One of the most exciting areas in all of data science right now is wearable computing. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data for this project represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

Instruccions to run the script
------------------------------

The script "run_analysis.R" does the following:

- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Uses descriptive activity names to name the activities in the data set
- Appropriately labels the data set with descriptive variable names. 
- Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 
To run the script, you must do:

- Download and unzip the raw data files within a directory named 'project-crd' into your working directory and preserve the same directoy structure. "/UCI HAR Dataset" sub-directory will be created.
- Script "run_analysis.R" setup your working directory to this path.
- Download at "/UCI HAR Dataset" sub-directory created, the "run_analysis.R" script.
- Run the R script from R Studio. This script does the following:
 -   Clean up environment variables
 -   Set your working directory
 -   read activity files and create activity table
-   read and select 'main' and 'std' columns from "features.txt" file. Get number and names of columns.
-   read "test.txt" files
-   read "train.txt" files
-   Create test and train tables binding columns of Subject, Y and X tables and assign names of columns
-   Merge test and train tables by subject column
-   Assign descriptive activity names to name of the activities in the tidy table
-   Write to file tidy data table as tidy.txt
-   Calculate the average of each variable for each activity and each subject
-   Write to file tidy_mean table as "tidy_mean.txt"




