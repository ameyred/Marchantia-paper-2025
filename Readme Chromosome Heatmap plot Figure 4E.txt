
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
