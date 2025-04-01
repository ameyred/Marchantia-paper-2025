Overview
This repository contains an R script to generate a heatmap for WT vs. erc3 secretome data using the pheatmap package. The script loads a dataset, processes it to remove duplicates and missing values, and visualizes the gene expression levels in a heatmap format.

Features
Loads and processes a CSV dataset containing gene expression values.
Handles duplicate row names and missing values.
Extracts relevant columns (WT and erc3) for heatmap visualization.
Uses a custom color palette (Greens) for enhanced visualization.
Disables column clustering while enabling row clustering for better interpretation.
Provides customization options such as cell width, height, and border color.

Prerequisites
Ensure you have R installed along with the following R packages:
pheatmap
RColorBrewer
dplyr
You can install missing packages using:
install.packages("pheatmap")
install.packages("RColorBrewer")
install.packages("dplyr")

Usage
Open the R script (heatmap_script.R) and update the file path to your dataset:
data <- read.csv("your-file-path.csv")
Run the script in R:
source("heatmap_script.R")
The heatmap will be displayed in RStudio or the default plotting window.

Input Data Format
The input CSV file should be structured as follows:
GeneID
WT
erc3
The first column should contain unique GeneIDs.
The following columns should contain numerical expression values for WT and erc3.

Customization
You can modify the script to:
Change the color palette (e.g., use "Blues" instead of "Greens").
Adjust breakpoints for color scaling:
breaks <- seq(-1, 21, 3.5)
