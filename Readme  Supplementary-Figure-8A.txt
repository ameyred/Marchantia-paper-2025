This R script generates a heatmap of all differentially expressed genes (DEGs) between the Fol4287 WT and ERC3 strains.

Data:
The input data file (HeatMap_All_Genes.csv) should contain the expression data for the Fol4287 WT and ERC3 strains. The two columns of interest in the dataset are:

WT_Fol: Gene expression values for the Fol4287 WT strain

erc3: Gene expression values for the ERC3 strain

Steps:
Load Libraries:

The script uses the pheatmap library to generate the heatmap.

The RColorBrewer library is used for color palette selection.

Define Data:

The data is read from the CSV file containing expression values for Fol4287 WT and ERC3.

Breaks:

The breaks vector defines the color scale intervals for the heatmap. In this case, the values range from -15 to 26 with intervals of 3.

Create Heatmap:

The heatmap is generated using the pheatmap function with the following options:

cluster_cols = FALSE: This option disables the clustering of columns (samples).

treeheight_row = 0 and treeheight_col = 0: These options remove hierarchical clustering for both rows and columns.

show_rownames = FALSE: The row names (genes) are not displayed on the heatmap.

border_color = "grey60": The border color for each cell is set to grey.

cellwidth = 20: Defines the width of the heatmap cells.

color: The color scale used for the heatmap is from the RdBu palette (from red to blue), with a reversal to ensure that the highest values are in red.

Output:
The heatmap visually represents the gene expression differences between Fol4287 WT and ERC3. Higher expression levels are indicated by a red color, and lower expression levels are shown in blue, with intermediate levels displayed on the color spectrum in between.
