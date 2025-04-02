# FUNGAL BIOMASS QUANTIFICATION ANALYSIS
# --------------------------------------

# Load required libraries
library(ggplot2)  # For data visualization
library(dplyr)    # For data manipulation
library(readr)    # For reading CSV files
library(ggpubr)   # For statistical annotations

# IMPORT AND PREPARE DATA
# -----------------------
# Read the CSV file containing fungal biomass data
data <- read_csv("~/Amey_Lab/Marchantia/Fungal_Biomass/To_Plot.csv")

# Ensure consistent column names
colnames(data) <- c("Sample", "Expression")

# DATA PROCESSING
# ---------------
# Extract sample groups by removing biological replicate identifiers (e.g., " B1")
data <- data %>%
  mutate(Group = gsub(" B[0-9]+", "", Sample))

# Convert Group to factor with original order (maintains plotting order)
data$Group <- factor(data$Group, levels = unique(data$Group))  

# Calculate summary statistics (mean and standard deviation)
summary_data <- data %>%
  group_by(Group) %>%
  summarise(
    Mean = mean(Expression),  # Calculate group mean
    SD = sd(Expression)       # Calculate standard deviation
  )

# VISUALIZATION
# -------------
ggplot() +
  # Add bars showing mean values
  geom_bar(data = summary_data, 
           aes(x = Group, y = Mean), 
           stat = "identity", 
           fill = "#5DA899",      # Teal fill color
           color = "black",        # Black outline
           width = 0.6) +         # Bar width
  
  # Add error bars (mean ± SD)
  geom_errorbar(data = summary_data, 
                aes(x = Group, ymin = Mean - SD, ymax = Mean + SD), 
                width = 0.2,       # Error bar width
                color = "black") + # Black error bars
  
  # Add individual data points
  geom_point(data = data, 
             aes(x = Group, y = Expression), 
             size = 2,            # Point size
             alpha = 0.6,         # Slight transparency
             color = "black") +   # Black points
  
  # Add ANOVA significance annotation
  stat_compare_means(method = "anova", label = "p.signif") +
  
  # Apply minimal theme with customizations
  theme_minimal(base_size = 18) +  
  labs(title = "Fungal Biomass Quantification at 3DPI",
       x = "Sample",
       y = "Relative Fungal Biomass") +
  
  # Theme customizations
  theme(
    panel.background = element_rect(fill = "white", color = NA),  
    plot.background = element_rect(fill = "white", color = NA),  
    axis.text = element_text(color = "black", size = 18), 
    axis.title = element_text(color = "black", size = 20, face = "bold"), 
    axis.line = element_line(color = "black", size = 1.5),  
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),  
    legend.position = "none"  # No legend needed
  )

# ENHANCEMENT OPTIONS (uncomment to use):
# --------------------------------------
# 1. To save the plot:
# ggsave("Fungal_Biomass_3DPI.png", width = 10, height = 6, dpi = 300)
#
# 2. For pairwise comparisons:
# stat_compare_means(comparisons = list(c("Group1", "Group2"), c("Group1", "Group3")),
#                    method = "t.test", label = "p.signif")
#
# 3. To change color scheme:
# scale_fill_manual(values = c("#5DA899", "#C26A77", "#DCCD7D"))