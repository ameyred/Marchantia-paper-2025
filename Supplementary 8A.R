# --------------------------------------------
# Heatmap of All DEGs: Fol4287 WT vs ERC3
# --------------------------------------------

# Load necessary libraries
library(pheatmap)        # For generating heatmaps
library(RColorBrewer)    # For color palettes

# Load the gene expression data
data <- read.csv("Insert_your _file".csv)

# Define the color breaks for the heatmap
breaks <- seq(-15, 26, 3)

# Prepare the heatmap data by selecting columns corresponding to Fol4287 WT and ERC3 expression values
heatmap_data <- data[, c("WT_Fol", "erc3")]

# Generate the heatmap with specific parameters:
pheatmap(heatmap_data, 
         cluster_cols = FALSE,        # Do not cluster columns (samples)
         treeheight_row = 0,          # No hierarchical clustering for rows
         treeheight_col = 0,          # No hierarchical clustering for columns
         show_rownames = FALSE,       # Do not show row names (genes)
         border_color = "grey60",     # Border color for the heatmap cells
         cellwidth = 20,              # Width of the cells
         breaks = breaks,             # Define custom breakpoints for color scale
         color = rev(brewer.pal(n = 11, name = "RdBu")))  # Color scale from red to blue
