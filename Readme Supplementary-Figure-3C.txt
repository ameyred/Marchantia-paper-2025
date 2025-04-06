# Fungal Biomass Quantification - 3DPI
This R script visualizes fungal biomass accumulation data and performs basic statistical comparisons using ANOVA.

## Objective
To compare relative fungal biomass across different Marchantia sample groups at 3 days post-infection (3DPI).

## Input Data
CSV file with two columns:
Sample, Expression

- `Sample`: Sample ID including biological replicates (e.g., WT B1, OE1 B2)
- `Expression`: Numeric value representing relative fungal biomass

A barplot with:
- Group means and standard deviation (as error bars)
- Individual data points
- Overall ANOVA significance annotation

### Example Plot:
![Example Plot](Fungal_Biomass_3DPI.png) *(if saved using `ggsave()`)*
Make sure to install the following packages:
```r
install.packages(c("ggplot2", "dplyr", "readr"))
if (!requireNamespace("ggpubr")) install.packages("ggpubr")
Run the script in RStudio or R terminal.

⚙️ Customization Options
Pairwise group comparisons (t-tests)
Custom bar colors
Export plot using ggsave()
