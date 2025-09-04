ROI_folder_path <- "C:/Users/Fariv/Desktop/PCA_movie_fMRI/rh_roi_per_node"
num_ROI_nodes <- 36001
ROI_data <- vector("list", num_ROI_nodes)

for (ROI_index in 1:num_ROI_nodes) {
  ROI_file_path <- file.path(ROI_folder_path, sprintf("ROIgrow.%d.1D", ROI_index))
  ROI_reference <- read.table(ROI_file_path, header = FALSE, skip = 2)
  ROI_data[[ROI_index]] <- ROI_reference[[1]][ROI_reference[[1]] != 0]
}




ROI_size <- data.frame(matrix(nrow=36001,ncol=2))
ROI_size[,1] <- (1:36001)
ROI_size[,2] <- NA



raw_folder_path <- "C:/Users/Fariv/Desktop/PCA_movie_fMRI/Movie1_rh_csv"
raw_data_path <- file.path(raw_folder_path, "nat_s01_KC_Movie1_rh.csv")
subj_raw_data <- read.csv(raw_data_path, header = FALSE, skip = 1)[-1]


for (ROI_index in 1:num_ROI_nodes) {
  ROI_file_path <- file.path(ROI_folder_path, sprintf("roi_node_.%d.1D", ROI_index))
  selected_nodes <- ROI_data[[ROI_index]]
  sel_subj_data <- subj_raw_data[c(selected_nodes),]
  
  if (!all(sel_subj_data == 0)){
    ROI_size[ROI_index,2] <- length(selected_nodes)
  } else 
    {ROI_size[ROI_index,2] <- 0}
  }

write.table(ROI_size, "ROI_size.1D", row.names = FALSE, col.names = FALSE, sep=" ")

