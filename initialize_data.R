# Function downloads data to working directory and unzips it ("HAR" by default)
# url - url of dataset
# dir - name of directory for data

initialize_data <- function(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", dir_name = 'HAR'){

  # Checking if directory exists, if not — create it
  directory = paste("./", dir_name, sep = '')
  if(!file.exists(directory)){ 
    dir.create(directory) 
  }
     
  # Dowloading file to "data.zip" in our directory if not already
  data_file_path = paste(directory, '/data.zip', sep = '')
  if(!file.exists(data_file_path)){
    download.file(url, destfile = data_file_path, method = "curl")
  }

  # Unzip downloaded dataset to your working directory
  unzip(data_file_path, exdir = './')
}