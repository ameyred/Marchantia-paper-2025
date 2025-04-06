# FUNGAL BIOMASS QUANTIFICATION ANALYSIS
# --------------------------------------

# Load required libraries
library(ggplot2)   # For plotting graphs
library(dplyr)     # For data wrangling
library(readr)     # For reading CSV files
library(ggpubr)    # For adding statistical comparisons (like ANOVA)

# IMPORT AND PREPARE DATA
# -----------------------

# Read fungal biomass data from CSV file
data <- read_csv("~/Amey_Lab/Marchantia/Fungal_Biomass/To_Plot.csv")

# Rename columns to standard names
colnames(data) <- c("Sample", "Expression")

# DATA PROCESSING
# ---------------

# Extract 'Group' info by removing replicate identifiers (like ' B1', ' B2', etc.)
data <- data %>%
  mutate(Group = gsub(" B[0-9]+", "", Sample))

# Convert Group into a factor to maintain original order in plots
data$Group <- factor(data$Group, levels = unique(data$Group))

# Calculate group-wise summary stats (mean and standard deviation)
summary_data <- data %>%
  group_by(Group) %>%
  summarise(
    Mean = mean(Expression),
    SD = sd(Expression)
  )

# VISUALIZATION
# -------------

ggplot() +
  # Mean bar for each group
  geom_bar(data = summary_data, 
           aes(x = Group, y = Mean), 
           stat = "identity",
           fill = "#5DA899",     # Teal shade
           color = "black",      # Outline color
           width = 0.6) +        # Thickness of bars
  
  # Error bars (mean ± SD)
  geom_errorbar(data = summary_data, 
                aes(x = Group, ymin = Mean - SD, ymax = Mean + SD),
                width = 0.2,
                color = "black") +
  
  # Raw expression values as points
  geom_point(data = data, 
             aes(x = Group, y = Expression), 
             size = 2,
             alpha = 0.6,         # Slight transparency for clarity
             color = "black") +
  
  # Add overall ANOVA p-value
  stat_compare_means(method = "anova", label = "p.signif") +
  
  # Set theme and axis labels
  theme_minimal(base_size = 18) +
  labs(title = "Fungal Biomass Quantification at 3DPI",
       x = "Sample",
       y = "Relative Fungal Biomass") +
  
  # Customize plot aesthetics
  theme(
    panel.background = element_rect(fill = "white", color = NA),
    plot.background = element_rect(fill = "white", color = NA),
    axis.text = element_text(color = "black", size = 18),
    axis.title = element_text(color = "black", size = 20, face = "bold"),
    axis.line = element_line(color = "black", size = 1.5),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position = "none"
  )

# ENHANCEMENT OPTIONS (uncomment to use):
# --------------------------------------

# 1. Save the plot as PNG
# ggsave("Fungal_Biomass_3DPI.png", width = 10, height = 6, dpi = 300)

# 2. Run pairwise t-tests with significance annotations
# stat_compare_means(comparisons = list(c("Group1", "Group2"), c("Group1", "Group3")),
#                    method = "t.test", label = "p.signif")

# 3. Custom fill colors for bars
# scale_fill_manual(values = c("#5DA899", "#C26A77", "#DCCD7D"))
