# output html files
# Created date: 2019/3/22
# Author: mariko ohtsuka
# library, function section ------
library(rmarkdown)
library(rstudioapi)
library(knitr)
library(sjlabelled)
library(table1)
library(stringr)
knitr::opts_chunk$set(echo=F, comment=NA)
# Getting the path of this program path
if (Sys.getenv("R_PLATFORM") == "") {
  this_program_path <- ""   # Windows
} else {
  this_program_path <- rstudioapi::getActiveDocumentContext()$path   # Mac
}
source_path <- getwd()
if (this_program_path != "") {
  temp_path <- unlist(strsplit(this_program_path, "/"))
  source_path <- str_c(temp_path[-length(temp_path)], collapse="/")
}
source(str_c(source_path, "/common.R"))
source(str_c(source_path, "/common_function.R"))
