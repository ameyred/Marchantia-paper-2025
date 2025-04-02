# Volcano Plot Analysis: ERC3 vs Axenic in Marchantia (All Genes)
# -------------------------------------------------------------

# Load required libraries
library(tidyverse)    # For data manipulation and visualization
library(RColorBrewer) # For color palettes (though not directly used here)
library(ggrepel)      # For smart label placement (available but not used in current version)
library(ggplot2)      # For creating the plot (also loaded by tidyverse)

# Import DESeq2 results data
# File contains differential expression analysis results
data <- read.csv("~/Amey_Lab/Marchantia/Fol_erc3/erc3_AX/DESeq2_erc3_Output.csv")

# Create the volcano plot
p <- ggplot(data, aes(x = log2FoldChange, y = -log10(padj))) +
  
  # Plot all genes as points
  geom_point(
    size = 1,          # Point size
    shape = 1,         # Hollow circles (shape code 1)
    aes(color = factor(
      # Color logic:
      ifelse(padj < 0.05,                   # If significant (p < 0.05)
             ifelse(log2FoldChange < 2,      # Then check fold change
                    ifelse(log2FoldChange > -2, "black", "red"),  # Within FC threshold = black
                    "red"),                  # Outside FC threshold = red
             "black")                        # Not significant = black
    ))
  ) +
  
  # Add significance threshold lines:
  # Horizontal line for p-value cutoff (-log10(0.05) ≈ 1.3
  geom_hline(yintercept = -log10(0.05), 
             linetype = "dashed", 
             colour = "black") +
  
  # Vertical lines for fold change cutoffs (±2)
  geom_vline(xintercept = -2, 
             linetype = "dashed", 
             colour = "black") +
  geom_vline(xintercept = 2, 
             linetype = "dashed", 
             colour = "black") +
  
  # Set axis limits:
  # Y-axis (significance) from 0 to 300
  scale_y_continuous(limits = c(0, 300)) +
  
  # X-axis (fold change) from -15 to 20, with breaks every 5 units
  scale_x_continuous(limits = c(-15, 20), 
                     breaks = seq(-15, 20, 5)) +
  
  # Custom color scale for points:
  scale_color_manual(
    values = c("black", "red"),  # Colors for non-sig and significant
    labels = c("Not significant", "Significant")  # Legend labels
  ) +
  
  # Customize plot appearance:
  theme(
    panel.background = element_rect(fill = 'transparent'),  # Transparent background
    axis.line = element_line(size = 0.5, colour = "black", linetype = 1),  # Axis lines
    legend.position = "bottom",  # Legend position
    axis.text.x = element_text(size = 16),  # X-axis text size
    axis.text.y = element_text(size = 16),  # Y-axis text size
    legend.title = element_blank(),  # No legend title
    legend.text = element_text(size = 12)  # Legend text size
  )

# Display the plot
p

# Potential Enhancements (uncomment to use):
# ----------------------------------------
# 1. Add labels for top significant genes:
# p + geom_text_repel(data = subset(data, padj < 0.05 & abs(log2FoldChange) > 2),
#                     aes(label = gene_name), size = 3, box.padding = 0.5)

# 2. Save the plot to file:
# ggsave("volcano_plot.png", plot = p, width = 8, height = 6, dpi = 300)