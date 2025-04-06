# VENN DIAGRAM VISUALIZATION FOR UP/DOWN REGULATED GENES
# -----------------------------------------------------

import matplotlib.pyplot as plt
from matplotlib_venn import venn2
from matplotlib import rcParams

# GLOBAL SETTINGS
# ---------------
# Set default font to Arial for all text
rcParams['font.family'] = 'Arial'

# =============================================
# UP-REGULATED GENES COMPARISON
# =============================================

# Define set sizes for up-regulated genes
# Calculation: Total - Overlap
up_set1 = 894    # 2139 (Tomato total) - 1245 (Overlap)
up_set2 = 1712   # 2957 (Marchantia total) - 1245 (Overlap)
up_overlap = 1245

# Create Venn diagram
up_venn = venn2(subsets=(up_set1, up_set2, up_overlap), 
               set_labels=('Tomato', 'Marchantia'))

# Customize colors with transparency
up_venn.get_patch_by_id('10').set_color('#C26A77')  # Tomato-only (reddish)
up_venn.get_patch_by_id('01').set_color('#5DA899')  # Marchantia-only (teal)
for patch in up_venn.patches:
    if patch is not None:
        patch.set_alpha(0.6)  # 60% opacity

# Format set labels
for label in up_venn.set_labels:
    if label is not None:
        label.set_fontsize(24)  # Larger font for set names
        label.set_fontfamily('Arial')

# Display the plot
plt.title("Up-regulated Genes Comparison", pad=20)
plt.show()

# =============================================
# DOWN-REGULATED GENES COMPARISON
# =============================================

# Define set sizes for down-regulated genes
# Calculation: Total - Overlap
down_set1 = 460    # 1040 (Tomato total) - 580 (Overlap)
down_set2 = 1184   # 1764 (Marchantia total) - 580 (Overlap)
down_overlap = 580

# Create Venn diagram
down_venn = venn2(subsets=(down_set1, down_set2, down_overlap), 
                 set_labels=('Tomato', 'Marchantia'))

# Customize colors with transparency
down_venn.get_patch_by_id('10').set_color('#C26A77')  # Tomato-only
down_venn.get_patch_by_id('01').set_color('#5DA899')  # Marchantia-only
for patch in down_venn.patches:
    if patch is not None:
        patch.set_alpha(0.6)  # Consistent transparency

# Format set labels
for label in down_venn.set_labels:
    if label is not None:
        label.set_fontsize(24)
        label.set_fontfamily('Arial')

# Display the plot
plt.title("Down-regulated Genes Comparison", pad=20)
plt.show()

# ENHANCEMENT OPTIONS (uncomment to use):
# --------------------------------------
# 1. To save figures:
# plt.savefig('Upregulated_Venn.png', dpi=300, bbox_inches='tight')
# plt.savefig('Downregulated_Venn.png', dpi=300, bbox_inches='tight')
#
# 2. To adjust circle sizes proportionally:
# from matplotlib_venn import venn2_circles
# venn2_circles(subsets=(set1, set2, overlap), linestyle='dashed')
#
# 3. To add percentage labels:
# for text in venn.set_labels + venn.subset_labels:
#     text.set_fontsize(12)