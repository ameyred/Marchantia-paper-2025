# Load necessary libraries
library(pheatmap)       # For heatmap visualization
library(RColorBrewer)   # For custom color palettes

# Load Data
data <- read.csv(file.choose())  # Prompt user to select the dataset

# Set row names using the GeneIDs column
rownames(data) <- data$GeneID

# Extract relevant columns for the heatmap
heatmap_data <- data[, c("Fol4287_on_Tomato", "Fol4287_on_Marchantia")]

# Define breaks for the heatmap
breaks <- seq(-4, 20, by = 4)

# Define a custom color palette from light to dark red
custom_colors <- colorRampPalette(c("#F7F7F7", "#B2182B"))(length(breaks) - 1)

# Plot the heatmap
pheatmap(heatmap_data, 
         cluster_cols = TRUE,      # Cluster columns for better visualization
         treeheight_row = 0,       # Remove row clustering
         treeheight_col = 0,       # Remove column clustering
         show_rownames = FALSE,    # Hide row names for a cleaner look
         border_color = "grey60",  # Add a border for better distinction
         cellwidth = 20,           # Adjust cell width for readability
         breaks = breaks,          # Apply custom breaks
         color = custom_colors)    # Apply color palette
