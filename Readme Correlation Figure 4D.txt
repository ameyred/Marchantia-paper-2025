This R script performs comparative analysis of secretome data between ERC3 and WT conditions, including statistical correlation tests and visualization of log2 fold changes. The analysis is performed for both all chromosomes and a subset of short core chromosomes.

Dependencies
R (version 4.0 or higher recommended)
Required R packages:
ggplot2 (for data visualization)
dplyr (for data manipulation)
tibble (for data frame operations)

Input Files
Main Dataset (All Chromosomes):
Format: CSV with row names
Required columns: log2FC_erc3, log2FC_WT
Short Core Chromosomes Dataset:
Format: CSV with row names
Required columns: log2FC_erc3, log2FC_WT

Analysis Workflow
1. Correlation Analysis
Filters data to include only points where both ERC3 and WT log2FC values are non-zero
Computes Kendall's rank correlation coefficient
Performs statistical significance test for the correlation

2. Data Visualization
Creates scatter plots with:
Points colored by their position:
Teal (#5DA899): Points on y-axis (log2FC_erc3 = 0)
Red (#C26A77): Points on x-axis (log2FC_WT = 0)
Gold (#DCCD7D): Points with both values non-zero
LOESS smoothing curve (dotted black line) based only on non-zero points
Legend showing counts for each point type
Clean, publication-quality formatting

3. Separate Analysis for Short Core Chromosomes
Repeats the same visualization for just the short core chromosomes subset
Output
Statistical Results:
Prints Kendall's correlation coefficient and test results to console

Visualizations:
Two scatter plots (all chromosomes and short core chromosomes)
Plots show:
Point distribution
Correlation trend (LOESS curve)
Point type counts in legend
Clean, minimal styling suitable for publications

Customization Options
Visual Parameters:
Colors: Modify hex codes in scale_color_manual()
Point shapes/sizes: Adjust in geom_point()
Theme elements: Modify in theme() calls

Analysis Parameters:
Correlation method: Change method in cor() and cor.test()
LOESS curve parameters: Adjust in geom_smooth()

Usage
Ensure input files are in the correct locations
Run the script in R/RStudio
Results will be printed to console
Plots will appear in the graphics device (can be saved using RStudio interface or ggsave())

Notes
The script handles missing/zero values appropriately
All visualizations use consistent color schemes for comparability
Plot formatting is optimized for clarity in publications
