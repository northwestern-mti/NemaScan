#!/usr/bin/env Rscript

# argument information
# 1 - wormbase build (format: WSXXX, XXX has to be greater than 245)
# 2 - species: (supported options: c_elegans, c_briggsae, c_tropicalis)

# # # example args
# args <- c("WS270", "tropicalis")

# load arguments
args <- commandArgs(trailingOnly = TRUE)

markdown_rmd <- args[1]

rmarkdown::render(markdown_rmd)