# Heatmap Visualization for WT vs. erc3 Secretome

# Load necessary libraries
library(pheatmap)       # For generating heatmaps
library(RColorBrewer)   # For color palettes
library(dplyr)          # For data manipulation

# Read the data from CSV file (Ensure the correct file path is provided)
data <- read.csv("D:/Ncbs/Data that is used/Heat map/erc3 WT secretome heatmap.csv")

# Handle duplicate row names (if any) to avoid conflicts in visualization
data <- data %>% distinct(data[, 1], .keep_all = TRUE)

# Set row names using the first column (assumed to be GeneID or similar) and remove it from the dataset
rownames(data) <- data[, 1]
data <- data[, -1]

# Extract relevant columns for the heatmap (Ensure correct column names are used)
heatmap_data <- data[, c("WT", "erc3")]

# Remove rows with NA values to avoid errors in plotting
heatmap_data <- na.omit(heatmap_data)

# Define custom breakpoints to improve color contrast in the heatmap
breaks <- seq(-1, 21, 3.5)

# Generate heatmap with specific styling and customization
pheatmap(heatmap_data, 
         cluster_cols = FALSE,    # Disable column clustering
         cluster_rows = TRUE,     # Enable row clustering for better visualization
         treeheight_row = 0,      # Remove row clustering tree height
         treeheight_col = 0,      # Remove column clustering tree height
         show_rownames = TRUE,    # Display row names for gene identification
         show_colnames = TRUE,    # Ensure column names (WT, erc3) are visible
         border_color = "grey",   # Light grey border for cell separation
         cellwidth = 20,          # Adjust cell width for readability
         cellheight = 10,         # Adjust cell height to fit more rows
         breaks = breaks,         # Apply custom breaks for color scaling
         color = brewer.pal(n = 5, name = "Greens"))  # Use the "Greens" color palette for better visibility
