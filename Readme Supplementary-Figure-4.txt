This script visualizes the expression of the E4 effector gene across different time points (1DPI, 2DPI, 3DPI) in Marchantia using a bar plot with individual data points and error bars.
The goal is to observe trends in E4 gene expression after infection and assess how expression levels vary over time.

Input: a CSV file (E4.csv) with two columns - 'Sample' and 'Expression_E4'. The 'Sample' column contains timepoint and replicate information like "1DPI B1", "2DPI B2", etc. The 'Expression_E4' column has numerical expression values.

The script extracts the numeric DPI (day post-infection) from each sample name, calculates group-wise mean and standard deviation, and generates a bar plot with:
bars representing the mean expression at each time point
error bars showing ± standard deviation
individual sample values overlaid as black points
minimal clean formatting suitable for presentations or publication

To run, open the script in RStudio or any R console, make sure the file path to the CSV is correctly set, and run all lines. Optionally, use ggsave() to export the plot as an image.
Required libraries: ggplot2 and dplyr. Install them using install.packages(c("ggplot2", "dplyr")) if not already available.
