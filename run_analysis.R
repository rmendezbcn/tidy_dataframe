
cat('\n', 'dataframe on activities daily living (adl) recorded during the development of the project', sep = ' ')
cat('\n', 'Human Activity Recognition Using Smartphones by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.', sep = ' ')

cat('\n', 'installing and loading required packages', sep = ' ')
install.packages(dplyr)
library(dplyr)
install.packages(data.table)
library(data.table)
install.packages(reshape2)
library(reshape2)

cat('\n', 'R E A D I N G  I N  T H E  D A T A', sep = ' ')

cat('\n', 'T R A I N I N G  D A T A S E T S', sep = ' ')
adl_train_data_df <- fread(paste(getwd(), '/UCI HAR Dataset/train/' ,'X_train.txt', sep = ''))
str(adl_train_data_df)

cat('\n', 'the codes of the activities performed by the volunteers', sep = ' ')
adl_train_activity_code_df <- fread(paste(getwd(), '/UCI HAR Dataset/train/' ,'y_train.txt', sep = ''))
table(adl_train_activity_code_df)

cat('\n', 'the names of the variables in the training dataset', sep = ' ')
adl_varnames_df <- fread(paste(getwd(), '/UCI HAR Dataset/' ,'features.txt', sep = ''))
cat('\n', 'prepraing the df for further manipulations', sep = ' ')
cat('\n', 'removing these punctuation characters form the varnames colum:', sep = ' ')
# ! " # '$ % & ' ( ) * + , - . / : ; < = > ? @ [ \ ] ^ _ ` { | } ~.'
adl_varnames_df <- mutate(adl_varnames_df, varnames = gsub('[[:punct:]]', '', adl_varnames_df$V2))
str(adl_varnames_df)

cat('\n', 'the labels of the activities', sep = ' ')
activity_labels_df <- fread(paste(getwd(), '/UCI HAR Dataset/' ,'activity_labels.txt', sep = ''))
cat('\n', 'prepraing the df for further manipulations', sep = ' ')
activity_labels_df <- rename(activity_labels_df, activitycode = V1)
activity_labels_df <- rename(activity_labels_df, activitylabels = V2)
str(activity_labels_df)

cat('\n', 'reading in the data on the subjects (volunteers) in the training dataset', sep = ' ')
adl_train_subjectid_df <- fread(paste(getwd(), '/UCI HAR Dataset/train/' ,'subject_train.txt', sep = ''))
table(adl_train_subjectid_df)


cat('\n', 'T E S T  D A T A S E T S', sep = ' ')
cat('\n', 'reading in the test dataset', sep = ' ')
adl_test_data_df <- fread(paste(getwd(), '/UCI HAR Dataset/test/' ,'X_test.txt', sep = ''))
str(adl_test_data_df)

cat('\n', 'the codes of the activities performed by the volunteers selected for the test dataset', sep = ' ')
adl_test_activity_code_df <- fread(paste(getwd(), '/UCI HAR Dataset/test/' ,'y_test.txt', sep = ''))
table(adl_test_activity_code_df)


cat('\n', 'both the names of the variabls and the lables of the activities have benn read in already', sep = ' ')
cat('\n', '(see the code in the lines 21-23 and 26-27, respectivelly)', sep = ' ')

cat('\n', 'reading in the data on the subjects (volunteers) in the test dataset', sep = ' ')
adl_test_subjectid_df <- fread(paste(getwd(), '/UCI HAR Dataset/test/' ,'subject_test.txt', sep = ''))
table(adl_test_subjectid_df)

cat('\n', '------------------------------------------', sep = ' ')

cat('\n', 'M A N I P U L A T I N G  T H E  D A T A F R A M E S', sep = ' ')

cat('\n', 'T R A I N I N G  D A T A S E T', sep = ' ')
cat('\n', 'naming the variables in the training dataset', sep = ' ')
names(adl_train_data_df) <- adl_varnames_df$varnames
str(adl_train_data_df)

cat('\n', 'adding the column with the codes of the activities', sep = ' ')
adl_train_data_df2 <- mutate(adl_train_data_df, activitycode = adl_train_activity_code_df$V1)
table(adl_train_data_df2$activitycode)

cat('\n', 'adding the column with the ids of the subjects (volunteers)', sep = ' ')
adl_train_data_df3 <- mutate(adl_train_data_df2, subjectcode = adl_train_subjectid_df$V1)
table(adl_train_data_df3$activitycode, adl_train_data_df3$subjectcode)

cat('\n', 'adding a dummy column to identify the source dataset', sep = ' ')
adl_train_data_df4 <- mutate(adl_train_data_df3, dataset = 'TRAINING')
table(adl_train_data_df4$activitycode, adl_train_data_df4$dataset)

cat('\n', 'extracting the columns with the mean and standard deviation', sep = ' ')
cat('\n', 'this could also be accomplished using the "contains(x) special function of the select()', sep = ' ')
traindf_selected_columns <- names(adl_train_data_df4)[
        grepl('meanX|meanY|meanZ|stdX|stdY|stdZ|activitycode|subjectcode|dataset',
              names(adl_train_data_df4))]
