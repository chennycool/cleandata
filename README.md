This file describes how run_analysis.R script works.

This script works well in Rstudio (Windows version).

If not working in other OS, please try Other_OS.R. 

Under your working directory that has "run_analysis.R", source("run_analysis.R").

The R script will help you download and unzip the data from 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
into folder "cleandata" under your current working directory. 

And will eventually generate a tidy dataset "tidydata.txt" in the same folder.

You can then use read.table("tidydata.txt") to read the file.
