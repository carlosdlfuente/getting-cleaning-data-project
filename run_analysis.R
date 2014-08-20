## clean up environment variables
rm(list=ls())

## unzip the raw data files within a directory named 'project-crd' into your working directory and preserve the same directoy structure
all_raw_files_path <- file.path(getwd(), "project-crd/UCI HAR Dataset")
## set working directory
setwd(all_raw_files_path)

## read activity files and create activity table
activity_labels_table <- read.table("activity_labels.txt", header = FALSE)

## read and select 'main' and 'std' columns. Numbers and names of columns
features_table <- read.table("features.txt", header = FALSE)
columns_number <- grep("mean|std", features_table[, 2])
columns_name <- grep("mean|std", features_table[, 2], value =TRUE)

## read test.txt files
subject_test_table <- read.table("./test/subject_test.txt", header = FALSE)
X_test_table <- read.table("./test/X_test.txt", header = FALSE)
Y_test_table <- read.table("./test/Y_test.txt", header = FALSE)

## read train.txt files
subject_train_table <- read.table("./train/subject_train.txt", header = FALSE)
X_train_table <- read.table("./train/X_train.txt", header = FALSE)
Y_train_table <- read.table("./train/Y_train.txt", header = FALSE)

## Create test and train tables binding columns of Subject, Y and X tables and assign names of columns
test_table <- cbind(subject_test_table, Y_test_table, X_test_table[c(columns_number)])
colnames(test_table) <- c("Subject_ID", "Activity", columns_name)
train_table <- cbind(subject_train_table, Y_train_table, X_train_table[c(columns_number)])
colnames(train_table) <- c("Subject_ID", "Activity", columns_name)

## join test and train tables by subject column
tidy_table <- rbind(test_table, train_table)

## Uses descriptive activity names to name the activities in the tidy table
tidy_table[,2] <- as.character(activity_labels_table[tidy_table[,2],2])

## Order tidy_table by Subject_ID
tidy_table[order(tidy_table$Subject_ID),]

## Write to file tidy data table as tidy.txt
write.table(tidy_table, "tidy.txt", sep = ",", row.name = FALSE, quote = FALSE)

## Calculate the average of each variable for each activity and each subject
subject_list <- split(tidy_table, tidy_table$Subject_ID)
tidy_mean <- data.frame()
row <- 1
for (i in 1:length(subject_list)) {
        activities_list <- split(subject_list[[i]], subject_list[[i]]$Activity)
        for (j in 1: length(activities_list)) {
                tidy_mean[row, 1] <- activities_list[[j]]$Subject_ID[[1]]
                tidy_mean[row, 2] <- activities_list[[j]]$Activity[[1]]

                for (k in 3: ncol(activities_list[[j]])) {
                        tidy_mean[row, k] <- mean(activities_list[[j]][[k]])
                }
                row <- row + 1
        }
}
colnames(tidy_mean) <- c("Subject_ID", "Activity", columns_name)

## Write to file tidy_mean table as "tidy_mean.txt"
write.table(tidy_mean, "tidy_mean.txt", sep = ",", row.name = FALSE, quote = FALSE)