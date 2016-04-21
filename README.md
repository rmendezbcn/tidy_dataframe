tidy_dataframe
=============
A piece of code wrote with aim of preparing a dataframe for further analysis.  
The scrips in the run.R file are grouped per task and dataset, so the instructions to read in the original files containing the data on the training and test sets are at the top of the run.R file. Followed you can find the scrips that add and rename columns. The third group includes the instructions that merge the training and the test dataframes. These include checking if the names and positions of thhe columns of the two dataframes are the same, and if the number of rows of the merged dataframe is equal to the sum of the rows of the composing dataframes (i et. training and test datasets).

After this group you can find a few lines of code that label the activities and perform further manipulations like changing the names of the variables to lowercase, removing punctuation character like underscore or commas, and so on.

Finally I wrote the instructions to write the dataframes to the working directory as csv files.

Instructions to use the script
------------------------------

1. Download the data set, https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
2. Unzip the data to your working directory. do not change the names of the directories.
3. Start a RStudio session and open the run.R 
4. Run de script and wait for the script to finnish
5. the script will produce three files in the working directory: a tidy dataset and two summary datasets named:
* activitiesdailyliving.txt
* activity_subject_mean_df.txt
* dataset_activity_subject_mean_df.txt
You can find information on the variables included in the dataset in the codebook.md file.  

###Dependencies
The R script installs and load the required packages, you don't have to worry about this issue.  

