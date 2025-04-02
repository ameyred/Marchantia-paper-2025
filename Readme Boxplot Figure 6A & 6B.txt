# Gene Expression Analysis: Fol4287 vs Fo47 at 2DPI and 3DPI

## Overview
This script performs comparative analysis of gene expression between Fol4287 and Fo47 strains at two time points (2 and 3 days post inoculation) in Marchantia. It generates publication-ready box plots with statistical annotations.

## Key Features
- Comparative analysis using Mann-Whitney U tests
- Box plots showing interquartile ranges with individual data points
- Automatic significance annotation (***p<0.001, **p<0.01, *p<0.05)
- Consistent color scheme across both time points
- Clean, minimal visualization style

## Dependencies
- R (version 4.0+ recommended)
- Required packages:
  - `ggplot2` (v3.3.0+)
  - `dplyr` (v1.0.0+)
  - `tidyr` (v1.1.0+)

## Input Files
1. `2DPI_Mar_Defense.csv`
   - Location: `~/Amey_Lab/Marchantia/`
   - Expected columns:
     - First column: Condition/Gene names
     - Fol4287: Expression values
     - Fo47: Expression values

2. `3DPI_Mar_Defense.csv`
   - Same structure as 2DPI file

## Analysis Workflow
1. Data loading and column renaming
2. Conversion from wide to long format
3. Mann-Whitney U test for each gene/condition
4. Significance level determination
5. Visualization with:
   - Box plots (IQR representation)
   - Individual data points
   - Statistical annotations

## Customization Options
1. **Visual Parameters**:
   - Colors: Modify in `scale_fill_manual()`
   - Point/box sizes: Adjust in `geom_point()` and `geom_boxplot()`
   - Text sizes: Modify in `theme()`

2. **Statistical Testing**:
   - Change test type in `wilcox.test()`
   - Adjust significance thresholds in `case_when()`

3. **Output**:
   - To save plots, add:
     ```r
     ggsave("2DPI_results.png", width = 10, height = 6, dpi = 300)
     ggsave("3DPI_results.png", width = 10, height = 6, dpi = 300)
     ```

## Interpretation Guide
- **Box plots**: Show median (center line), IQR (box), and range (whiskers)
- **Points**: Individual gene expression values
- **Colors**:
  - Reddish (#C26A77): Fol4287
  - Blueish (#94CBEC): Fo47
- **Annotations**: Show exact p-values with significance stars

## Notes
- The script handles both time points identically for consistency
- All visual elements are sized for publication quality
- Missing values will need to be handled if present in the data
