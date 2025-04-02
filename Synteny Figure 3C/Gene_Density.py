import pandas as pd

def load_gene_data(gene_file):
    """Load gene data from a tab-delimited file."""
    return pd.read_csv(gene_file, sep='\t')

def load_fna_lengths(fna_file):
    """Extract chromosome lengths from the fna file."""
    lengths = {}
    with open(fna_file, 'r') as f:
        chrom_id = None
        length = 0
        for line in f:
            line = line.strip()
            if line.startswith(">"):
                if chrom_id is not None:  # Save length of the previous chromosome
                    lengths[chrom_id] = length
                chrom_id = line[1:]  # Extract chromosome ID (removing '>')
                length = 0  # Reset length for the new chromosome
            else:
                length += len(line)  # Increment length by the number of bases in the line
        if chrom_id is not None:  # Save the last chromosome length
            lengths[chrom_id] = length
    return lengths

def count_genes_in_window(genes_df, window_start, window_end):
    """Count how many genes overlap with the current window."""
    overlapping_genes = genes_df[(genes_df['Start'] < window_end) & (genes_df['End'] > window_start)]
    return len(overlapping_genes)

# Load gene data from the tab-delimited file
gene_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fol4287_Gene_Locations.txt"
genes_df = load_gene_data(gene_file)

# Load chromosome lengths from the updated fna file
fna_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fol4287_GCF_000149955.1_ASM14995v2_genomic_updated.fna"
chromosome_lengths = load_fna_lengths(fna_file)

# Define sliding window parameters
window_size = 10000  # 10 kb window
step_size = 10000    # Slide by 10 kb for each window

# Prepare data storage
gene_density_data = []
chromosomes = genes_df['Chromosome_ID'].unique()

# Loop through each chromosome
for chrom in chromosomes:
    chrom_genes_df = genes_df[genes_df['Chromosome_ID'] == chrom]
    
    # Get chromosome length from the fna file
    if str(chrom) in chromosome_lengths:
        chrom_length = chromosome_lengths[str(chrom)]  # Convert chromosome ID to string
    else:
        print(f"Warning: Chromosome {chrom} not found in chromosome lengths.")
        continue

    # Slide through the chromosome in windows of 10 kb
    for start in range(0, chrom_length, step_size):
        end = start + window_size
        if end > chrom_length:
            end = chrom_length  # Ensure the window doesn't exceed chromosome length
        
        # Count genes in the current window
        gene_count = count_genes_in_window(chrom_genes_df, start, end)
        
        # Store results (Chromosome, Start, End, Gene Count)
        gene_density_data.append([chrom, start + 1, end, gene_count])

# Create a DataFrame and save to a file
output_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fol4287_Gene_Density.csv"
gene_density_df = pd.DataFrame(gene_density_data, columns=["Chromosome", "Start", "End", "Gene_Count"])
gene_density_df.to_csv(output_file, index=False)

print(f"Gene density data saved to: {output_file}")




#---------------


#For Fo47
# Load gene data from the tab-delimited file
gene_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_Gene_Locations.txt" 
genes_df = load_gene_data(gene_file)

# Load chromosome lengths from the FASTA file
fna_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_GCF_013085055.1_ASM1308505v1_genomic_updated.fna"
chromosome_lengths = load_fna_lengths(fna_file)


# Define sliding window parameters
window_size = 10000  # 10 kb window
step_size = 10000    # Slide by 10 kb for each window

# Prepare data storage
gene_density_data = []
chromosomes = genes_df['Chromosome_ID'].unique()

# Loop through each chromosome
for chrom in chromosomes:
    chrom_genes_df = genes_df[genes_df['Chromosome_ID'] == chrom]
    
    # Get chromosome length from the fna file
    if str(chrom) in chromosome_lengths:
        chrom_length = chromosome_lengths[str(chrom)]  # Convert chromosome ID to string
    else:
        print(f"Warning: Chromosome {chrom} not found in chromosome lengths.")
        continue

    # Slide through the chromosome in windows of 10 kb
    for start in range(0, chrom_length, step_size):
        end = start + window_size
        if end > chrom_length:
            end = chrom_length  # Ensure the window doesn't exceed chromosome length
        
        # Count genes in the current window
        gene_count = count_genes_in_window(chrom_genes_df, start, end)
        
        # Store results (Chromosome, Start, End, Gene Count)
        gene_density_data.append([chrom, start + 1, end, gene_count])

# Create a DataFrame and save to a file
output_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_Gene_Density.csv"
gene_density_df = pd.DataFrame(gene_density_data, columns=["Chromosome", "Start", "End", "Gene_Count"])
gene_density_df.to_csv(output_file, index=False)

print(f"Gene density data saved to: {output_file}")
