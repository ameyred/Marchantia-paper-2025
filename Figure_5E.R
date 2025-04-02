# CIRCLE PACKING VISUALIZATION OF ENRICHED INTERPRO TERMS (ERC3 CONDITION)
# -----------------------------------------------------------------------

# Load required libraries
library(packcircles)  # For circle packing algorithm
library(ggplot2)      # For data visualization
library(stringr)      # For string manipulation (text wrapping)
library(viridis)      # For color scales

# Import Data
# TSV file containing enriched InterPro terms from down-regulated genes in ERC3 condition
data <- read.csv("~/Amey_Lab/Marchantia/Interpro_Term_Enrichment/Down_Regulated/erc3/utput.FUNC-E.enriched_terms_nr.tsv", 
                 sep = "\t") 

# DATA PREPARATION
# ----------------
# Transform p-values for better visualization (-log10 scale)
data$P_value_transformed <- -log10(data$Fishers.p.value)

# CIRCLE PACKING LAYOUT
# ---------------------
# Calculate circle positions using progressive layout algorithm
# Note: There appears to be a typo in 'Count.In.Module' (written as 'Count.In.Module')
packing <- circleProgressiveLayout(data$Count.In.Module, sizetype = "area")

# Combine original data with calculated circle positions
data <- cbind(data, packing)

# Adjust circle spacing by scaling coordinates
scaling_factor <- 10  # Increase to spread circles further apart
data$x <- data$x * scaling_factor
data$y <- data$y * scaling_factor

# Generate polygon coordinates for circle edges (100 points per circle)
circle_data <- circleLayoutVertices(packing, npoints = 100)
circle_data$x <- circle_data$x * scaling_factor
circle_data$y <- circle_data$y * scaling_factor

# LABEL PREPARATION
# ----------------
# Dynamic text sizing based on circle radius
data$TextSize <- (data$radius / max(data$radius)) * 6 

# Create labels combining term name and gene count
data$Label <- paste(data$Name, "\n(", data$Count.In.Module, ")", sep = "")

# Wrap long labels to fit within circles (5 characters per line)
data$Label <- str_wrap(data$Label, width = 5)

# PLOT CONSTRUCTION
# ----------------
ggplot() +
  # Draw the circles as polygons with viridis color scale
  geom_polygon(
    data = circle_data, 
    aes(x = x, y = y, group = id, fill = data$P_value_transformed[id]), 
    color = "black",   # Circle border color
    alpha = 0.8        # Slight transparency
  ) +
  
  # Add text labels at circle centers
  geom_text(
    data = data, 
    aes(x = x, y = y, label = Label), 
    size = 3.5,        # Base text size
    color = "black",    # Text color
    lineheight = 0.8    # Line spacing
  ) +
  
  # Apply viridis color scale to p-values
  scale_fill_viridis(
    name = "-log10(p-value)", 
    option = "viridis"  # Color palette variant
  ) + 
  
  # Add size legend for circle scaling
  scale_size_continuous(
    name = "Circle Size (Gene Count)",
    range = c(2, 15),   # Legend symbol size range
    breaks = seq(min(data$radius), max(data$radius), length.out = 4)
  ) +
  
  # Theme customization
  theme_void() +       # Clean background with no axes
  theme(legend.position = "right") +  # Legend placement
  
  # Ensure perfect circle aspect ratio
  coord_fixed() +
  
  # Plot title
  labs(title = "Enriched InterPro Categories (ERC3 Condition)", fill = "-log10(p-value)")