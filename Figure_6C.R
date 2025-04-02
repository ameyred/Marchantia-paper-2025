# HEATMAP VISUALIZATION OF CHALCONE SYNTHASE GENE EXPRESSION
# ----------------------------------------------------------

# Load required libraries
library(pheatmap)       # For creating heatmaps
library(RColorBrewer)   # For color palettes (though not directly used here)

# Import data from CSV file
data <- read.csv("~/Amey_Lab/Marchantia/For_Submission/Figure_6/Marchantia_Defense_RNA_Seq/Defense_Genes/Chalcone_Synthase.csv")

# Define breaks for color scale (0 to 10 in 1-unit increments)
breaks <- seq(0, 10, 1)

# Extract relevant columns for heatmap
heatmap_data <- data[, c("log2FC_Fo47", "log2FC_Fol4287")]

# Create white-to-red color gradient
color_palette <- colorRampPalette(c("#FFFFFF", "#B1172C"))(length(breaks) - 1)

# Generate heatmap visualization
pheatmap(heatmap_data, 
         cluster_cols = FALSE,      # Disable column clustering
         treeheight_row = 0,        # Remove row dendrogram
         treeheight_col = 0,        # Remove column dendrogram
         show_rownames = FALSE,     # Hide row names
         border_color = "grey60",   # Cell border color
         cellwidth = 20,            # Cell width in pixels
         breaks = breaks,           # Defined breaks for color scale
         color = color_palette      # White → Red gradient
)

# Potential enhancements (uncomment to use):
# ----------------------------------------
# 1. To save the heatmap:
# png("chalcone_synthase_heatmap.png", width = 800, height = 1000)
# pheatmap(...)
# dev.off()
# 
# 2. To add row names with specific size:
# pheatmap(..., show_rownames = TRUE, fontsize_row = 8)
# 
# 3. To use a different color gradient:
# colorRampPalette(c("blue", "white", "red"))(100)