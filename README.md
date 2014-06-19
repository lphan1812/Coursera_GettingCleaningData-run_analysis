GettingCleaningData-run_analysis
================================

<h3>Coursera Getting and Cleaning Data Course Project: run_analysis() for the UCI Samsung Dataset</h3>

<br />

<h4>Table of Contents</h4>
[What is it?](#What)<br />
[Downloading and Installation](#Install)<br />
[Necessary Libraries](#Libs)<br />
[Example of Use](#Use)<br />
[Documentation](#Doc)<br />
[Documentation: Non-GitHub Data Download](#Doc-noGH)<br />
[Inside the Code: The Nitty-Gritty](#Code)<br />
[Other Information](#Other)<br />
<br /><br />


<a name="What"/>
<h4>What is it?</h4>
====================
The run\_analysis.R code contains a function written for the Coursera *Getting and Cleaning Data* Course as part of the Data Science Specialization series. This is the README.md for this package. **The goal of run_analysis.R is to create a function to clean and tidy this data and give a summary of certain variables for each activity each subject performed.**

As a brief overview, run\_analysis.R contains a defined function that can be sourced into R. Once sourced, the function run\_analysis() can be called. The function will use data downloaded from the University of California Irvine Machine Learning Repository, containing human activity recognition data collected by smartphones. run\_analysis() will analyze the dataset and produce a short summary in the form of a tidy dataset.
<br /> <br /><br />


<a name="Install"/>
<h4>Downloading and Installation</h4>
=====================================

The source code and necessary data files may all be downloaded as a zip, forked, or cloned on a local machine from the [GettingCleaningData-run_analysis](https://rwk506/GettingCleaningData-run_analysis) repository.

For those readers/users who have taken part in the Coursera Getting and Cleaning Data course, the run_analysis.R file should be *in* the UCI HAR Dataset folder and run from *that* location. For those who are obtaining everything from GitHub, the setup should work as-is.

More specifically, the necessary files are as follows. In the primary working folder directory, the following items are necessary, with the test and train subdirectories:

    -rwxr-xr-x@         80     activity_labels.txt
    -rwxr-xr-x       15785     features.txt
    -rwxr-xr-x@       2809     features_info.txt
    -rw-r--r--        5096     run_analysis.R
    drwxr-xr-x@        204     test
    drwxr-xr-x@        204     train
    
The folder /test/ should contain the following items:

    -rwxr-xr-x       26458166   X_test.txt
    -rwxr-xr-x@          7934   subject_test.txt
    -rwxr-xr-x@          5894   y_test.txt

and the folder /train/ should contain the following items:

    -rwxr-xr-x@      66006256   X_train.txt
    -rwxr-xr-x@         20152   subject_train.txt
    -rwxr-xr-x@         14704   y_train.txt
<br /> <br />


<a name="Libs"/>
<h6>Necessary Libraries</h6>

The R libraries needed to use the provided code are plyr and doBy. **If not installed, run the following lines in R**:

    install.packages("doBy")
    install.packages("plyr")

The file run_analysis.R will attempt to load these packages initially, and an error will be thrown if they are not found.
<br /> <br />


<a name="Use"/>
<h6>Example of Use</h6>

For those readers/users who have taken part in the Coursera Getting and Cleaning Data course, the run_analysis.R file should be *in* the UCI HAR Dataset folder and run from *that* location. For those who are obtaining everything from GitHub, the setup should work as-is.

The directory structure for the function **must** be set up described above in *Downlaoding and Installation* (or, alternatively, as in *Documentation: Non-GitHub Data Download*). If an error occurs during use, check that the pathways are as above and that all necessary libraries are installed.

To use the function (while in R), it must first be sourced (as below). This may be called from the same location (re: same directory or folder) that the run_analysis.R file is in. This may require a setwd("/your/path/here") from the R command line. This is essentially the "install" step.

    source("run_analysis.R")

Or, you can specify where the file location while using source(): 

    source("/your/path/here/run_analysis.R")

Then, the function can be called from the R command line as:

    run_analysis()

The output code will run the computations (as described, see *Inside the Code: The Nitty-Gritty*) and **create an ascii text file called "tidy_data.txt". This data will contain the cleaned, tidy dataset conatining means of 79 different measurements (columns) for 180 observations (columns) (30 subjects and 6 activities = 180 observations)**.

If the user wishes to keep the tidy dataset as a dataframe in R for further use/manipulation, then the following example will save the tidy dataset as a dataframe in the user's R workspace:

    df = run_analysis()

For further explanatory information on variables and data, see the Codebook.md file.
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



<a name="Doc-noGH"/>
<h4>Documentation: Non-GitHub Data Download</h4>
================================================

If the data is downloaded separately (i.e.: from the UCI site, and not here on GitHub as a zipped file), then the directory structure for the function **must** be set up as follows, with the path:

    /your/path/here/UCI HAR Dataset/

Where "/your/path/here" signals wherever folder you have placed your "UCI HAR Dataset" folder, containing the following items:

    -rwxr-xr-x@         80     activity_labels.txt
    -rwxr-xr-x       15785     features.txt
    -rwxr-xr-x@       2809     features_info.txt
    -rw-r--r--        5096     run_analysis.R
    drwxr-xr-x@        204     test
    drwxr-xr-x@        204     train
    
and the path:

    /your/path/here/UCI HAR Dataset/test
    
containing the following items:

    -rwxr-xr-x       26458166   X_test.txt
    -rwxr-xr-x@          7934   subject_test.txt
    -rwxr-xr-x@          5894   y_test.txt

and the path:

    /your/path/here/UCI HAR Dataset/train

containing the following items:

    -rwxr-xr-x@      66006256   X_train.txt
    -rwxr-xr-x@         20152   subject_train.txt
    -rwxr-xr-x@         14704   y_train.txt

<br /> <br /><br />



<a name="Code"/>
<h4>Inside the Code: The Nitty-Gritty</h4>
==========================================
Following is a description of the code itself, explaining the main steps and what R functions were used to achieve those steps. One may wish to follow along in the code, where the steps are labeled similarly.

1. Read in test data and concatenate columns from subject\_test, y\_test, X\_test files into a single data set:
    - Use read.table() to read in all files
    - Make a dataframe, test\_df, of these three files using data.frame()

2. Extract required columns (mean and std) from test\_df and label columns correctly:
    - Read in the list of column names in features.txt with read.table() and add the column names "subject\_id","activity_id"
    - Use gsub() to get rid of characters that are bad in R (like "(",  ")",  "-",  and  ",")
    - Use grepl() to find column numbers of columns that have "mean" or "std" in the column name; this is a conservative cut to keep as many relevant mean or std columns as possible (though others may decide to keep more or fewer columns).
    - Make a subset of test\_df (named test\_df\_cut) with only the column numbers that were found with grepl

3. Change activity ID (1 through 6) to actual labels of activities (WALKING, WALKING\_UPSTAIRS, WALKING\_DOWNSTAIRS, SITTING, STANDING, LAYING) :
    - Use read.table() to read in activity table from activity\_labels.txt
    - Use for loop to create and add new column containing appropriate activity labels

4. Repeat step 1 for the "train" dataset (subject\_train, y\_train, X\_train)
5. Repeat step 2 for the "train" dataset (subject\_train, y\_train, X\_train)
6. Repeat step 3 for the "train" dataset (subject\_train, y\_train, X\_train) to obtain a train\_df\_cut dataframe

7. Combine the test\_df\_cut and train\_df\_cut dataframes into one file (combined\_table) using rbind(). This is the cleaned dataset.

8. Summarize the clean dataset combined\_table into a tidy dataset and write to a file:
    - Summarize the dataset into a final\_table using summaryBy() (this is part of the doBy package!)
    - Write the final clean and tidy dataset to a text file called tidy_set.txt using write.table()
    - Return the final\_table as a dataframe

<br /> <br /><br />



<a name="Other"/>
<h4>Other Information</h4>
==========================================

Author: RWK

License: None, free to use and edit as people wish (*if* they wish).

Contact: May be made through GitHub



