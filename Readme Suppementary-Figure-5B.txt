This R script generates a stacked bar chart comparing CAZyme family representation between two fungal infection categories, typically representing the wild type and a mutant strain.

It reads input from a CSV file containing columns for Category and Annotation, where each row corresponds to a CAZyme family observed under a specific condition.

The script first summarizes the data by counting the number of entries per annotation within each category. Then, it assigns a gradient color palette for each category—blue shades for one and pink shades for the other—providing visual distinction between annotations.

Each stacked bar represents a category (e.g., WT or mutant), and within each stack, the different CAZyme families are visualized with their corresponding counts. Labels with annotation names are placed at the center of each segment for clarity.

The plot uses a clean, publication-ready theme, with a transparent background and bold black axis lines to ensure visibility on both white and dark backdrops.

Make sure the input CSV file path is correct and that your data has at least these two columns: "Category" and "Annotation". You can customize the color gradients, bar width, and other aesthetics as needed.

This figure is intended to visually highlight shifts in CAZyme diversity between infection types, and is part of a broader analysis of effector biology in the Marchantia–Fusarium system.

Required R packages: ggplot2, dplyr.
