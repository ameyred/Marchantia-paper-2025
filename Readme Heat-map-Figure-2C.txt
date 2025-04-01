Overview
This project provides an R script to generate a heatmap using the pheatmap package. The heatmap visualizes gene expression levels of Fusarium oxysporum in different host environments.

Prerequisites
Ensure you have R installed on your system along with the following libraries:
pheatmap
RColorBrewer

To install them, run:
install.packages("pheatmap")
install.packages("RColorBrewer")

Usage
cd heatmap-visualization
Open R or RStudio.
Run the script in your R environment.
When prompted, select the CSV file containing gene expression data.

Input Data Format
The input CSV file should have the following structure:

GeneID
Fol4287_on_Tomato
Fol4287_on_Marchantia

Customization

Modify the breaks variable to change data range segmentation.
Adjust the colorRampPalette to use different color schemes.
Toggle cluster_cols and cluster_rows for hierarchical clustering preferences.

Output
The script generates a heatmap with:
Custom color scaling from light to dark red.
Column clustering enabled.
Row names hidden for clarity.
