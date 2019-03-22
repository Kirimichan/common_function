# Common processing
# Created date: 2019/3/22
# Author: mariko ohtsuka
# Constant section ------
kNA_lb <- -1
kCTCAEGrade <- c(1:5)
# The following constants are used for common_function.R
kCount <- "Count"
kPercentage <- "Percent"
kN_index <- 1
kNA_index <- 2
kDfIndex <- 3
kOutputColnames <- c("Item", "Category", kCount, kPercentage)
# initialize ------
Sys.setenv("TZ" = "Asia/Tokyo")
parent_path <- "/Users/admin/Desktop/xxx"
# log output path
log_path <- str_c(parent_path, "/log")
if (file.exists(log_path) == F) {
  dir.create(log_path)
}
# Setting of input/output path
input_path <- str_c(parent_path, "/input")
# If the output folder does not exist, create it
output_path <- str_c(parent_path, "/output")
if (file.exists(output_path) == F) {
  dir.create(output_path)
}
# read rawdata
csv_list <- list.files(input_path)
for (i in 1:length(csv_list)) {
  temp_objectname <- str_replace(csv_list[i], pattern=".csv", replacement="")
  temp_csv <- read.csv(str_c(input_path, "/", csv_list[i]), as.is=T, fileEncoding="cp932",
                                   stringsAsFactors=F, na.strings="")
  temp_label <- str_c(temp_objectname, "_labels")
  assign(temp_label, as.matrix(temp_csv)[1, ])
  assign(temp_objectname, temp_csv)
}
ptdata <- set_label(ptdata, ptdata_labels)
all_qualification <- as.numeric(nrow(ptdata))
# N
number_of_patients <- str_c("n=", all_qualification, " (", all_qualification / all_qualification * 100, "%)")
#' ### `r number_of_patients`
temp_N <- c("Number of cases", NA, all_qualification, all_qualification / all_qualification * 100)
