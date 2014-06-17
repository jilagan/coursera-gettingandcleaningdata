coursera-gettingandcleaningdata
===============================

#Coursera Getting and Cleaning Data Final Project

##Implementation notes:

* I chose all columns with mean and std in the name, regardless of whether they would be ultimately meaningful or not.
* I didn't combine variables with X, Y and Z since I wasn't sure if it would make sense to do so.
* The final tidy data is described in CodeBook.md (which could be found in this repository). It has 88 columns (86 + activity + subject.id).

##General implementation approach:

1. Merge the training and test sets to create one data set.
2. Extract mean and standard deviation of each measurement. (get all columns with "[mM]ean" or "[sS]td" in the name).
3. Replace with descriptive names
4. Merge activity and subject information in the merged observation data set
5. Replace activy id with more descriptive activity label
6. Get average (mean) per activity and subject
7. Rename columns (except activity and subject) to include 'Average.' as prefix.
8. Write results to a comma delimited file 'tidy_data.txt'. (I chose comma-delimited since I find it more convenient to use read.csv than any other read-file function. It was just a matter of personal preference.)

##To set up on your machine:

1. Clone the repository as follows: git clone https://github.com/jilagan/coursera-gettingandcleaningdata.git

2. Unzip the file "UCI HAR Dataset.zip" such as the "UCI HAR Dataset" directory is at the same level as the "coursera-gettingandcleaningdata" directory. 

3. In R, set the working directory to "coursera-gettingandcleaningdata"

4. Run run_analysis.R as follows: source('run_analysis.R')

5. Inspect the file 'tidy_data.txt' written under the 'UCI HAR Dataset" directory.
