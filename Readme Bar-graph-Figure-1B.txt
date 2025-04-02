The dataset used in this analysis is stored in a CSV file:
📄 Figure_1B.csv

This file contains information on the average fresh weight per thallus across different samples, including:
Mock 3 DPI
Fol4287 3 DPI
Fo47 3 DPI

Mock 5 DPI
Fol4287 5 DPI
Fo47 5 DPI

Files
📌 Figure_1B_Analysis.R - The main R script for data visualization and statistical analysis.

Requirements
To run this script, ensure you have the following R packages installed
install.packages("ggplot2")
install.packages("readr")
install.packages("dplyr")


Run the script to generate a bar plot and perform statistical analysis.
Script Breakdown
1️⃣ Data Processing
Reads the CSV file using read_csv().
Converts the Sample column into a factor to maintain order.
2️⃣ Visualization
Generates a bar plot using ggplot2 to compare the weight per thallus.
Uses custom colors for different groups.
Applies styling adjustments (axis formatting, grid removal, font sizes).

3️⃣ Statistical Analysis
One-way ANOVA: Tests if there are significant differences among groups.
Tukey’s HSD test (if ANOVA is significant): Identifies pairwise differences.

Example Output
📊 The script generates a bar plot showing the average fresh weight per thallus for different conditions.
📈 If statistical significance is detected, ANOVA and Tukey’s HSD test results will be printed in the console.
