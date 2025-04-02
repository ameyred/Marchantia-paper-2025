This script creates a Circos plot to visualize synteny relationships between two genomes (Genome1 and Genome2), along with additional genomic features including GC content, gene density, and effector protein expression levels (L2FC).

Dependencies
R (version 3.6 or higher recommended)
R packages:
circlize (for circular visualization)
dplyr (for data manipulation)
RColorBrewer (for color palettes)

Input Files
Synteny Information: Synteny_Info.csv
Contains orthologous gene pairs between two genomes with their genomic coordinates
Required columns: Orthogroup, Protein IDs, Chromosomes, Start/End positions for both genomes
GC Content: GC_Content_Adjusted.csv
Contains GC content percentages across genomic windows
Required columns: Chromosome, Start, GC_Content
Gene Density: Gene_Density_Adjusted.csv
Contains gene counts across genomic windows
Required columns: Chromosome, Start, End, Gene_Count
Effector Proteins: Effectors.csv
Contains effector protein information including expression levels (L2FC)
Required columns: Chromosome, Locus_Tag, L2FC, Start, End

Script Structure
1. Data Preparation
Loads and renames columns for all input files
Combines chromosome information with genome identifiers
Defines chromosome lengths for both genomes

2. Circos Plot Initialization
Clears previous Circos settings
Sets up basic parameters (gaps between sectors, track heights)
Initializes the plot with chromosome lengths

3. Tracks Visualization
Chromosome Track:
Displays chromosomes as sectors with genome-specific colors
Genome1 (blue-ish): #94CBEC
Genome2 (red-ish): #C26A77
GC Content Track:
Line plot showing GC content variation (40-60% range)
Color: #5DA899 (teal-green)
Gene Density Track:
Bar plot showing gene counts per window
Color: #DCCD7D (golden)
L2FC Expression Track:
Bar plot showing log2 fold change of effector proteins
Color: #7E2954 (purple-red)
Note: Bars are artificially widened for better visibility

4. Synteny Links
Draws connections between orthologous genes
Uses colors from RColorBrewer's "Set3" palette (12 colors cycling as needed)
Customization Options
Colors:
Modify the genome1_color and genome2_color variables to change chromosome colors
Adjust track colors by changing the hex codes in each track's plotting function
Track Parameters:
track.height: Adjust the relative thickness of each track
ylim: Change the y-axis ranges for quantitative tracks
Text Size:
Modify the cex parameter in circos.text() to adjust chromosome label sizes

Output
The script generates a circular plot showing:
Chromosomes of both genomes as outer sectors
Three data tracks inside each chromosome
Curved links connecting syntenic regions between genomes
Notes
Ensure all input files are in the correct format and paths are properly specified
The script handles chromosomes of different lengths automatically
For large datasets, rendering may take several seconds
