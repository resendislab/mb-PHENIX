setwd("/Users/cristian/Desktop/MB/mbimpute")
install.packages("glmnet")
install.packages("devtools")
install.packages("Matrix")
install.packages("readr")

library(devtools)
install_github("ruochenj/mbImpute/mbImpute R package")
# Load the R packages
library(mbImpute)
library(glmnet)
#> Loading required package: Matrix
#> Loaded glmnet 4.1-2
library(Matrix)

library(readr)


getwd()

otu_tab[1:6, 1:6]

?otu_tab
data2 <- read.csv("/Users/cristian/Desktop/MB/mbimpute/COVID.csv",header=T, 
                  , sep=",",row.names=1)

#use T2D.csv to impute with mbimpute the dataset of Diner et al, 2019  
data2 
imputed_count_matrix_list <- mbImpute(otu_tab = data2)

imputed_count_matrix_list


CSV = imputed_count_matrix_list[["imp_count_mat_origlibsize"]]


write.csv(CSV,"mbimputed.csv", row.names = TRUE)

