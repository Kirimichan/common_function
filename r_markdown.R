# output html files
# Created date: 2019/3/22
# Author: mariko ohtsuka
# library, function section ------
library(rmarkdown)
library(knitr)
library(sjlabelled)
library(table1)
library(stringr)
knitr::opts_chunk$set(echo=F, comment=NA)
source_path <- base::getwd()
source(str_c(source_path, "/common.R"))
source(str_c(source_path, "/common_function.R"))

