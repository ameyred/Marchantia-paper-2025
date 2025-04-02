from Bio import SeqIO
import pandas as pd

def gc_content(sequence):
    """Calculate GC content of a DNA sequence."""
    g = sequence.count("G")
    c = sequence.count("C")
    gc_count = g + c
    return (gc_count / len(sequence)) * 100 if len(sequence) > 0 else 0

# Step 1: Parse the chromosomes.fna file to get sequences
#Fol4287
fna_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fol4287_GCF_000149955.1_ASM14995v2_genomic_updated.fna"
window_size = 10000  # 10 kb sliding window
step_size = 10000    # Slide by 10 kb for each window

gc_data = []

for record in SeqIO.parse(fna_file, "fasta"):
    chromosome = record.id
    seq = record.seq.upper()  # Convert sequence to uppercase for consistency
    seq_length = len(seq)
    
    # Step 2: Slide through the chromosome in windows of 10 kb
    for start in range(0, seq_length, step_size):
        end = start + window_size
        if end > seq_length:
            end = seq_length  # Ensure we don't go beyond the sequence length
        window_seq = seq[start:end]
        
        # Step 3: Calculate GC content for this window
        gc_percent = gc_content(window_seq)
        
        # Store results (Chromosome, Start, End, GC Content)
        gc_data.append([chromosome, start + 1, end, gc_percent])

# Step 4: Create a DataFrame and save to the specified output file
gc_df = pd.DataFrame(gc_data, columns=["Chromosome", "Start", "End", "GC_Content(%)"])
output_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fol4287_GC_Content.csv"
gc_df.to_csv(output_file, index=False)

print(f"GC content data saved to: {output_file}")


#Fo47

# Step 1: Parse the chromosomes.fna file to get sequences
fna_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_GCF_013085055.1_ASM1308505v1_genomic_updated.fna"
window_size = 10000  # 10 kb sliding window
step_size = 10000    # Slide by 10 kb for each window

gc_data = []

for record in SeqIO.parse(fna_file, "fasta"):
    chromosome = record.id
    seq = record.seq.upper()  # Convert sequence to uppercase for consistency
    seq_length = len(seq)
    
    # Step 2: Slide through the chromosome in windows of 10 kb
    for start in range(0, seq_length, step_size):
        end = start + window_size
        if end > seq_length:
            end = seq_length  # Ensure we don't go beyond the sequence length
        window_seq = seq[start:end]
        
        # Step 3: Calculate GC content for this window
        gc_percent = gc_content(window_seq)
        
        # Store results (Chromosome, Start, End, GC Content)
        gc_data.append([chromosome, start + 1, end, gc_percent])

# Step 4: Create a DataFrame and save to the specified output file
gc_df = pd.DataFrame(gc_data, columns=["Chromosome", "Start", "End", "GC_Content(%)"])
output_file = "/Users/vidhasrivastava/Amey_Lab/Marchantia/Genome/Fo47_GC_Content.csv"
gc_df.to_csv(output_file, index=False)

print(f"GC content data saved to: {output_file}")