adl_train_extracted_df <- select(adl_train_data_df4, one_of(traindf_selected_columns))
str(adl_train_extracted_df)

cat('\n', 'T E S T  D A T A S E T', sep = ' ')
cat('\n', 'naming the variables in the test dataset', sep = ' ')
names(adl_test_data_df) <- adl_varnames_df$varnames
str(adl_test_data_df)

cat('\n', 'adding the column with the codes of the activities', sep = ' ')
adl_test_data_df2 <- mutate(adl_test_data_df, activitycode = adl_test_activity_code_df$V1)

cat('\n', 'adding the column with the ids of the subjects (volunteers)', sep = ' ')
adl_test_data_df3 <- mutate(adl_test_data_df2, subjectcode = adl_test_subjectid_df$V1)
table(adl_test_data_df3$activitycode, adl_test_data_df3$subjectcode)

cat('\n', 'adding a dummy column to identify the source dataset', sep = ' ')
adl_test_data_df4 <- mutate(adl_test_data_df3, dataset = 'TEST')
table(adl_test_data_df4$activitycode, adl_test_data_df4$dataset)

cat('\n', 'extracting the columns with the mean and standard deviation', sep = ' ')
cat('\n', 'this could also be accomplished using the "contains(x) special function of the select()', sep = ' ')
testdf_selected_columns <- names(adl_test_data_df4)[
        grepl('meanX|meanY|meanZ|stdX|stdY|stdZ|activitycode|subjectcode|dataset',
              names(adl_test_data_df4))]
adl_test_extracted_df <- select(adl_test_data_df4, one_of(testdf_selected_columns))
str(adl_test_extracted_df)


cat('\n', 'M E R G I N G  T H E  E X T R A C T E D  D A T A S E T S (by appending rows)', sep = ' ')
cat('\n', 'checking that the extracted variables are in the same position before appending the rows', sep = ' ')
table(names(adl_train_extracted_df) == names(adl_test_extracted_df))
train_dim <- dim(adl_train_extracted_df)
test_dim <- dim(adl_test_extracted_df)


cat('\n', 'mergin the dfs by appending the test df to the training df', sep = ' ')
merged_df <- bind_rows(adl_train_extracted_df, adl_test_extracted_df)
str(merged_df)

cat('\n', 'checking if the number of rowa in the merged is equal to the sum of the rows of the training and test dfs', sep = ' ')
if(sum(train_dim[1], test_dim[1]) == dim(merged_df)[1]){
        cat('\n\n','--------------- merging correct! -------------','\n\n' , sep = ' ')
} else {
        cat('\n\n','--------------- something when wrong!!! -------------',
            '\n','--------------- something when wrong!!! -------------',
            '\n','--------------- something when wrong!!! -------------', '\n\n', sep = ' ')
}

cat('\n', 'labeling the activities', sep = ' ')
cat('\n', 'this could also be accomplished with a join', sep = ' ')
merged_df <- mutate(merged_df, activitylabels = factor(
        merged_df$activitycode, labels = activity_labels_df$activitylabels))
table(merged_df$activitylabels, merged_df$activitycode)


cat('\n', 'F U F R T H E R  M A N I P U L A T I O N S', sep = ' ')
cat('\n', 'bringing all name characters to lowercase', sep = ' ')
names(merged_df) <- tolower(names(merged_df))

cat('\n', 'renaming variables', sep = ' ')
cat('\n', 'replacing acc for acceleration', sep = ' ')
names(merged_df) <- gsub('accjerk|acc', 'acceleration',names(merged_df))

cat('\n', 'replacing gyro for angvelocity', sep = ' ')
names(merged_df) <- gsub('gyrojerk|gyro', 'angularvelocity',names(merged_df))

cat('\n', 'replacing mag for magnitude', sep = ' ')
names(merged_df) <- gsub('mag', 'magnitude',names(merged_df))

cat('\n', 'writing the resulting df to the working directory as activitiesdailyliving.txt', sep = ' ')
write.table(merged_df, file = toString(paste(getwd(),'/activitiesdailyliving.txt', sep = '')))

cat('\n', 'preparing the df to produce the data tables with the mean values for every measurement', sep = '')
cat('\n\n', 'per dataset (training and test), activities and subject (volunteers)', sep = ' ')
melted_df <- melt(merged_df, id.vars = c('dataset', 'activitylabels', 'subjectcode'))
dataset_activity_subject_mean_df <- dcast(melted_df, dataset+activitylabels+subjectcode ~ variable, fun = mean)
activity_subject_mean_df <- dcast(melted_df, activitylabels+subjectcode ~ variable, fun = mean)


cat('\n\n', 'writing the resulting df to the working directory as dataset_activity_subject_mean_df.txt', sep = ' ')
write.csv(dataset_activity_subject_mean_df, file = toString(paste(getwd(),'/dataset_activity_subject_mean_df.txt', sep = '')))

cat('\n\n', 'writing the resulting df to the working directory as activity_subject_mean_df.txt', sep = ' ')
write.table(activity_subject_mean_df, file = toString(paste(getwd(),'/activity_subject_mean_df.txt', sep = '')))
