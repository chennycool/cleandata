This file describes the variables, the data, and any transformations or work that I have performed to clean up the data.

The site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
The data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The run_analysis.R script performs the following steps to clean the data:

1- Download and unzip file from website above, and setwd to the folder that has unzipped data.

2- Read X_test.txt, y_test.txt and subject_test.txt from the "./test" folder and store them in test_set, test_label and test_subject variables respectively.

3- Read X_train.txt, y_train.txt and subject_train.txt from the "./train" folder and store them in train_set, train_label and train_subject variables respectively.

4- Read features.txt and activity_labels.txt from root folder and store them in feature_name and activity_label respectively.

5- Check all variables above.

6- Merge data from test and train, generate variables merge_set, merge_label and merge_subject respectively.

7- Extract feature name from feature_name and name merge_set. Name merge_label as "Activity_ID" while name merge_subject as "Subject".

8- Merge merge_set, merge_label and merge_subject into variables all_data.

9- Select features names that has mean or std  in MoS_feature, adding "Subject", "Activity_ID" to make another variables sub_col. 

10- Make a subset MoS_data from all_data by sub_col. 

11- Use descriptive activity name from activity_label.

12- check MoS_data.

13- Appropriately labels the data set with descriptive variable names, including remove "()", capital M in "mean", captital S in "std", repalce ^t by "time", replace ^f by "frequency", replace "Acc" by "Accelerometer", replace "Gyro" by "Gyroscope", replace "Mag" by "Magnitude", reomve first Body in "BodyBody" and remove "-".

14- Check modified feature names in MoS_data.

15- Creates a second, independent tidy data set tidy_data with the average of each variable for each activity and each subject. Then sort it by Subject and Activity_ID.

16- Output the tidy_data in to "tidydata.txt" in previous working directory. 

