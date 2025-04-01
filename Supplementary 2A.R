# =========================================================
# Heatmap of all Differentially Expressed Genes (DEGs) - Figure 2A
# =========================================================

# Load necessary libraries
library(pheatmap)       # For heatmap visualization
library(RColorBrewer)   # For custom color palettes

# Read the data from a CSV file (Update the file path as needed)
data <- read.csv("D:/Ncbs/Excel/Marchantia/Heat map/Heat map.csv")

# Define the color scale breakpoints to adjust color contrast
breaks <- seq(-20, 25, 4.1)  # Values represent expression levels for color mapping

# Extract relevant columns containing gene expression data
heatmap_data <- data[, c("Fol4287_on_Tomato", "Fol4287_on_Marchantia")]

# Generate the heatmap with specific visual settings
pheatmap(
  heatmap_data,
  cluster_cols = FALSE,        # Disable column clustering
  treeheight_row = 0,          # Remove row clustering tree
  treeheight_col = 0,          # Remove column clustering tree
  show_rownames = FALSE,       # Hide row names for a cleaner visualization
  border_color = "grey60",     # Set border color for cell separation
  cellwidth = 20,              # Adjust cell width for better readability
  breaks = breaks,             # Apply custom breaks to control color mapping
  color = rev(brewer.pal(n = 11, name = "RdBu"))  # Use "RdBu" color palette with reversed colors
)
