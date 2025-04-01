Requirements
To run the script, you will need the following Python libraries:
matplotlib for plotting the Venn diagrams.
matplotlib_venn for creating Venn diagrams.
matplotlib.rcParams for customizing font and layout.
You can install the required packages via pip:
pip install matplotlib matplotlib-venn

Script Overview
The script contains two sections:
1. Up-Regulated Genes Venn Diagram
Compares the up-regulated genes in Tomato vs. Marchantia.
Displays the number of genes unique to each condition and the overlap (shared genes).
Custom colors and transparency are applied to the Venn diagram for better visualization.
Font properties (size and family) are adjusted for readability.
2. Down-Regulated Genes Venn Diagram
Compares the down-regulated genes in Tomato vs. Marchantia.
Similar to the up-regulated genes section, this section shows unique and overlapping down-regulated genes.
Both Venn diagrams are displayed using matplotlib with custom labels, font sizes, and colors.
Running the Script
Run the script using Python:
python venn_diagram_script.py
The script will display two Venn diagrams:
Up-Regulated Genes: Tomato vs Marchantia
Down-Regulated Genes: Tomato vs Marchantia

Customization
You can easily customize the script to analyze different sets of genes by modifying the following variables in the script:
set1: The number of genes in the first condition (Tomato or Marchantia).
set2: The number of genes in the second condition (Tomato or Marchantia).
overlap_12: The number of genes shared between both conditions.
You can also modify the colors, transparency, and font settings in the script to fit your specific needs.
