# Load necessary libraries
library(circlize)
library(dplyr)

# Read in the synteny data
data <- read.csv("~/Amey_Lab/Marchantia/Synteny_Info.csv", header = TRUE)

# Rename columns for simplicity
colnames(data) <- c("Orthogroup", "Protein_ID_Genome1", "Chromosome_Genome1", 
                    "Start_Genome1", "End_Genome1", "Protein_ID_Genome2", 
                    "Chromosome_Genome2", "Start_Genome2", "End_Genome2")

# Combine chromosome information for both genomes
data$Chromosome_Genome1 <- paste0("Genome1_", data$Chromosome_Genome1)
data$Chromosome_Genome2 <- paste0("Genome2_", data$Chromosome_Genome2)

# Read in the GC content and gene density data
gc_content <- read.csv("~/Amey_Lab/Marchantia/Genome/GC_Content_Adjusted.csv", header = TRUE)
gene_density <- read.csv("~/Amey_Lab/Marchantia/Genome/Gene_Density_Adjusted.csv", header = TRUE)
effectors <- read.csv("~/Amey_Lab/Marchantia/Synteny_Raw_Files/Effectors.csv", header = TRUE)
# Rename columns for simplicity
colnames(effectors) <- c("Chromosome", "Locus_Tag", "L2FC", "Start", "End")


# Updated chromosome lengths data
chromosome_lengths <- data.frame(
  UniqueID = c("Genome2_1", "Genome2_2", "Genome2_3", "Genome2_4", "Genome2_5", 
               "Genome2_6", "Genome2_7", "Genome2_8", "Genome2_9", "Genome2_10", 
               "Genome2_11", "Genome2_12", "Genome2_13", "Genome2_14", "Genome2_15",
               "Genome1_1", "Genome1_2", "Genome1_3", "Genome1_4", "Genome1_5", 
               "Genome1_6", "Genome1_7", "Genome1_8", "Genome1_9", "Genome1_10", 
               "Genome1_11", "Genome1_12"),
  Length = c(6854980, 5577357, 5634991, 5212762, 4914260, 
             4589937, 4347182, 3984410, 3304701, 2896840, 
             2337134, 2233407, 1751499, 1838362, 2434640,
             6487135, 5611497, 5151772, 4731052, 4523040, 
             4300638, 4259108, 3716460, 3277645, 2893631, 
             2853886, 2552985)
)

# Prepare the data for Circos plot
chromosome_data <- chromosome_lengths %>%
  mutate(Chromosome = UniqueID, 
         Start = 0, 
         End = Length) %>%
  select(Chromosome, Start, End)

# Set up the Circos plot
circos.clear()  # Clear previous settings
circos.par(gap.degree = 2, track.height = 0.05)  # Set gap between sectors and adjust track height

# Initialize the plot with chromosome lengths
circos.initialize(factors = chromosome_data$Chromosome, 
                  xlim = as.matrix(chromosome_data[, c("Start", "End")]))

# Define colors for each genome's chromosomes
genome1_color <- "#94CBEC"
genome2_color <- "#C26A77"

# Track for chromosome display with customized labels and filled colors
circos.trackPlotRegion(
  factors = chromosome_data$Chromosome,
  ylim = c(0, 5),  # Height of the track
  bg.col = ifelse(grepl("Genome1", chromosome_data$Chromosome), genome1_color, genome2_color),
  panel.fun = function(x, y) {
    sector.index <- get.cell.meta.data("sector.index")
    chrom_num <- sub("Genome1_|Genome2_", "", sector.index)
    circos.text(CELL_META$xcenter, 0.5, chrom_num, facing = "clockwise", 
                niceFacing = TRUE, adj = c(0, 0.5), cex = 0.7)  # Adjust text size with cex
  }
)

# Add GC Content Track (keep it closer to chromosomes)
circos.trackPlotRegion(
  ylim = c(40, 60),  # Range for GC content percentages
  track.height = 0.05,  # Height
  bg.border = NA,  # No border
  panel.fun = function(x, y) {
    sector.index <- get.cell.meta.data("sector.index")
    chr_gc_content <- gc_content[gc_content$Chromosome == sector.index, ]
    circos.lines(chr_gc_content$Start, chr_gc_content$GC_Content, col = "#5DA899", lwd = 2)
  }
)

# Add Gene Density Track (further outside)

circos.trackPlotRegion(
  ylim = c(0, 10),  # Set y-axis limit for gene count
  track.height = 0.08,  # Track height just defines its thickness, not position
  bg.border = NA,  # No border
  panel.fun = function(x, y) {
    sector.index <- get.cell.meta.data("sector.index")
    chr_gene_density <- gene_density[gene_density$Chromosome == sector.index, ]
    circos.rect(chr_gene_density$Start, 0, chr_gene_density$End, chr_gene_density$Gene_Count, 
                col = "#DCCD7D", border = NA)  # No border for the rectangles
  }
)

# Add L2FC (expression) track **with normal spacing**
circos.trackPlotRegion(
  ylim = c(0, 20),  # Set y-axis range explicitly based on the data
  track.height = 0.1,  # Define track height
  bg.border = NA,  # Remove borders for the track
  panel.fun = function(x, y) {
    sector.index <- get.cell.meta.data("sector.index")
    chr_expression <- effectors[effectors$Chromosome == sector.index, ]  # Use effectors instead of expression_data
    if (nrow(chr_expression) > 0) {
      # Adjust bar thickness: Extend the 'End' coordinate to make bars thicker
      adjusted_start <- chr_expression$Start - ((chr_expression$End - chr_expression$Start) * 10)
      adjusted_end <- chr_expression$End + ((chr_expression$End - chr_expression$Start) * 10)
      circos.rect(
        adjusted_start, 0, adjusted_end, chr_expression$L2FC, 
        col = "#7E2954",  
        border = NA  # No border for bars
      )
    }
  }
)


# Add links to represent synteny
chromosome_colors <- rep(RColorBrewer::brewer.pal(12, "Set3"), length.out = length(unique(data$Chromosome_Genome1)))

for (i in 1:nrow(data)) {
  chrom_index <- match(data$Chromosome_Genome1[i], unique(data$Chromosome_Genome1))
  circos.link(data$Chromosome_Genome1[i], c(data$Start_Genome1[i], data$End_Genome1[i]),
              data$Chromosome_Genome2[i], c(data$Start_Genome2[i], data$End_Genome2[i]),
              col = chromosome_colors[chrom_index], lwd = 2)
}

# Clear the plot to finalize
circos.clear()

