# Import necessary libraries
import matplotlib.pyplot as plt  # For visualization
from matplotlib_venn import venn2  # For creating Venn diagrams
from matplotlib import rcParams  # For customizing font properties

# ==========================================
# Up-regulated genes in Fol_Tom vs Fol_Mar
# ==========================================

# Set the font to Arial
rcParams['font.family'] = 'Arial'

# Define the sizes of the sets and their overlap for up-regulated genes
set1 = 894  # Number of up-regulated genes in Tomato (Fol_Tom)
set2 = 1712  # Number of up-regulated genes in Marchantia (Fol_Mar)
overlap_12 = 1245  # Number of genes shared between both conditions (intersection)

# Create the Venn diagram with custom set names
venn = venn2(subsets=(set1, set2, overlap_12), set_labels=('Tomato', 'Marchantia'))

# Customize the colors of the Venn diagram
venn.get_patch_by_id('10').set_color('#C26A77')  # Custom color for Set 1 (Tomato)
venn.get_patch_by_id('01').set_color('#5DA899')  # Custom color for Set 2 (Marchantia)

# Adjust transparency (alpha value) for better visualization
for patch in venn.patches:
    if patch is not None:
        patch.set_alpha(0.6)  # Set transparency to 60%

# Customize the font properties for set labels
for label in venn.set_labels:
    if label is not None:
        label.set_fontsize(24)  # Increase font size for better visibility
        label.set_fontfamily('Arial')  # Set font family to Arial

# Set font properties for intersection labels
for label in venn.set_labels:
    label.set_fontsize(12)  # Set font size for intersection numbers
label.set_fontfamily('Arial')  # Set font family to Arial

# Display the Venn diagram for up-regulated genes
plt.title("Up-Regulated Genes: Tomato vs Marchantia")  # Set title for the plot
plt.show()  # Show the Venn diagram


# ==========================================
# Down-regulated genes in Fol_Tom vs Fol_Mar
# ==========================================

# Set the font to Arial for down-regulated genes
rcParams['font.family'] = 'Arial'

# Define the sizes of the sets and their overlap for down-regulated genes
set1 = 460  # Number of down-regulated genes in Tomato (Fol_Tom)
set2 = 1184  # Number of down-regulated genes in Marchantia (Fol_Mar)
overlap_12 = 580  # Number of genes shared between both conditions (intersection)

# Create the Venn diagram for down-regulated genes with custom set names
venn = venn2(subsets=(set1, set2, overlap_12), set_labels=('Tomato', 'Marchantia'))

# Customize the colors of the Venn diagram for down-regulated genes
venn.get_patch_by_id('10').set_color('#C26A77')  # Custom color for Set 1 (Tomato)
venn.get_patch_by_id('01').set_color('#5DA899')  # Custom color for Set 2 (Marchantia)

# Adjust transparency (alpha value) for better visualization
for patch in venn.patches:
    if patch is not None:
        patch.set_alpha(0.6)  # Set transparency to 60%

# Customize the font properties for set labels
for label in venn.set_labels:
    if label is not None:
        label.set_fontsize(24)  # Increase font size for better visibility
        label.set_fontfamily('Arial')  # Set font family to Arial

# Set font properties for intersection labels
for label in venn.set_labels:
    label.set_fontsize(12)  # Set font size for intersection numbers
label.set_fontfamily('Arial')  # Set font family to Arial

# Display the Venn diagram for down-regulated genes
plt.title("Down-Regulated Genes: Tomato vs Marchantia")  # Set title for the plot
plt.show()  # Show the Venn diagram
