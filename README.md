GettingCleaningData-run_analysis
================================

<h3>Coursera "Getting and Cleaning Data" Course Project - run_analysis() for the UCI Samsung Dataset</h3>


<h4>What is it?</h4>
====================
The run\_analysis.R code contains a function written for the Coursera *Getting and Cleaning Data* Course as part of the Data Science Specialization series. This is the README.md for this package.

As a brief overview, run\_analysis.R contains a defined function that can be sourced into R. Once sourced, the function run\_analysis() can be called. The function will use data downloaded from the University of California Irvine Machine Learning Repository, containing human activity recognition data collected by smartphones. run\_analysis() will analyze the dataset and produce a short summary in the form of a tidy dataset.




<h4>Downloading and Installation</h4>
=====================================

The source code and necessary data files may all be downloaded as a zip, forked, or cloned on a local machine from the [GettingCleaningData-run_analysis](https://rwk506/GettingCleaningData-run_analysis) repository.

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


<h6>Necessary Libraries</h6>

The R libraries needed to use the provided code are plyr and doBy. **If not installed, run the following lines in R**:

    install.packages("doBy")
    install.packages("plyr")

The file run_analysis.R will attempt to load these packages initially, and an error will be thrown if they are not found.



<h6>Example of Use</h6>

The directory structure for the function **must** be set up described above in *Downlaoding and Installation* (or, alternatively, as in *Documentation: Non-GitHub Data Download*). If an error is occurring during use, check that the pathways follow as above.

To use the function (while in R), it must first be sourced (as below). This may be called from the same location (re: directory/folder) that the run_analysis.R file is in. This may require a setwd("/your/path/here") from the R command line. This is essentially the "install" step.

    source("run_analysis.R")

Or, you can specify where the file location while using source(): 

    source("/your/path/here/run_analysis.R")

Then, the function can be called from the R command line as:

    run_analysis()

The output code will run the computations (as described, see *Inside the Code: The Nitty-Gritty*) and output an ascii text file called "tidy_data.txt". This data will contain the cleaned, tidy dataset conatining means of 79 different measurements (columns) for 180 observations (columns) (30 subjects and 6 activities = 180 observations).

If the user wishes to keep the tidy dataset as a dataframe in R for further use/manipulation, then the following example will save the tidy dataset as a dataframe in the user's R workspace:

    df = run_analysis()

For further explanatory information on variables and data, see the Codebook.md file.








<h4>Documentation</h4>
======================

The data used and available in the GettingCleaningData-run_analysis repository were taken from the publicly available dataset provided by the University of California Irvine Machine Learning Repository, as the ["Human Activity Recognition Using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). This data was sourced from the following study:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto. 
Smartlab - Non Linear Complex Systems Laboratory 
DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy. 
activityrecognition '@' smartlab.ws 
www.smartlab.ws 

GIVE BRIEF EXPLANATION OF EXPERIMENT HERE


The data files are listed here with a brief explanation of what they are. In the primary working folder directory, the following items are necessary, with the test and train subdirectories:

- activity_labels.txt
- features.txt
- features_info.txt
- run_analysis.R
- test/
- train/

The folders test/ and train/ should contain the following items:

- X_test.txt
- subject_test.txt
- y_test.txt

  




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






<h4>Inside the Code: The Nitty-Gritty</h4>
==========================================
- how I processed the data
- what assumptions I made
- why I did things a certain way








<h4>Other Information</h4>
==========================================

Author: RWK
License: None, free to use and edit as people wish (*if* they wish).
Contact: May be made through GitHub



