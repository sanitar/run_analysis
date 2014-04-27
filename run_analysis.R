
# Load reshape2 library (for average) 
library(reshape2)

# Load data initialization function 
source('initialize_data.R')
# and run it
initialize_data()

# Switch working directory to data-directory
setwd('./UCI HAR Dataset/')

# Read features and leave only containing mean or std
features <- read.table('features.txt')
names(features) <- c("featureID","featureName")
features_mask <- grepl("mean\\(\\)|std\\(\\)", features$featureName, ignore.case=FALSE)

# Read activities to create table of names and codes
activities <- read.table("activity_labels.txt")
names(activities) <-c ("activityID","Activity")

# Function loads datasets both of trains and test
# arguments "name" - can be 'train' or 'test' to create right filenames  
construct_data <- function (name = 'train') {
  
  # Read subjects, add col name
  subject <- read.table(paste(name,'/subject_', name, '.txt', sep=''))
  names(subject) <- c("subjectID")
  
  
  # Read the activity ids, add names
  labels <- read.table(paste(name, '/y_',name,'.txt', sep=''))
  names(labels) <- c("activityID")
  labels_f <- merge(labels, activities, by="activityID")
  
  # Read features in cols
  sets <- read.table(paste(name, '/X_',name,'.txt', sep=''))
  names(sets) <- features$featureName
  sets_f <- sets[,features_mask]
  
  # Bind all 3 cols, and add title fo activities
  output <- cbind(subject, labels_f$Activity, sets_f)
  names(output)[2] <- "Activity"
  
  # Clear env
  remove (subject, labels, sets)
  
  output
} 

# Merge tests and trains (get both from construct_data function)
df <- rbind(construct_data('train'), construct_data('test'))


# Makes average for "Activity" and "subjectID" (using reshape2 library)
meltdata <- melt(df, id=c("Activity", "subjectID"), measure.vars=setdiff(colnames(df), c("Activity", "subjectID")))
tidy_df <- dcast(meltdata, Activity + subjectID ~ variable, mean)    

# Switch back to real working directory
setwd('../')

# Create output CSV file (txt due to coursera upload limits)
write.csv(tidy_df, file="tidy_data.txt")