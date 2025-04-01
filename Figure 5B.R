# Volcano Plot for WT vs. Mock Condition in Marchantia

# Load required libraries
library(ggplot2)  # For data visualization
library(ggrepel)  # For better label positioning (optional, if needed)

# Read the differential expression data from CSV file
# Ensure the file path is correctly specified for your system
data <- read.csv("~/Amey_Lab/Marchantia/Fol_erc3/Marchantia_Mapping/DESeq_WT_Mock.csv")

# Generate a volcano plot using ggplot2
p <- ggplot(data, aes(x = log2FoldChange, y = -log10(padj))) + 
  
  # Plot points with conditional coloring based on significance
  geom_point(size = 1, shape = 1, aes(color = factor(
    ifelse(padj < 0.05,ifelse(log2FoldChange < 2,ifelse(log2FoldChange > -2, "black", "red"), "red"),"black")))) +  
  # If the adjusted p-value < 0.05 
  # Check log2 fold-change threshold
  # Add horizontal significance threshold line (p-value = 0.05)
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", colour = "black") +
  
  # Add vertical fold-change threshold lines at ±2
  geom_vline(xintercept = -2, linetype = "dashed", colour = "black") +
  geom_vline(xintercept = 2, linetype = "dashed", colour = "black") +
  
  # Adjust y-axis (p-value significance) limits
  scale_y_continuous(limits = c(0, 300)) +
  
  # Adjust x-axis (log2 fold-change) limits with breaks
  scale_x_continuous(limits = c(-10, 15), breaks = seq(-10, 15, 5)) +
  
  # Define custom colors: significant genes (red), non-significant (black)
  scale_color_manual(values = c("black", "red"), labels = c("Not significant", "Significant")) +
  
  # Customize theme for better visualization
  theme(
    panel.background = element_rect(fill = 'transparent'),  # Transparent background
    axis.line = element_line(size = 0.5, colour = "black"),  # Black axis lines
    legend.position = "bottom",  # Place legend at the bottom
    axis.text.x = element_text(size = 16),  # X-axis text size
    axis.text.y = element_text(size = 16),  # Y-axis text size
    legend.title = element_blank(),  # Remove legend title
    legend.text = element_text(size = 12)  # Set legend text size
  )

# Display the plot
p
