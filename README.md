# tidy_dataframe
A piece of code wrote with aim of preparing a dataframe for further analysis
The scrips in the run.R file are grouped per task and dataset, so the instructions to read in the original files containing the data on the training and test sets are at the top of the run.R file. 
Followed you can find the scrips that add and rename columns. The third group includes the instructions that merge the training and the test dataframes. These include checking if the names and positions of te columns of the two dataframes are the same, and if the numbre of rows of te merged dataframe is equal to the sum of the rows of the composing dataframes (i et. training and test datasets).
After this group you can find a few scrips that label the activities and perform further manipulations like changing the names of the variables to lowercase, removing punctuation character like underscore or commas, and so on.
Finally I wrote the instructions to write the dataframes to the working directory as csv files.
