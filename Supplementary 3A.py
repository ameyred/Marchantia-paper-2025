# CHROMOSOME MAPPING VISUALIZATION OF EFFECTOR GENES
# -------------------------------------------------

import matplotlib.pyplot as plt
import matplotlib.patches as patches
import pandas as pd
import numpy as np
import matplotlib as mpl

# DATA LOADING AND PREPARATION
# ----------------------------
# Load effector gene annotations from tab-delimited file
ann_file = 'Fo47 Chromomap effector all.txt'
annotations = pd.read_csv(ann_file, sep="\t", header=None)
annotations.columns = ['GeneID', 'Chromosome', 'End', 'Start', 'Score']

# COLOR GRADIENT FUNCTION
# -----------------------
def gradient_color(score, min_score, max_score):
    """
    Map effector scores to a gradient from light pink to dark red
    Args:
        score: Current gene score
        min_score: Minimum score in dataset
        max_score: Maximum score in dataset
    Returns:
        RGB color array
    """
    norm = (score - min_score) / (max_score - min_score)
    color1 = np.array([255/255, 179/255, 179/255])  # Light pink
    color2 = np.array([153/255, 0/255, 0/255])      # Dark red
    return color1 * (1 - norm) + color2 * norm  # Linear interpolation

# Get score range for normalization
min_score = annotations['Score'].min()
max_score = annotations['Score'].max()

# CHROMOSOME DATA
# ---------------
# Chromosome lengths (in bp) for Fo47 genome
chromosomes = {
    "1": 6487135,
    "2": 5611497,
    "3": 5151772,
    "4": 4731052,
    "5": 4523040,
    "6": 4300638,
    "7": 4259108,
    "8": 3716460,
    "9": 3277645,
    "10": 2893631,
    "11": 2853886,
    "12": 2552985,
}

# Chromosomes to highlight (currently only Chr7)
highlighted_chromosomes = {"7"}

# PLOT CONFIGURATION
# ------------------
fig, ax = plt.subplots(figsize=(12, 10))  # Large figure for clarity
scaling_factor = 1e6  # Convert bp to Mbp

# CHROMOSOME PLOTTING
# -------------------
y_pos = 0  # Vertical position tracker

for chrom, length in chromosomes.items():
    # Set chromosome color - highlight Chr7 differently
    color = "#3D65A5" if chrom in highlighted_chromosomes else "#cce6ff"
    
    # Draw chromosome rectangle
    rect = patches.Rectangle(
        (0, y_pos), 
        length / scaling_factor, 
        1, 
        edgecolor="black", 
        facecolor=color
    )
    ax.add_patch(rect)
    
    # Add chromosome label
    ax.text(-0.5, y_pos + 0.5, f"Chr {chrom}", 
            verticalalignment='center', 
            fontsize=10)
    
    # PLOT EFFECTOR GENES
    # -------------------
    chr_genes = annotations[annotations['Chromosome'] == int(chrom)]
    for _, row in chr_genes.iterrows():
        start = row['Start'] / scaling_factor
        color = gradient_color(row['Score'], min_score, max_score)
        # Draw small rectangle for each gene
        gene_rect = patches.Rectangle(
            (start, y_pos - 0), 
            (0.04),  # Fixed width for visibility
            1, 
            facecolor=color, 
            alpha=1
        )
        ax.add_patch(gene_rect)
    
    y_pos += 2  # Increment vertical position

# COLOR BAR SETUP
# --------------
# Create custom color map for legend
cmap = mpl.colors.LinearSegmentedColormap.from_list(
    "custom_gradient", 
    [[255/255, 179/255, 179/255], [153/255, 0/255, 0/255]]    
)

# Add color bar to show score mapping
norm = mpl.colors.Normalize(vmin=min_score, vmax=max_score)
sm = plt.cm.ScalarMappable(cmap=cmap, norm=norm)
sm.set_array([])
cbar = plt.colorbar(sm, ax=ax)
cbar.set_label('Effector Score', rotation=270, labelpad=15)

# PLOT FORMATTING
# --------------
ax.set_xlim(-1, max(chromosomes.values()) / scaling_factor + 1)
ax.set_ylim(-1, y_pos)
ax.set_xlabel("Genomic Position (Mbp)", fontsize=12)
ax.set_ylabel("Chromosomes", fontsize=12)
plt.gca().invert_yaxis()  # Put Chr1 at top
plt.tight_layout()

# Save high-resolution version
plt.savefig('Fo47_effector_map.png', dpi=300, bbox_inches='tight')
plt.show()