library(tidyverse) # Includes ggplot2 for visualization, dplyr for data manipulation.
library(RColorBrewer)
library(ggrepel)
library(ggplot2)

# Load Data (Modify path accordingly)
data <- read.csv(file.choose())  # Allows user to select the file interactively

# Define significance categories for better readability
data$Significance <- ifelse(data$padj < 0.05 & data$log2FoldChange > 2, "Significant",
                            ifelse(data$padj < 0.05 & data$log2FoldChange < -2, "Significant", 
                                   "Not significant"))

# Create Volcano Plot
p <- ggplot(data, aes(x = log2FoldChange, y = -log10(padj), color = Significance)) +
  geom_point(size = 2, shape = 16) +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", colour = "black") +
  geom_vline(xintercept = c(-2, 2), linetype = "dashed", colour = "black") +
  scale_y_continuous(limits = c(0, max(-log10(data$padj), na.rm = TRUE))) +  # Adjust dynamically
  scale_x_continuous(limits = c(-15, 25), breaks = seq(-15, 25, 10)) +
  scale_color_manual(values = c("black", "red"), 
                     labels = c("Not significant", "Significant")) +
  theme(panel.background = element_rect(fill = 'transparent'),
        axis.line = element_line(size = 0.5, colour = "black", linetype = 1),
        legend.position = "bottom",
        axis.text.x = element_text(size = 12),
        axis.text.y = element_text(size = 12),
        legend.title = element_blank(),
        legend.text = element_text(size = 12))

p
