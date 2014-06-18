Generating Tidy Data
====================

This repo has two main files. CodeBook.md and run_analysis.R

## CodeBook.md
Open this file to read about the variables

## run_analysis.R
Put this file in the folder which contains the "UCI HAR Dataset" folder. Set working directory accordingly using setwd function. Run this script using source("run_analysis.R"). If you get some errors, make sure that you have set the working directory properly and "UCI HAR Dataset" folder with sub folders "train" and "test" is present in your current working directory.

This scripts reads the smart phone data, makes it tidy and writes the tidy data output to "data.csv". 

Following steps are involved in reading raw data and transforming it to tidy data:

1. Load feature names
2. Load activity names
3. Find the indexes of mean and std variables
4. Load the train and test data
5. Load subject data
6. Load activity data
7. Combine subjects, activities, and variables
8. Assign names to variables
9. Combine train and test data
10. Make tidy data file
