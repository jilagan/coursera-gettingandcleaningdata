# run_analysis.R
# Script does the following (based on the instructions of the assignment):
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Library declarations; Uncomment as needed.
# library(plyr)
# library(data.table)
# library(Hmisc)
# library(sqldf)


# Declare useful variables
# Relative working directory of data
data_dir <- "../UCI HAR Dataset/"
train_dir <- paste0(data_dir,"train/")
test_dir <- paste0(data_dir,"test/")
# Print out directories
print(data_dir)
print(train_dir)
print(test_dir)

# Files
features_file <- paste0(data_dir,"features.txt")
activity_labels_file <- paste0(data_dir,"activity_labels.txt")
output_file <- paste0(data_dir,"tidy_data.txt")

# Clear variables in working space
if (exists("X_train")) rm(X_train)
if (exists("y_train")) rm(y_train)
if (exists("subject_train")) rm(subject_train)
if (exists("X_test")) rm(X_test)
if (exists("y_test")) rm(y_test)
if (exists("subject_test")) rm(subject_test)
if (exists("X")) rm(X)
if (exists("y")) rm(y)
if (exists("subject")) rm(subject)
if (exists("X_tidy")) rm(X_tidy)
if (exists("X_tidy2")) rm(X_tidy2)


# Merge the training and test sets to create one data set
X_train <- read.table(paste0(train_dir,"X_train.txt"))
y_train <- read.table(paste0(train_dir,"y_train.txt"))
subject_train <- read.table(paste0(train_dir,"subject_train.txt"))

X_test <- read.table(paste0(test_dir,"X_test.txt"))
y_test <- read.table(paste0(test_dir,"y_test.txt"))
subject_test <- read.table(paste0(test_dir,"subject_test.txt"))

X <- rbind(X_train, X_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Extract mean and standard deviation of each measurement
features <- read.table(features_file)
# -- Columns to extract
meaningfulFeatures <- features[grep("[mM]ean|[sS]td",features$V2),]
meaningfulCols <- features$V1[grep("[mM]ean|[sS]td",features$V2)]
X_tidy <- X[,meaningfulCols]



# Use descriptive labels
colnames(X_tidy) <- meaningfulFeatures$V2

# Create tidy data set with the average of each activity and each subject
# - merge activity and subject info with X
X_tidy <- cbind(X_tidy, y)
colnames(X_tidy)[length(X_tidy)] <- "activity.id"
X_tidy <- cbind(X_tidy, subject)
colnames(X_tidy)[length(X_tidy)] <- "subject.id"

# Add descriptive activity names
# -- lookup activity names
activity_labels <-  read.table(activity_labels_file)
X_tidy <- merge(X_tidy, activity_labels, by.x="activity.id", by.y="V1")
colnames(X_tidy)[length(X_tidy)] <- "activity"
# -- remove activity.id column
X_tidy$activity.id <- NULL

# - get average/mean by activity by subject
X_tidy2<-aggregate(X_tidy[,1:(length(names(X_tidy))-2)], list(activity=X_tidy$activity,subject=X_tidy$subject.id),mean)

# clean up column names
colnames(X_tidy2) <- gsub("[(),-]","",names(X_tidy2))
# - leave first two column names untouched. Append 'Average' to the rest of the columns.
names(X_tidy2)<-c(names(X_tidy2[1:2]),paste("Average",colnames(X_tidy2[3:ncol(X_tidy2)]),sep = "."))

# - write codebook to file
# - uncomment if you wish to regenerate the codebook
# write.table(names(X_tidy2),'codebook.txt', quote=FALSE, row.names=FALSE, col.names=FALSE)

# - write tidy data to file
write.table(X_tidy2,file=output_file,sep=",",quote=FALSE,row.names=FALSE,col.names=TRUE)

