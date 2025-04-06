"""
Chromosome Visualization Script

This script creates a chromosome map with gene annotations colored by score values.
Specific chromosomes and regions can be highlighted for emphasis.

Key components:
1. Loads gene annotation data from a tab-separated file
2. Creates a gradient color mapping for scores
3. Draws chromosomes as horizontal bars
4. Highlights specified chromosomes and regions
5. Plots gene annotations with score-dependent colors
6. Adds a color bar legend

Input file format (tab-separated):
GeneID Chromosome Start End Score
"""

import matplotlib.pyplot as plt
import matplotlib.patches as patches
import pandas as pd
import numpy as np
import matplotlib as mpl

# Load the annotation file
ann_file = 'd:/Ncbs/Data that is used/Effector profiling/Chromomaps with different thresholds/Marchantia L2FC 5 Fol.txt'
annotations = pd.read_csv(ann_file, sep="\t", header=None)
annotations.columns = ['GeneID', 'Chromosome', 'Start', 'End', 'Score']

def gradient_color(score, min_score, max_score):
    """
    Maps a score to a gradient color between light and dark red.
    
    Parameters:
    - score: The gene score value
    - min_score: Minimum score in dataset
    - max_score: Maximum score in dataset
    
    Returns:
    - RGB color array
    """
    norm = (score - min_score) / (max_score - min_score)
    color1 = np.array([255/255, 179/255, 179/255])  # Light red
    color2 = np.array([153/255, 0/255, 0/255])      # Dark red
    color = color1 * (1 - norm) + color2 * norm
    return color

# Get min and max scores for color normalization
min_score = annotations['Score'].min()
max_score = annotations['Score'].max()

# Chromosome data (chromosome number and length in bp)
chromosomes = {
    "1": 6854980,
    "2": 5577357,
    # ... (other chromosomes)
    "15": 2434640
}

# Chromosomes to fully highlight
highlighted_chromosomes = {"3", "6", "14", "15"}

# Specific regions to highlight within chromosomes (start, end positions)
highlighted_regions = {
    "1": [(5850000, 6854980)],  # Highlight segments in chromosome 1
    "2": [(4500000, 5577357)]   # Highlight segments in chromosome 2
}

# Create figure with large size to accommodate all chromosomes
fig, ax = plt.subplots(figsize=(12, 10))

# Scaling factor to convert bp to Mbp for plotting
scaling_factor = 1e6

# Plot each chromosome as a rectangle
y_pos = 0  # Vertical position tracker

for chrom, length in chromosomes.items():
    # Set color based on whether chromosome is highlighted
    color = "#3D65A5" if chrom in highlighted_chromosomes else "#cce6ff"
    
    # Draw the chromosome rectangle
    rect = patches.Rectangle((0, y_pos), length / scaling_factor, 1, 
                            edgecolor="black", facecolor=color)
    ax.add_patch(rect)
    
    # Add chromosome label
    ax.text(-0.5, y_pos + 0.5, f"Chr {chrom}", 
           verticalalignment='center', fontsize=10)
    
    # Highlight specific regions if defined for this chromosome
    if chrom in highlighted_regions:
        for region in highlighted_regions[chrom]:
            start, end = region
            region_rect = patches.Rectangle(
                (start / scaling_factor, y_pos), 
                (end - start) / scaling_factor, 1, 
                edgecolor="black", facecolor="#3D65A5"
            )
            ax.add_patch(region_rect)
    
    # Plot gene annotations for this chromosome
    chr_annotations = annotations[annotations['Chromosome'] == int(chrom)]
    for _, row in chr_annotations.iterrows():
        start = row['Start'] / scaling_factor
        score = row['Score']
        color = gradient_color(score, min_score, max_score)
        # Draw thin vertical bar for each gene
        ann_rect = patches.Rectangle(
            (start, y_pos - 0), 0.04, 1, 
            facecolor=color, alpha=1
        )
        ax.add_patch(ann_rect)
    
    y_pos += 2  # Move down for next chromosome

# Create colorbar for the score gradient
cmap = mpl.colors.LinearSegmentedColormap.from_list("custom_gradient", [
    ([255/255, 179/255, 179/255]), 
    [153/255, 0/255, 0/255]    
])
norm = mpl.colors.Normalize(vmin=min_score, vmax=max_score)
sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
sm.set_array([])
cbar = plt.colorbar(sm, ax=ax)
cbar.set_label('Score', rotation=270, labelpad=15)

# Final plot adjustments
ax.set_xlim(-1, max(chromosomes.values()) / scaling_factor + 1)
ax.set_ylim(-1, y_pos)
ax.set_xlabel("Mbp")
ax.set_ylabel("Chromosomes")
plt.gca().invert_yaxis()  # Put Chr 1 at top
plt.tight_layout()

plt.show()