# Import necessary libraries
import matplotlib.pyplot as plt  # For visualization
from matplotlib_venn import venn2  # For creating Venn diagrams
from matplotlib import rcParams  # For customizing fonts

# ==========================================
# UP-REGULATED GENES VENN DIAGRAM
# ==========================================

# Set the font to Arial
rcParams['font.family'] = 'Arial'

# Define the sizes of the sets and their overlap
set1 = 91  # Number of up-regulated genes in WT Fol4287
set2 = 123  # Number of up-regulated genes in erc3
overlap_12 = 155  # Number of genes shared between both conditions

# Create the Venn diagram with custom set names
venn = venn2(subsets=(set1, set2, overlap_12), set_labels=('WT Fol4287', 'erc3'))

# Customize the colors for individual sets
venn.get_patch_by_id('10').set_color('#C26A77')  # Color for Set 1 (WT Fol4287)
venn.get_patch_by_id('01').set_color('#5DA899')  # Color for Set 2 (erc3)

# Adjust transparency (alpha value) for better visualization
for patch in venn.patches:
    if patch is not None:
        patch.set_alpha(0.6)  # Set transparency to 60%

# Customize font properties for set labels
for label in venn.set_labels:
    if label is not None:  # Ensure the label exists before modifying
        label.set_fontsize(24)  # Increase font size for better visibility
        label.set_fontfamily('Arial')  # Set font family to Arial

# Customize font properties for intersection labels
for label in venn.subset_labels:
    if label is not None:
        label.set_fontsize(12)  # Set font size for intersection numbers
        label.set_fontfamily('Arial')  # Set font family to Arial

# Display the Venn diagram
plt.title("Up-Regulated Genes")
plt.show()


# ==========================================
# DOWN-REGULATED GENES VENN DIAGRAM
# ==========================================

# Set the font to Arial
rcParams['font.family'] = 'Arial'

# Define the sizes of the sets and their overlap
set1 = 139  # Number of down-regulated genes in WT Fol4287
set2 = 119  # Number of down-regulated genes in erc3
overlap_12 = 63  # Number of genes shared between both conditions

# Create the Venn diagram with custom set names
venn = venn2(subsets=(set1, set2, overlap_12), set_labels=('WT Fol4287', 'erc3'))

# Customize the colors for individual sets
venn.get_patch_by_id('10').set_color('#C26A77')  # Color for Set 1 (WT Fol4287)
venn.get_patch_by_id('01').set_color('#5DA899')  # Color for Set 2 (erc3)

# Adjust transparency (alpha value) for better visualization
for patch in venn.patches:
    if patch is not None:
        patch.set_alpha(0.6)  # Set transparency to 60%

# Customize font properties for set labels
for label in venn.set_labels:
    if label is not None:  # Ensure the label exists before modifying
        label.set_fontsize(24)  # Increase font size for better visibility
        label.set_fontfamily('Arial')  # Set font family to Arial

# Customize font properties for intersection labels
for label in venn.subset_labels:
    if label is not None:
        label.set_fontsize(12)  # Set font size for intersection numbers
        label.set_fontfamily('Arial')  # Set font family to Arial

# Display the Venn diagram
plt.title("Down-Regulated Genes")
plt.show()
