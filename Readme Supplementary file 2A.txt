Script Overview
The R script reads gene expression data from a CSV file and generates a heatmap using the pheatmap package in R. The heatmap is color-coded using a custom color palette from the RColorBrewer package to represent different gene expression levels across conditions.
Dependencies
To run the script, you'll need to install the following R packages:
pheatmap: For creating heatmaps
RColorBrewer: For color palettes
You can install these packages using the following commands in R:
install.packages("pheatmap")
install.packages("RColorBrewer")
How to Use
Download the R script: Clone this repository or download the R script file.

Prepare your data:
Ensure your data is in a CSV format.
The CSV should contain at least two columns with expression values, such as "Fol4287_on_Tomato" and "Fol4287_on_Marchantia", along with gene identifiers as row names.
Adjust the file path:
Modify the read.csv() line in the script to point to the correct file path for your data.
data <- read.csv("D:/Ncbs/Excel/Marchantia/Heat map/Heat map.csv")
Run the script: Execute the R script to generate the heatmap. The heatmap will be displayed in your R environment.

Output
The output of the script will be a heatmap visualizing gene expression data from two experimental conditions: Tomato and Marchantia. The color scale is determined by a predefined range of expression values and utilizes a reversed RdBu color palette from RColorBrewer.

Parameters
Cluster columns: Disabled (cluster_cols = FALSE)
Row and column tree height: Disabled (treeheight_row = 0, treeheight_col = 0)
Row names: Hidden (show_rownames = FALSE)
Cell width and height: Adjusted for readability (cellwidth = 20, cellheight = 10)
Breaks: The expression values are broken into a sequence from -20 to 25 with intervals of 4.1 (breaks = seq(-20, 25, 4.1)).
