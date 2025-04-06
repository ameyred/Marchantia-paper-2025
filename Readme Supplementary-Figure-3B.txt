This Python script generates a chromosome map visualization with gene annotations colored by score values. The plot displays all chromosomes of Marchantia, with specific chromosomes or regions highlighted, and gene annotations represented as colored bars along each chromosome.

Features
Visualizes chromosomes as horizontal bars with proper scaling
Highlights specific chromosomes (3, 6, 14, 15) and regions (on chromosomes 1 and 2)
Plots gene annotations with color gradients based on score values
Includes a color bar legend for score interpretation
Automatically adjusts layout for clear visualization

Requirements
Python 3.x

Required packages:
matplotlib
pandas
numpy

Usage
Prepare your annotation file in tab-separated format with columns: GeneID, Chromosome, Start, End, Score
Update the ann_file variable in the script to point to your annotation file
Run the script to generate the visualization

Output
The script generates a matplotlib figure showing:
All chromosomes as horizontal bars
Highlighted chromosomes/regions in dark blue
Gene annotations as colored vertical bars
A color scale indicating score values

Customization
You can modify:
Highlighted chromosomes by editing highlighted_chromosomes
Highlighted regions by editing highlighted_regions
Color schemes in the gradient_color function
Figure size and appearance parameters
