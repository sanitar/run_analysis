CodeBook for run_analysis.R and initialize_data.R
=========================

initialize_data.R
-------------------------

The "initialize_data.R" script contains fuctiona with this steps:

1. It checks if data directory exists ("HAR" by default)
* If not, it will be created
2. Then it checks if data file exists (from previous downloads) and if not then downloads it from special url ("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" by default)
3. Unzips data file to working directory


run_analysis.R
-------------------------

1. It loads reshape2-library (should be installed previously)
2. It loads initialize_data.R and runs function initialize_data() with default args to get input data files
3. It switches working directory to data direcotry
4. Then it will load all filtered features and all activites. 
5. There is one function named construct_data(), which can load both trains and tests:
  * It loads subjects, labels and sets (urls created by  using "name" argument)
  * Then it binds all 3 cols 
  * Clear variables from env and return data
6. Merge results of previous function with "train" and "test" arguments to get full dataset
7. The next step creates another dataframe that contains the mean of all columns by "subjectID" and "Acivity". This is reshape2 is used for.
8. Switches back to our working dirrectory and writes final tidy data to file "tidy_data.txt"