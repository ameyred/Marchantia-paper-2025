import matplotlib.pyplot as plt
import matplotlib.patches as patches
import pandas as pd
import numpy as np
import matplotlib as mpl

# Replace 'your_file_path_here' with the path to your annotation file
ann_file = 'your_file_path_here'

# Load the annotation file
annotations = pd.read_csv(ann_file, sep="\t", header=None)
annotations.columns = ['GeneID', 'Chromosome', 'Start', 'End', 'Score']

# Define color mapping for different score ranges
score_colors = {
    (2, 6): "#E63946",  # Red for score between 2 and 6
    (6, 10): "#264653", # Dark blue for score between 6 and 10
    (10, 14): "#2A9D8F", # Green for score between 10 and 14
    (14, 18): "#F4A261", # Orange for score between 14 and 18
    (18, 20): "#457B9D"  # Light blue for score between 18 and 20
}

# Function to map score to color
def get_color(score):
    for (low, high), color in score_colors.items():
        if low <= score < high:
            return color
    return "pink"  # Default color if out of range

# Chromosome data (chromosome number and length)
chromosomes = {
    "1": 6854980,
    "2": 5577357,
    "3": 5634991,
    "4": 5212762,
    "5": 4914260,
    "6": 4589937,
    "7": 4347182,
    "8": 3984410,
    "9": 3304701,
    "10": 2896840,
    "11": 2337134,
    "12": 2233407,
    "13": 1751499,
    "14": 1838362,
    "15": 2434640
}

highlighted_chromosomes = {"3", "6", "14", "15"}

# Define specific regions to highlight within chromosomes 1 and 2
highlighted_regions = {
    "1": [(5850000, 6854980)],
    "2": [(4500000, 5577357)]
}

# Create a figure and axis
fig, ax = plt.subplots(figsize=(12, 10))
scaling_factor = 1e6  # Scaling factor for plotting

y_pos = 0  # Position on the y-axis to start plotting

# Loop through each chromosome and plot it
for chrom, length in chromosomes.items():
    # Choose color based on whether the chromosome is highlighted
    color = "#3D65A5" if chrom in highlighted_chromosomes else "#cce6ff"
    
    # Plot chromosome rectangle
    rect = patches.Rectangle((0, y_pos), length / scaling_factor, 1, edgecolor="black", facecolor=color)
    ax.add_patch(rect)
    ax.text(-0.5, y_pos + 0.5, f"Chr {chrom}", verticalalignment='center', fontsize=10)
    
    # Highlight specific regions if defined
    if chrom in highlighted_regions:
        for start, end in highlighted_regions[chrom]:
            region_rect = patches.Rectangle((start / scaling_factor, y_pos), (end - start) / scaling_factor, 1, 
                                            edgecolor="black", facecolor="#3D65A5")
            ax.add_patch(region_rect)
    
    # Plot gene annotations with custom colors
    chr_annotations = annotations[annotations['Chromosome'] == int(chrom)]
    for _, row in chr_annotations.iterrows():
        start = row['Start'] / scaling_factor
        end = row['End'] / scaling_factor
        score = row['Score']
        color = get_color(score)
        
        # Plot annotation rectangle
        ann_rect = patches.Rectangle((start, y_pos - 0), (0.04), 1, facecolor=color, alpha=1)
        ax.add_patch(ann_rect)
    
    y_pos += 2  # Move to the next y position for the next chromosome

# Create a legend for the color mapping
legend_patches = [patches.Patch(color=color, label=f"{low}-{high}") for (low, high), color in score_colors.items()]
ax.legend(handles=legend_patches, title="Expression Score Ranges", loc="lower right")

# Adjust the axis limits and labels
ax.set_xlim(-1, max(chromosomes.values()) / scaling_factor + 1)
ax.set_ylim(-1, y_pos)
ax.set_xlabel("Mbp")
ax.set_ylabel("Chromosomes")
plt.gca().invert_yaxis()  # Flip the y-axis to have Chr 1 on top

# Adjust layout and show plot
plt.tight_layout()
plt.show()
