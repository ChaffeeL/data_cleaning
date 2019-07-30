# data_cleaning
Repo for the Getting and Cleaning Data coursera course project

This repo contains a script for analyzing the data from the following publication:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

Sourcing this script in a working directory containing the UCI HAR dataset folder will create two tidy datasets in your working directory, as well as saving the second of these in a local file as UCI_HAR_datameans.txt.

The first dataset is structured as follows: Each row is an observation of an activity. The first two columns record the participant number (1-30), and the activity being performed (laying, sitting, standing, walking, walking downstairs, and walking upstairs). The remaining sixty six columns contain the means and standard deviations of various readings taken by the wearable device. Note that each participant performs each action multiple times.

The second dataset's columns are structured identically to the first. Here however, each row records the mean reading of all times the participant performed the specified activity. As such, each participant and activity only appear together once, for a total of 180 rows.

Note that all data has been normalized to take values in the interval [-1,1]
