Codebook
=========
This code book includes information about the source data, the transformations performed after collecting the data and some information about the variables of the resulting data sets.

Source data
----------------
The data in the file correspond to measurements of six activities daily living performed with smartphones to 30 volunteers on 2012.  
The data is part of the results obtained in an experiment carried out by Jorge L. Reyes-Ortiz, et.al. from the smartlab, www.smartlab.ws. Fo more details see: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.  

The activities analyzed were: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING and LAYING.  
The smartphones were equiped with accelerometers and gyroscopes enabling measuring 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.  

The original dataset included 561 variables (see the documentation of the authors for more information). 

Transformations
------------------------
*No transformation* was performed to the original variables during the preparation of the datasets.

Resulting data sets
-------------------------
Three different datasets were built, each including xx variables corresponding to the mean and standard deviation of the measurements of the linear acceleration and angular velocity. Further 4 columns were added in order to facilitate subsequent analysis: dataset, acitivitycode, activitylabels and subjectcode.

1. A tidy data.table for further analysis.
2. A data.table containing the mean value of the measurements for dataset (training and test), activity and subject.
3. A data.table containing the mean value of the measurements for activity and subject.  

###Variables included in the datasets
<code>[1] "tBodyAccmeanX"      "tBodyAccmeanY"      "tBodyAccmeanZ"      "tBodyAccstdX"       "tBodyAccstdY"      
[6] "tBodyAccstdZ"       "tGravityAccmeanX"   "tGravityAccmeanY"   "tGravityAccmeanZ"   "tGravityAccstdX"   
[11] "tGravityAccstdY"    "tGravityAccstdZ"    "tBodyAccJerkmeanX"  "tBodyAccJerkmeanY"  "tBodyAccJerkmeanZ" 
[16] "tBodyAccJerkstdX"   "tBodyAccJerkstdY"   "tBodyAccJerkstdZ"   "tBodyGyromeanX"     "tBodyGyromeanY"    
[21] "tBodyGyromeanZ"     "tBodyGyrostdX"      "tBodyGyrostdY"      "tBodyGyrostdZ"      "tBodyGyroJerkmeanX"
[26] "tBodyGyroJerkmeanY" "tBodyGyroJerkmeanZ" "tBodyGyroJerkstdX"  "tBodyGyroJerkstdY"  "tBodyGyroJerkstdZ" 
[31] "fBodyAccmeanX"      "fBodyAccmeanY"      "fBodyAccmeanZ"      "fBodyAccstdX"       "fBodyAccstdY"      
[36] "fBodyAccstdZ"       "fBodyAccJerkmeanX"  "fBodyAccJerkmeanY"  "fBodyAccJerkmeanZ"  "fBodyAccJerkstdX"  
[41] "fBodyAccJerkstdY"   "fBodyAccJerkstdZ"   "fBodyGyromeanX"     "fBodyGyromeanY"     "fBodyGyromeanZ"    
[46] "fBodyGyrostdX"      "fBodyGyrostdY"      "fBodyGyrostdZ"      "activitycode"       "subjectcode"       
[51] "dataset"</code>

