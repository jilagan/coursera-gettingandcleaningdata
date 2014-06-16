# run_analysis.R
# Script does the following (based on the instructions of the assignment):
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

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
if (exists("X_extracted")) rm(X_extracted)
if (exists("y_extracted")) rm(y_extracted)


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
X_extracted <- X[,meaningfulCols]
y_extracted <- y[,meaningfulCols]

# Add descriptive activity names

# Use descriptive labels


# Create tidy data set with the average of each activity and each subject
# - merge subject info with X and y

# - get average/mean

# - write to file


