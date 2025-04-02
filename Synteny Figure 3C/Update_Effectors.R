
#Add genomic locations of effectors to eventually use in synteny circle. 
#Fo47
# Load necessary libraries
library(dplyr)
library(stringr)

# Define file paths
effector_file_path <- "~/Amey_Lab/Marchantia/Effector_List/Fo47_Effectors.csv"
gff_file_path <- "~/Amey_Lab/Marchantia/Synteny_Raw_Files/Fo47_Genomic_Updated.gff"
output_file_path <- "~/Amey_Lab/Marchantia/Effector_List/Fo47_Effectors_Updated.csv"

# Read in the effector data and GFF file
effector_data <- read.csv(effector_file_path, header = TRUE)
gff <- read.delim(gff_file_path, header = FALSE, comment.char = "#")

# Filter for gene entries and extract relevant columns
gff_genes <- gff[gff[, 3] == "gene", ]
colnames(gff_genes) <- c("Chromosome", "Source", "Type", "Start", "End", "Score", "Strand", "Phase", "Attributes")

gff_genes <- gff_genes %>%
  mutate(Locus_Tag = str_extract(Attributes, "locus_tag=([^;]+)")) %>%
  mutate(Locus_Tag = str_replace(Locus_Tag, "locus_tag=", "")) %>%
  select(Chromosome, Start, End, Locus_Tag)

# Merge effector data with genomic coordinates
updated_effector_data <- left_join(effector_data, gff_genes, by = "Locus_Tag")

# Write the updated effector data to a new CSV file
write.csv(updated_effector_data, output_file_path, row.names = FALSE)

# Print completion message
cat("Effector file has been successfully updated with genomic coordinates.")




#Fol4287
# Load necessary libraries
library(dplyr)
library(stringr)

# Define file paths
effector_file_path <- "~/Amey_Lab/Marchantia/Effector_List/Fol4287_Effectors.csv"
gff_file_path <- "~/Amey_Lab/Marchantia/Synteny_Raw_Files/Fol4287_Genomic_Updated.gff"
output_file_path <- "~/Amey_Lab/Marchantia/Effector_List/Fol4287_Effectors_Updated.csv"

# Read in the effector data and GFF file
effector_data <- read.csv(effector_file_path, header = TRUE)
gff <- read.delim(gff_file_path, header = FALSE, comment.char = "#")

# Filter for gene entries and extract relevant columns
gff_genes <- gff[gff[, 3] == "gene", ]
colnames(gff_genes) <- c("Chromosome", "Source", "Type", "Start", "End", "Score", "Strand", "Phase", "Attributes")

gff_genes <- gff_genes %>%
  mutate(Locus_Tag = str_extract(Attributes, "locus_tag=([^;]+)")) %>%
  mutate(Locus_Tag = str_replace(Locus_Tag, "locus_tag=", "")) %>%
  select(Chromosome, Start, End, Locus_Tag)

# Merge effector data with genomic coordinates
updated_effector_data <- left_join(effector_data, gff_genes, by = "Locus_Tag")

# Write the updated effector data to a new CSV file
write.csv(updated_effector_data, output_file_path, row.names = FALSE)

# Print completion message
cat("Effector file has been successfully updated with genomic coordinates.")

