CodeBook for Getting and Cleaning Data Project
==============================================

Description
-----------

This CodeBook contains information about variables, data and transformations.

Source Data
-----------

A full description of the data used in this project can be found at the UCI Machine Learning Repository:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The source data for this project can be downloaded from:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Variables
---------

Variables used running the script and values obtained for each:

- activities_labels_table     6 obs. of 2 variables
- features_table              561 obs. of 2 variables
- subject_test_table          2947  obs. of 1 variables
- subject_train_table         7352  obs. of 1 variables
- test_table                  2947  obs. of 81 variables
- tidy_mean                   180  obs. of 81 variables (output)
- tidy_table                  10299  obs. of 81 variables (output)
- train_table                 7352  obs. of 81 variables
- X_test_table                2947  obs. of 561 variables
- X_train_table               7352  obs. of 561 variables
- Y_test_table                2947  obs. of 1 variables
- Y_train_table               7352 obs. of 1 variables
- subject_list                30 elements
- activities_list             6 elements
- all_raw_files_path          path for working directory
- columns_name                79 elements: contains the name of variables that contains "main" and "std" in its names.
- columns_number              79 elements: contains position column of variables selected
- i, j, k, row                variables for loops

Steps to get tidy dataset
-------------------------

To run "run_analysis.R" you must unzip the raw data files within a directory named 'project-crd' into your working directory and preserve the same directory structure.

1.- clean up environment variables

2.- set working directory

3.- read activity files and create activity table

4.- read feature files and create feature table. Next select from this table 'main' and 'std' named columns. Get its  names and postion columns

5.- read test.txt files [Subject, X and Y]

6.- read train.txt files [Subject, X and Y]

7.- Create test and train tables binding columns of Subject, Y and X tables and assign names of columns

8.- join test and train tables by subject column creating tidy data table

9.- Uses descriptive activity names to name the activities in the tidy table

10.- Ordering of tidy_table by Subject_ID

11.- Write to file tidy data table as tidy.txt [Output]

12.- Calculate the average of each variable for each activity and each subject and store its values at tidy mean table. At this step, we split tidy table to get subject groups. For each subject group, split again to get activities groups. For each activity group get the average of each variable.

13.-  Write to file tidy_mean table as "tidy_mean.txt"

