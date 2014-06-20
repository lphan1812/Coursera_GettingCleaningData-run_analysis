GettingCleaningData-run_analysis
================================

<h3>README.md for Coursera Getting and Cleaning Data Course Project: run_analysis() for the UCI Samsung Dataset</h3>

<br />

<h4>Table of Contents</h4>
[What is it?](#What)<br />
[Documentation](#Doc)<br />
[Data Used in run_analysis()](#Data)
[Other Information](#Other)<br />
<br /><br />


<a name="What"/>
<h4>What is it?</h4>
====================
The run\_analysis.R code contains a function written for the Coursera *Getting and Cleaning Data* Course as part of the Data Science Specialization series. This is the Codebook.md for this package to explain the data, columns, and use. **The goal of run\_analysis.R is to create a function to clean and tidy this data and give a summary of certain variables for each activity each subject performed.**

As a brief overview, run\_analysis.R contains a defined function that can be sourced into R. Once sourced, the function run\_analysis() can be called. The function will use data downloaded from the University of California Irvine Machine Learning Repository, containing human activity recognition data collected by smartphones. run\_analysis() will analyze the dataset and produce a short summary in the form of a tidy dataset.
<br /> <br /><br />



<a name="Doc"/>
<h4>Documentation</h4>
======================

The data used and available in the GettingCleaningData-run_analysis repository were taken from the publicly available dataset provided by the University of California Irvine Machine Learning Repository, as the ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This data was sourced from the following study:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 
Data was made available on Dec 10 2012.
Data was downloaded for the construction of run_analysis.R on June 11 2014.


The data was gathered from 30 volunteers (ages 19-48) who performed a variety of activities while a smartphone was attached at the waist. The data were recorded by the phone (a Samsung Galaxy SII) during six different activities: walking, walking upstairs, walking downstairs, sitting, standing, and laying. The phone's accelerometer and gyroscope recorded a variety of 3-dimensional measurements of velocity, acceleration, and angle.

The raw time-series data from the smartphone was pre-processed by applying noise filters to smooth the data. A vector of features were recorded from the time and frequency domains of the data, giving a 561-feature vector of time and frequency variables. Data is also included to identify each individual participant and what activity was performed. The entire set of data gives 10299 observations of 561 variables. The goal of run_analysis.R is to create a function to clean and tidy this data and give a summary of certain variables for each activity each subject performed.

The data files are listed here with a brief explanation of what they are. In the primary working folder directory, the following items are necessary, with the test and train subdirectories:

- **activity_labels.txt**: This file gives the dictionary code for which the activities (walking, standing, sitting, etc.) performed by the subjects are labeled in the data files.
- **features.txt**: Included in this file are the column names for the X_*.txt files with the real numerical information gathered by the smartphone device
- **features\_info.txt**: This file gives an explanation of the column naming convention given in the column names of features.txt
- **run\_analysis.R**: The R function run\_analysis() to analyze the data is defined in this .R file
- **test/**: This is a folder containing the "test" data (from 30% of the participants)
- **train/**: This is a folder containing the "train" data (from the other 70% of the participants)

The folders test/ and train/ should contain the following items:

- **X\_test.txt**: Contains the rows of observations for a 561-feature vector with time and frequency domain variables, where the features are explained in features.txt and features\_info.txt
- **subject\_test.txt**: Gives a participant subject identifier number (1 to 30) for each row of observation form X\_test.txt
- **y\_test.txt**: Gives a participant activity ID number (1 to 6 for 6 different activities) as described in activity\_labels.txt

<br /> <br /><br />




<a name="Data"/>
<h4>Data Used in run_analysis()</h4>
==========================================

The general naming convention of the columns for the full dataset described above in Documentation is as described below. Signals were obtained from the smartphone sensory information and vectors were created for the following variables (where XYZ refers to separate signals in each X, Y, Z direction). The prefix "t" refers to measurements in the time domain, while the prefix "f" refers to measurements in the frequency domain. The data has been scaled by dividing measurements by the range of values; this means that the variables are technically unitless.

- tBodyAcc-XYZ
- tGravityAcc-XYZ
- tBodyAccJerk-XYZ
- tBodyGyro-XYZ
- tBodyGyroJerk-XYZ
- tBodyAccMag
- tGravityAccMag
- tBodyAccJerkMag
- tBodyGyroMag
- tBodyGyroJerkMag
- fBodyAcc-XYZ
- fBodyAccJerk-XYZ
- fBodyGyro-XYZ
- fBodyAccMag
- fBodyAccJerkMag
- fBodyGyroMag
- fBodyGyroJerkMag

Further transformations computations were completed to obtain the following set of variables from these signals (descriptions taken from the features.txt file from the UCI database): 

- mean(): Mean value
- std(): Standard deviation
- mad(): Median absolute deviation 
- max(): Largest value in array
- min(): Smallest value in array
- sma(): Signal magnitude area
- energy(): Energy measure. Sum of the squares divided by the number of values. 
- iqr(): Interquartile range 
- entropy(): Signal entropy
- arCoeff(): Autorregresion coefficients with Burg order equal to 4
- correlation(): correlation coefficient between two signals
- maxInds(): index of the frequency component with largest magnitude
- meanFreq(): Weighted average of the frequency components to obtain a mean frequency
- skewness(): skewness of the frequency domain signal 
- kurtosis(): kurtosis of the frequency domain signal 
- bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
- angle(): Angle between to vectors.

Additional vectors obtained by calculating the mean for certain signals:
    
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

The data used in run_analysis() is only a subset of the entire dataset described above in order to examine only mean and standard deviation values. **This subset was determined by taking any variable that had "mean" or "std" in its name** (case insensitive). In order to be conservative and keep any relevant variables without cutting any that may be relevant, the net was cast wide.

The following are the variables that were kept and used to make the tidy dataset (procedure as described in the README file). In addition, the first two variables (columns) indicate for each observation (row) what the subject ID and activity are for each mean of the measurement. The descriptions of all remaining variables (columns 3 to 81) are as above.

- subject\_id
- activity\_name
- tBodyAcc\_mean\_X
- tBodyAcc\_mean\_Y
- tBodyAcc\_mean\_Z
- tBodyAcc\_std\_X
- tBodyAcc\_std\_Y
- tBodyAcc\_std\_Z
- tGravityAcc\_mean\_X
- tGravityAcc\_mean\_Y
- tGravityAcc\_mean\_Z
- tGravityAcc\_std\_X
- tGravityAcc\_std\_Y
- tGravityAcc\_std\_Z
- tBodyAccJerk\_mean\_X
- tBodyAccJerk\_mean\_Y
- tBodyAccJerk\_mean\_Z
- tBodyAccJerk\_std\_X
- tBodyAccJerk\_std\_Y
- tBodyAccJerk\_std\_Z
- tBodyGyro\_mean\_X
- tBodyGyro\_mean\_Y
- tBodyGyro\_mean\_Z
- tBodyGyro\_std\_X
- tBodyGyro\_std\_Y
- tBodyGyro\_std\_Z
- tBodyGyroJerk\_mean\_X
- tBodyGyroJerk\_mean\_Y
- tBodyGyroJerk\_mean\_Z
- tBodyGyroJerk\_std\_X
- tBodyGyroJerk\_std\_Y
- tBodyGyroJerk\_std\_Z
- tBodyAccMag\_mean
- tBodyAccMag\_std
- tGravityAccMag\_mean
- tGravityAccMag\_std
- tBodyAccJerkMag\_mean
- tBodyAccJerkMag\_std
- tBodyGyroMag\_mean
- tBodyGyroMag\_std
- tBodyGyroJerkMag\_mean
- tBodyGyroJerkMag\_std
- fBodyAcc\_mean\_X
- fBodyAcc\_mean\_Y
- fBodyAcc\_mean\_Z
- fBodyAcc\_std\_X
- fBodyAcc\_std\_Y
- fBodyAcc\_std\_Z
- fBodyAcc\_meanFreq\_X
- fBodyAcc\_meanFreq\_Y
- fBodyAcc\_meanFreq\_Z
- fBodyAccJerk\_mean\_X
- fBodyAccJerk\_mean\_Y
- fBodyAccJerk\_mean\_Z
- fBodyAccJerk\_std\_X
- fBodyAccJerk\_std\_Y
- fBodyAccJerk\_std\_Z
- fBodyAccJerk\_meanFreq\_X
- fBodyAccJerk\_meanFreq\_Y
- fBodyAccJerk\_meanFreq\_Z
- fBodyGyro\_mean\_X
- fBodyGyro\_mean\_Y
- fBodyGyro\_mean\_Z
- fBodyGyro\_std\_X
- fBodyGyro\_std\_Y
- fBodyGyro\_std\_Z
- fBodyGyro\_meanFreq\_X
- fBodyGyro\_meanFreq\_Y
- fBodyGyro\_meanFreq\_Z
- fBodyAccMag\_mean
- fBodyAccMag\_std
- fBodyAccMag\_meanFreq
- fBodyBodyAccJerkMag\_mean
- fBodyBodyAccJerkMag\_std
- fBodyBodyAccJerkMag\_meanFreq
- fBodyBodyGyroMag\_mean
- fBodyBodyGyroMag\_std
- fBodyBodyGyroMag\_meanFreq
- fBodyBodyGyroJerkMag\_mean
- fBodyBodyGyroJerkMag\_std
- fBodyBodyGyroJerkMag\_meanFreq
<br /> <br /><br />




<a name="Other"/>
<h4>Other Information</h4>
==========================================

Author: RWK

License: None, free to use and edit as people wish (*if* they wish).

Contact: May be made through GitHub



