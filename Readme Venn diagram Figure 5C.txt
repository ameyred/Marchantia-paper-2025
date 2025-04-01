
Dependencies
Ensure you have the following Python libraries installed before running the script:
pip install matplotlib matplotlib-venn

Usage
Run the script using Python:
python venn_diagram.py
The script generates two Venn diagrams:
Up-Regulated Genes Venn Diagram: Shows genes significantly up-regulated in both conditions.
Down-Regulated Genes Venn Diagram: Shows genes significantly down-regulated in both conditions.

Code Description
The script uses matplotlib_venn to create two Venn diagrams.
The data is manually set for up-regulated and down-regulated gene counts.
The Venn diagrams display:
Genes unique to WT Fol4287.
Genes unique to erc3.
Genes shared between both conditions.
Custom colors and font settings enhance visualization.

Customization
Modify the set1, set2, and overlap_12 values to update the diagram for different datasets.
Adjust colors in get_patch_by_id() for a personalized color scheme.

Example Output
Two Venn diagrams will be displayed when the script is executed:
Up-Regulated Genes
Down-Regulated Genes
