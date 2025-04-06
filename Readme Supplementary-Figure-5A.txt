This script generates a bar plot comparing the proportion of upregulated CAZyme effectors upon infection between the Fol4287 wild-type strain and the erc3 mutant.

It visualizes how infection impacts CAZyme expression in each strain using a clean side-by-side bar chart. The input data is hard-coded as a small data frame with two strains and their corresponding percentage of upregulated CAZymes.

Each bar represents the percent of CAZymes that are upregulated during infection in that strain. The plot uses custom colors for clarity, with light blue for erc3 and pink for Fol4287 WT. The y-axis is limited to 50% to maintain scale consistency across comparisons and remove excess white space.

The plot includes a title, clear axis labels, and refined aesthetics using a minimal, publication-ready style with black axis lines and no background clutter.

To run the script, simply paste it into RStudio or an R console. No external file input is needed.

Required libraries: ggplot2 and dplyr. Use install.packages(c("ggplot2", "dplyr")) if not already installed.
