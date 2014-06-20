run_analysis <- function() {
###### The necessary libaraies for running this code are: doBy, plyr
  library(doBy)
  library(plyr)

### X_* are the files with all columns included,1 y_* are the files with the ID of the activity,
### and subject_* are the files with the identifier of the human subject  
  
############### TEST DATASET ###############
##### 1. Read in test data and concatenate columns from subject_test, y_test, X_Test files into a single data set
  sub_test=read.table(file="test/subject_test.txt")
  y_test=read.table(file="test/y_test.txt")
  x_test=read.table(file="test/X_test.txt")
  test_df=data.frame(sub_test,y_test,x_test)
  
##### 2. Extract required columns (mean and std cols) from test_df and label columns correctly
  features_readin=read.table(file="features.txt",stringsAsFactors=FALSE)
  features=gsub("(", "", features_readin$V2,fixed=TRUE)
  features=gsub(")", "", features)
  features=gsub("-","_",features)
  features=gsub(",","_",features)
  colnames(test_df) <- c("subject_id","activity_id",features)    ### extract column names from features.txt file
  ### this next loop looks for any "mean" and "std" instances in the column names provided by UCI to extract only these columns
  ### to use for the final, tidy dataset
  ColNums=c(1,2)  ### start with id columns, then add all mean and std columns
  for(ColName in names(test_df)){
    if(grepl("mean", as.character(ColName))==TRUE | grepl("std", as.character(ColName))==TRUE){
      ColNums=append(ColNums,match(ColName,names(test_df)))
    }
  }
  test_df_cut=test_df[,ColNums]
  #print(names(test_df_cut))

##### 3. Combine Data Set from #2 with Activity Data Frame on basis of ActivityID column
  activities=read.table(file="activity_labels.txt",stringsAsFactors=FALSE)
  colnames(activities)=c("act_id","act_name")
  action=vector()
  ### this matches the activity name (walking, laying, etc.) to the activity code (1-6)
  for(i in 1:length(test_df_cut$activity)){#test_df_cut$activity_id){
    for(j in activities$act_id){
      if(test_df_cut$activity_id[[i]]==activities$act_id[[j]]){
        action=append(action,activities$act_name[[j]])
      }
    }
  }
  test_df_cut$activity_name=action



############### TRAIN DATASET ###############
##### 4. Read in train data and concatenate columns from subject_train, y_train, X_Train files into a single dataframe
  sub_train=read.table(file="train/subject_train.txt")
  y_train=read.table(file="train/y_train.txt")
  x_train=read.table(file="train/X_train.txt")
  train_df=data.frame(sub_train,y_train,x_train)

##### 5. Extract required columns (mean and std cols) from train_df and label columns correctly
  features_readin=read.table(file="features.txt",stringsAsFactors=FALSE)
  features=gsub("(", "", features_readin$V2,fixed=TRUE)
  features=gsub(")", "", features)
  features=gsub("-","_",features)
  features=gsub(",","_",features)
  colnames(train_df) <- c("subject_id","activity_id",features)
  ### this next loop looks for any "mean" and "std" instances in the column names provided by UCI to extract only these columns
  ### to use for the final, tidy dataset
  ColNums=c(1,2)
  for(ColName in names(train_df)){
    if(grepl("mean", as.character(ColName))==TRUE | grepl("std", as.character(ColName))==TRUE){
      ColNums=append(ColNums,match(ColName,names(train_df)))
    }
  }
  train_df_cut=train_df[,ColNums]

##### 6. Combine data set from #5 with Activity Data Frame on basis of ActivityID column
  activities=read.table(file="activity_labels.txt",stringsAsFactors=FALSE)
  colnames(activities)=c("act_id","act_name")
  action=vector()
  ### this matches the activity name (walking, laying, etc.) to the activity code (1-6)
  for(i in 1:length(train_df_cut$activity)){#train_df_cut$activity_id){
    for(j in activities$act_id){
      if(train_df_cut$activity_id[[i]]==activities$act_id[[j]]){
        action=append(action,activities$act_name[[j]])
      }
    }
  }
  train_df_cut$activity_name=action


############### FINAL STEPS ###############
##### 7. Combine the two data sets (from #3 and #6) into one (simply add one on top of the other)
  combined_table=rbind(test_df_cut,train_df_cut)


##### 8. Perform the summarization on data set from #7, write to a file
### this is supposed to be a summary of means for 30 subjects with 6 activities each
### this should mean that the number of columns (~80) remains the same, but the number of rows should
### decrease to (~180) significantly when averages of the values are taken
# 1. split based on subject id, then 2. split based on activity name/id
# then average and make new df with summarized information:: split, apply, combine for cols 3 to 81
### summaryBy is in the library(doBy) and summarizes based on particular columns. The "." means all other numerical columns.
  final_table=summaryBy(tBodyAcc_mean_X + . ~ subject_id + activity_name, data=combined_table, FUN=mean)
### write the data to a nice txt file
  write.table(final_table,"tidy_set.txt",sep=', ',row.names=FALSE)
### return final_table as output of the function
  final_table
}


