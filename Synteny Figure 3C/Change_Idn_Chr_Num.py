# This script was written on 16th October 2024 with the intention of replacing chromosome identifiers in a GFF file with chromosome numbers to help with synteny analysis in the Marchantia paper.


#For Fol4287
# Load the mapping
chromosome_map = {}
with open('/media/atharv/data/Marchantia/Synteny_Analysis/Genomes/Fol4287_Chr_Idn.txt', 'r') as map_file:
    for line in map_file:
        line = line.strip()  # Remove leading/trailing whitespace
        if line:  # Check if the line is not empty
            parts = line.split('\t')  # Split by tab
            if len(parts) == 2:  # Ensure there are exactly two parts
                chromosome_number, identifier = parts  # Unpack correctly
                chromosome_map[identifier.strip()] = chromosome_number.strip()  # Strip any extra spaces
            else:
                print(f"Skipping invalid line: {line}")  # Print out any problematic lines

# Read GFF file and replace identifiers with chromosome numbers
with open('/media/atharv/data/Marchantia/Synteny_Analysis/Genomes/Fol4287_Genomic.gff', 'r') as gff_file, \
     open('/media/atharv/data/Marchantia/Synteny_Analysis/Genomes/Fol4287_Genomic_Updated.gff', 'w') as output_file:
    
    for line in gff_file:
        if line.startswith('#'):
            output_file.write(line)  # Write header lines as is
        else:
            columns = line.strip().split('\t')
            identifier = columns[0].strip()  # Ensure no extra spaces
            print(f"Processing identifier: {identifier}")  # For debugging
            if identifier in chromosome_map:
                print(f"Replacing {identifier} with {chromosome_map[identifier]}")  # Debugging output
                columns[0] = chromosome_map[identifier]  # Replace identifier with chromosome number
                output_file.write('\t'.join(columns) + '\n')
            else:
                print(f"No replacement for {identifier}")  # Debugging output




#For Fo47
#Load the mapping
chromosome_map = {}
with open('/media/atharv/data/Marchantia/Synteny_Analysis/Genomes/Fo47_Chr_Idn.txt', 'r') as map_file:
    for line in map_file:
        line = line.strip()  # Remove leading/trailing whitespace
        if line:  # Check if the line is not empty
            parts = line.split('\t')  # Split by tab
            if len(parts) == 2:  # Ensure there are exactly two parts
                chromosome_number, identifier = parts  # Unpack correctly
                chromosome_map[identifier.strip()] = chromosome_number.strip()  # Strip any extra spaces
            else:
                print(f"Skipping invalid line: {line}")  # Print out any problematic lines

# Read GFF file and replace identifiers with chromosome numbers
with open('/media/atharv/data/Marchantia/Synteny_Analysis/Genomes/Fo47_Genomic.gff', 'r') as gff_file, \
     open('/media/atharv/data/Marchantia/Synteny_Analysis/Genomes/Fo47_Genomic_Updated.gff', 'w') as output_file:
    
    for line in gff_file:
        if line.startswith('#'):
            output_file.write(line)  # Write header lines as is
        else:
            columns = line.strip().split('\t')
            identifier = columns[0].strip()  # Ensure no extra spaces
            print(f"Processing identifier: {identifier}")  # For debugging
            if identifier in chromosome_map:
                print(f"Replacing {identifier} with {chromosome_map[identifier]}")  # Debugging output
                columns[0] = chromosome_map[identifier]  # Replace identifier with chromosome number
                output_file.write('\t'.join(columns) + '\n')
            else:
                print(f"No replacement for {identifier}")  # Debugging output
