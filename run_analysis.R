## First go to the proper working directory (setwd())
## Download the file in folder "cleandata"
## It is a .zip file, give a filename as "Dataset" 
## in my Windows OS, method="curl" not working, 
## download.file method should choose "auto" while mode should choose "wb"
if(!file.exists("./cleandata")){dir.create("./cleandata")
                               setwd("./cleandata")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="Dataset.zip",method="auto", mode="wb")
## Unzip the file
unzip("Dataset.zip")
## Now get a folder "UCI HAR Dataset"
setwd("./UCI HAR Dataset")

## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean 
# and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, 
# independent tidy data set with the average of each variable 
# for each activity and each subject.

## Read the readme.txt for details
## Read data from the files
test_set<- read.table("./test/X_test.txt")
test_label<- read.table("./test/Y_test.txt")
train_set<- read.table("./train/X_train.txt")
train_label<- read.table("./train/Y_train.txt")
test_subject<- read.table("./test/subject_test.txt")
train_subject<- read.table("./train/subject_train.txt")
feature_name<- read.table ("features.txt")
activity_label<- read.table ("activity_labels.txt")
## Check these varibles
str(test_set)
str(test_label)
str(train_set)
str(train_label)
str(test_subject)
str(train_subject)
str(feature_name)
str(activity_label)
## Merge train and test sets 
merge_set<- rbind (train_set, test_set)
merge_label<- rbind (train_label, test_label)
merge_subject<- rbind (train_subject, test_subject)
## Name and merge all varibles
names(merge_set)<- feature_name$V2
names(merge_label)<- c("Activity_ID")
names(merge_subject)<- c("Subject")
all_data<- cbind (merge_subject, merge_label, merge_set)
## Select only "mean()" of "std()" in feature names
MoS_feature<- feature_name$V2[grep("mean\\(\\)|std\\(\\)", feature_name$V2)]
## subset data by MoS
sub_col<- c("Subject", "Activity_ID", as.character(MoS_feature))
MoS_data<- subset(all_data, select=sub_col)
## Use descriptive activity name
names(activity_label)<- c("Activity_ID", "Activity")
MoS_data<- merge (MoS_data, activity_label, by="Activity_ID")
str(MoS_data)
## Appropriately labels the data set with descriptive variable names:
## remove ()
names(MoS_data)<- gsub("\\()", "", names(MoS_data))
## Capital M in mean
names(MoS_data)<- gsub("mean", "Mean", names(MoS_data))
## Capital S in std
names(MoS_data)<- gsub("std", "Std", names(MoS_data))
## ^t is replaced by time
names(MoS_data)<- gsub("^t", "time", names(MoS_data))
## ^f is replaced by frequency
names(MoS_data)<- gsub("^f", "frequency", names(MoS_data))
## Acc is replaced by Accelerometer
names(MoS_data)<- gsub("Acc", "Accelerometer", names(MoS_data))
## Gyro is replaced by Gyroscope
names(MoS_data)<- gsub("Gyro", "Gyroscope", names(MoS_data))
## Mag is replaced by Magnitude
names(MoS_data)<- gsub("Mag", "Magnitude", names(MoS_data))
## BodyBody is replaced by Body
names(MoS_data)<- gsub("BodyBody", "Body", names(MoS_data))
## remove -
names(MoS_data)<- gsub("-", "", names(MoS_data))
##check names
names(MoS_data)
## creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject
tidy_data<- aggregate(. ~Subject + Activity, MoS_data, mean)
tidy_data<- tidy_data[order(tidy_data$Subject, tidy_data$Activity_ID), ]
setwd("..")
write.table(tidy_data, file="tidydata.txt", row.name=FALSE)
