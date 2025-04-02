This script creates a volcano plot to visualize differential gene expression results from a comparison between ERC3 and Axenic conditions in Marchantia. The plot highlights statistically significant genes with large fold changes.

Dependencies
R (version 4.0 or higher recommended)
Required R packages:
tidyverse (for data manipulation and visualization)
RColorBrewer (for color palettes)
ggrepel (for intelligent label placement)
ggplot2 (for plotting)

Input File
Required columns: log2FoldChange, padj (adjusted p-value)
Key Features of the Volcano Plot
1. Data Representation
X-axis: log2 fold change (ERC3 vs Axenic)
Range: -15 to 20
Y-axis: -log10 of adjusted p-value
Range: 0 to 300

2. Significance Thresholds
Horizontal line: -log10(0.05) for p-value cutoff
Vertical lines: ±2 for log2 fold change cutoff
Genes beyond these thresholds are considered significant

3. Point Coloring
Red: Significant genes (padj < 0.05 AND |log2FC| > 2)
Black: Non-significant genes

4. Plot Customization
Clean, transparent background
Black axis lines
Legend positioned at bottom
Larger axis text (size 16)
Custom legend labels

Usage Instructions
Ensure the input file is in the correct location
Run the script in R/RStudio
The volcano plot will be generated and displayed
Customization Options

Thresholds:
Modify p-value cutoff by changing padj<0.05
Adjust fold change thresholds by changing log2FoldChange<2 and log2FoldChange>-2

Visual Parameters:
Change point size in geom_point(size=1)
Adjust axis limits in scale_x_continuous() and scale_y_continuous()
Modify colors in scale_color_manual()

Theme Elements:
Adjust background, text sizes, legend position in theme()

Output
A publication-quality volcano plot showing:
Distribution of all genes
Significance thresholds
Color-coded significant/non-significant genes
Clean, minimal styling

Notes
The script currently doesn't include gene labels, but ggrepel is loaded and could be used to add labels for specific genes if desired
The plot can be saved using ggsave() after generation
