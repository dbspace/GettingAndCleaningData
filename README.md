Coursera Getting And Cleaning Data Project
==========================================

High level Steps to reproduce this project
------------------------------------------
1. Download the source data from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the data into the working directory under folder "UCIHARDataset"
3. Excute the run_analysis.R R script

Detail Steps perform
--------------------
1.  Read the train data
2.  Read the test data
3.  Merges the training and the test data set in one
4.  Read features
5.  Read Label
6.  Name the columns of combineData
7.  Extracts only the measurements on mean and std
8.  Factor meanStdData with loaded Labels
9.  Use appropriately labels with descriptive name
10. Create the tidy data
11. Write out the data to tidyData.txt
 
