Overview
This script generates a volcano plot to visualize differentially expressed genes (DEGs) in Fusarium oxysporum (Fol4287) infection on tomato. It uses log2 fold change and adjusted p-values to highlight significant genes.

Requirements
Ensure you have the following R libraries installed:
install.packages(c("tidyverse", "ggplot2", "ggrepel", "RColorBrewer"))

Usage
Load the script in R or RStudio.
Run the script, and a file selection window will prompt you to choose your dataset (.csv format).
The script will generate a volcano plot with:
Red points: Significant DEGs (log2FC > 2 or < -2, padj < 0.05)
Black points: Non-significant genes
Dashed lines indicating the significance thresholds.

Input Data Format
The input CSV file should contain the following columns:
log2FoldChange - Log2-transformed fold change of gene expression.
padj - Adjusted p-value for significance testing.

Output
A volcano plot will be displayed in RStudio's plotting window.

Customization
Change file selection method: Modify read.csv(file.choose()) to a fixed file path if needed.
Adjust axis limits: Modify scale_y_continuous(limits = c(0, max(-log10(data$padj), na.rm = TRUE))) for dynamic y-axis scaling.
Modify significance cutoffs: Adjust values in the ifelse() statement for different thresholds.
