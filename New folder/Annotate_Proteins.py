import pandas as pd

# Specify paths to input files
gff_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_Genomic_Updated.gff"
output_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_Protein_Ann.csv"

# Step 1: Parse GFF file to extract relevant data
gff_data = []
with open(gff_file, 'r') as file:
    for line in file:
        if not line.startswith("#"):  # Skip comment lines
            parts = line.strip().split('\t')
            if len(parts) >= 9:
                seq_id = parts[0]  # Chromosome or scaffold
                feature_type = parts[2]  # e.g., gene, mRNA, CDS
                start = parts[3]
                end = parts[4]
                strand = parts[6]
                attributes = parts[8]

                # Extract protein ID or parent ID from attributes
                protein_id = None
                if "protein_id=" in attributes:
                    protein_id = attributes.split("protein_id=")[1].split(";")[0]
                elif "ID=" in attributes:
                    protein_id = attributes.split("ID=")[1].split(";")[0]

                # Append to data only if we have a protein ID that starts with "XP" and feature is CDS or mRNA
                if protein_id and protein_id.startswith("XP") and feature_type in ['CDS', 'mRNA']:
                    gff_data.append([protein_id, seq_id, start, end, strand])

# Create a DataFrame from GFF data
gff_df = pd.DataFrame(gff_data, columns=["protein_id", "chromosome", "start", "end", "strand"])

# Step 2: Save the data as a CSV file
gff_df.to_csv(output_file, index=False)

print(f"Annotation file created: {output_file}")


# Specify paths to input files
gff_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/FoL4287_Genomic_Updated.gff"
output_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo4287_Protein_Ann.csv"

# Step 1: Parse GFF file to extract relevant data
gff_data = []
with open(gff_file, 'r') as file:
    for line in file:
        if not line.startswith("#"):  # Skip comment lines
            parts = line.strip().split('\t')
            if len(parts) >= 9:
                seq_id = parts[0]  # Chromosome or scaffold
                feature_type = parts[2]  # e.g., gene, mRNA, CDS
                start = parts[3]
                end = parts[4]
                strand = parts[6]
                attributes = parts[8]

                # Extract protein ID or parent ID from attributes
                protein_id = None
                if "protein_id=" in attributes:
                    protein_id = attributes.split("protein_id=")[1].split(";")[0]
                elif "ID=" in attributes:
                    protein_id = attributes.split("ID=")[1].split(";")[0]

                # Append to data only if we have a protein ID that starts with "XP" and feature is CDS or mRNA
                if protein_id and protein_id.startswith("XP") and feature_type in ['CDS', 'mRNA']:
                    gff_data.append([protein_id, seq_id, start, end, strand])

# Create a DataFrame from GFF data
gff_df = pd.DataFrame(gff_data, columns=["protein_id", "chromosome", "start", "end", "strand"])

# Step 2: Save the data as a CSV file
gff_df.to_csv(output_file, index=False)

print(f"Annotation file created: {output_file}")
