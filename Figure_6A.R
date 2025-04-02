# GENE EXPRESSION ANALYSIS: FOL4287 vs FO47 AT 2DPI AND 3DPI
# ---------------------------------------------------------

# Load required libraries
library(ggplot2)  # For data visualization
library(dplyr)    # For data manipulation
library(tidyr)    # For data reshaping

# =============================================
# 2 DAYS POST INOCULATION (2DPI) ANALYSIS
# =============================================

# Load 2DPI data
data <- read.csv("~/Amey_Lab/Marchantia/2DPI_Mar_Defense.csv")

# Rename first column to avoid conflicts
colnames(data)[1] <- "Condition"

# Convert to long format for analysis
data_long <- data %>%
  pivot_longer(cols = c(Fol4287, Fo47), 
               names_to = "Gene", 
               values_to = "Value")

# Calculate max y-value for annotation placement
y_max_value <- max(data_long$Value)

# Perform Mann-Whitney U Test for each condition
stats_pvalues <- data_long %>%
  group_by(Condition) %>%
  summarise(
    p_value = wilcox.test(Value ~ Gene, exact = FALSE)$p.value,
    .groups = "drop"
  ) %>%
  mutate(
    # Create significance labels
    Significance = case_when(
      p_value < 0.001 ~ "***",
      p_value < 0.01  ~ "**",
      p_value < 0.05  ~ "*",
      TRUE            ~ "NS"
    ),
    # Format annotation text
    Annotation = paste0(Significance, " ", "(p = ", format(p_value, digits = 3), ")"),
    # Position annotations above plots
    y_position = y_max_value + 1
  )

# Create the box plot
ggplot(data_long, aes(x = Condition, y = Value, fill = Gene)) +
  # Visual elements
  geom_boxplot(position = position_dodge(width = 0.8), alpha = 1, color = "black") +
  geom_point(position = position_dodge(width = 0.8), size = 2, color = "black") +
  geom_text(data = stats_pvalues, aes(x = Condition, y = y_position, label = Annotation),
            inherit.aes = FALSE, color = "black", size = 4) +
  
  # Custom scales
  scale_y_continuous(limits = c(min(data_long$Value) - 1, y_max_value + 2)) +
  scale_fill_manual(values = c("Fol4287" = "#C26A77", "Fo47" = "#94CBEC")) +
  
  # Labels and titles
  labs(title = "Gene Expression with IQR and Mann-Whitney U Test Results at 2DPI",
       x = "Gene", y = "log2 Fold Change", fill = "Gene") +
  
  # Theme customization
  theme_minimal() +
  theme(
    legend.position = "top",
    panel.grid = element_blank(),
    axis.line = element_line(color = "black"),
    axis.text = element_text(size = 14, face = "bold"),
    axis.title = element_text(size = 16, face = "bold")
  )

# =============================================
# 3 DAYS POST INOCULATION (3DPI) ANALYSIS
# =============================================

# Load 3DPI data (same structure as 2DPI)
data <- read.csv("~/Amey_Lab/Marchantia/3DPI_Mar_Defense.csv")

# [Same processing steps as above, just changing the title]

# Create the box plot for 3DPI
ggplot(data_long, aes(x = Condition, y = Value, fill = Gene)) +
  # [Same visualization code as above]
  labs(title = "Gene Expression with IQR and Mann-Whitney U Test Results at 3DPI",
       x = "Gene", y = "log2 Fold Change", fill = "Gene") +
  # [Same theme and scaling code]