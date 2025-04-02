# Fungal Biomass Quantification Analysis

## Overview
This script analyzes and visualizes relative fungal biomass measurements at 3 days post inoculation (3DPI). It creates a bar plot with error bars showing mean ± standard deviation, along with individual data points and statistical significance testing.

## Key Features
- Bar plot with mean values and standard deviation error bars
- Overlaid individual data points
- Automatic ANOVA significance testing
- Publication-ready formatting
- Clean, minimal design with proper axis labeling

## Dependencies
- R (version 4.0+ recommended)
- Required packages:
  - `ggplot2` (v3.3.0+)
  - `dplyr` (v1.0.0+)
  - `readr` (v1.4.0+)
  - `ggpubr` (v0.4.0+)

## Input Data
- **Expected Format**:
  - Column 1: Sample names (e.g., "Group1 B1")
  - Column 2: Relative fungal biomass measurements

## Customization Options

### Visual Parameters
1. **Colors**:
   - Change bar fill color in `geom_bar(fill = "#5DA899")`
   - Modify point color in `geom_point(color = "black")`

2. **Layout**:
   - Adjust bar width in `geom_bar(width = 0.6)`
   - Change error bar width in `geom_errorbar(width = 0.2)`

3. **Text Sizes**:
   - Base size in `theme_minimal(base_size = 18)`
   - Custom sizes in `theme()` elements

### Statistical Testing
1. Change test method in `stat_compare_means()`:
   - "anova" (default)
   - "t.test" for pairwise comparisons
   - "wilcox.test" for non-parametric

2. Add specific comparisons:
   ```r
   stat_compare_means(comparisons = list(c("Control", "Treatment1"), 
                      method = "t.test")
