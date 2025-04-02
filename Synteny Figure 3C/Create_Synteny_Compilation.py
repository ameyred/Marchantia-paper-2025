import os
import pandas as pd
from Bio import SeqIO

# File paths
orthogroup_names_file = '/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Orthogroups_SingleCopyOrthologues.txt'
orthogroup_dir = '/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Single_Copy_Orthologue_Sequences'
annotation_file_genome1 = '/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_Protein_Ann.csv'
annotation_file_genome2 = '/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fol4287_Protein_Ann.csv'

# Load annotation files into DataFrames
annotation_df1 = pd.read_csv(annotation_file_genome1)
annotation_df2 = pd.read_csv(annotation_file_genome2)

# Print shape and sample data from annotation files for debugging
print("Annotation DataFrame 1:")
print(annotation_df1.head())
print("Shape:", annotation_df1.shape)

print("Annotation DataFrame 2:")
print(annotation_df2.head())
print("Shape:", annotation_df2.shape)

# Extract necessary columns from annotation files
annotation_df1 = annotation_df1[['protein_id', 'chromosome', 'start', 'end', 'strand']]
annotation_df2 = annotation_df2[['protein_id', 'chromosome', 'start', 'end', 'strand']]

# Load orthogroup names
with open(orthogroup_names_file, 'r') as f:
    orthogroup_names = f.read().splitlines()

# Prepare a list to hold output rows
output_data = []

# Loop through each orthogroup
for og in orthogroup_names:
    fasta_file_path = os.path.join(orthogroup_dir, f"{og}.fa")  # Changed to .fa extension
    
    # Check if the fasta file exists
    if os.path.isfile(fasta_file_path):
        print(f"Processing orthogroup: {og} - found fasta file.")
        
        # Read the sequences from the fasta file
        sequences = SeqIO.to_dict(SeqIO.parse(fasta_file_path, 'fasta'))
        
        # Extract protein IDs from sequences
        protein_ids = list(sequences.keys())
        print(f"Protein IDs found in {og}: {protein_ids}")
        
        # Initialize variables for genome 1
        protein_info_genome1 = None
        
        # Find sequence info for genome 1
        for protein_id in protein_ids:
            if protein_id in annotation_df1['protein_id'].values:
                protein_row = annotation_df1[annotation_df1['protein_id'] == protein_id].iloc[0]
                protein_info_genome1 = {
                    'protein_id': protein_id,
                    'chromosome': protein_row['chromosome'],
                    'start': protein_row['start'],
                    'end': protein_row['end'],
                    'strand': protein_row['strand'],
                    'sequence': str(sequences[protein_id].seq)
                }
                print(f"Genome 1 - Found: {protein_info_genome1}")
                break  # Assuming one protein per orthogroup per genome
            else:
                print(f"Genome 1 - Protein ID {protein_id} not found.")

        # Initialize variables for genome 2
        protein_info_genome2 = None
        
        # Find sequence info for genome 2
        for protein_id in protein_ids:
            if protein_id in annotation_df2['protein_id'].values:
                protein_row = annotation_df2[annotation_df2['protein_id'] == protein_id].iloc[0]
                protein_info_genome2 = {
                    'protein_id': protein_id,
                    'chromosome': protein_row['chromosome'],
                    'start': protein_row['start'],
                    'end': protein_row['end'],
                    'strand': protein_row['strand'],
                    'sequence': str(sequences[protein_id].seq)
                }
                print(f"Genome 2 - Found: {protein_info_genome2}")
                break  # Assuming one protein per orthogroup per genome
            else:
                print(f"Genome 2 - Protein ID {protein_id} not found.")
        
        # Add row to output data if both genome info is present
        if protein_info_genome1 and protein_info_genome2:
            output_data.append({
                'Orthogroup': og,
                'Protein_ID_Genome1': protein_info_genome1['protein_id'],
                'Chromosome_Genome1': protein_info_genome1['chromosome'],
                'Start_Genome1': protein_info_genome1['start'],
                'End_Genome1': protein_info_genome1['end'],
                'Strand_Genome1': protein_info_genome1['strand'],
                'Sequence_Genome1': protein_info_genome1['sequence'],
                'Protein_ID_Genome2': protein_info_genome2['protein_id'],
                'Chromosome_Genome2': protein_info_genome2['chromosome'],
                'Start_Genome2': protein_info_genome2['start'],
                'End_Genome2': protein_info_genome2['end'],
                'Strand_Genome2': protein_info_genome2['strand'],
                'Sequence_Genome2': protein_info_genome2['sequence'],
            })
        else:
            print(f"Skipping {og} - Missing data in one of the genomes.")

# Create a DataFrame from the output data
output_df = pd.DataFrame(output_data)

# Define the output file path
output_file_path = '/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/orthogroup_sequences_output.csv'

# Save the DataFrame to a CSV file
output_df.to_csv(output_file_path, index=False)

if not output_data:
    print("No data found for the output file.")
else:
    print(f"Output file created successfully with {len(output_data)} records!")
