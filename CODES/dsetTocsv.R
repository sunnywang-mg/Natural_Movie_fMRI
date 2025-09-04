library(dplyr)
library(tidyr)


raw_folder_path = "C:/Users/Fariv/Desktop/PCA_movie_fMRI/Movie3"
# load raw data for individual

raw_file_list <- list.files(raw_folder_path, pattern = "\\_lh.1D.niml.dset$")

for (raw_file_name in raw_file_list) {
  print(raw_file_name)
  setwd("C:/Users/Fariv/Desktop/PCA_movie_fMRI/Movie3")
  raw_data <- read.table(raw_file_name,header = FALSE,skip=14,nrows=36001)
  raw_data <- lapply(raw_data, as.single)
  
  split_name <- unlist(strsplit(raw_file_name, "[._]"))
  file_name <- paste(c(paste(split_name[1:5], collapse = "_")), "csv", sep = ".")
  
  setwd("C:/Users/Fariv/Desktop/PCA_movie_fMRI/Movie3_lh_csv")
  write.csv(raw_data, file_name, row.names = TRUE)
}

