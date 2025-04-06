# ----------------------------------------------
# GENE EXPRESSION ACROSS TIME POINTS - E4 GENE
# ----------------------------------------------

# Load required libraries
library(dplyr)      # For data wrangling
library(ggplot2)    # For plotting

# LOAD DATA
# ---------
# Read gene expression CSV file
gene_expression <- read.csv("~/Amey_Lab/Marchantia/Effector_Expression/E4.csv")

# EXTRACT TIME POINT INFORMATION
# ------------------------------
# Assumes 'Sample' column contains strings like "1DPI B1", "2DPI B2", etc.
gene_expression$TimePoint <- as.numeric(gsub("DPI.*", "", gene_expression$Sample))

# Convert TimePoint to a factor to maintain plot order
gene_expression$TimePoint <- factor(gene_expression$TimePoint, levels = c("1", "2", "3"))

# CALCULATE SUMMARY STATISTICS
# ----------------------------
# Mean and standard deviation for each time point
summary_stats <- gene_expression %>%
  group_by(TimePoint) %>%
  summarise(
    Mean = mean(Expression_E4, na.rm = TRUE),
    SD = sd(Expression_E4, na.rm = TRUE)
  )

# PLOTTING
# --------
ggplot() +
  # Bar plot showing mean expression
  geom_bar(data = summary_stats, aes(x = TimePoint, y = Mean), 
           stat = "identity", 
           fill = "#C26A77",  # Rose pink
           color = "black",
           alpha = 0.8) +
  
  # Error bars representing standard deviation
  geom_errorbar(data = summary_stats, 
                aes(x = TimePoint, ymin = Mean - SD, ymax = Mean + SD), 
                width = 0.2,
                color = "black",
                linewidth = 0.8) +
  
  # Plot raw individual points in a straight line (no jitter)
  geom_point(data = gene_expression, 
             aes(x = TimePoint, y = Expression_E4), 
             size = 3,
             alpha = 0.7,
             color = "black",
             position = position_nudge(x = 0)) +
  
  # Set y-axis limits
  scale_y_continuous(limits = c(-4, 20)) +
  
  # Labels and styling
  labs(
    title = "Gene Expression Across Time Points",
    x = "Time Points",
    y = "Expression Level"
  ) +
  theme_minimal() +
  theme(
    panel.background = element_blank(),
    panel.grid.major = element_blank(),
    panel.grid.minor = element_blank(),
    axis.line = element_line(color = "black", linewidth = 1.2),
    axis.ticks = element_line(color = "black", linewidth = 1),
    axis.text = element_text(size = 14),
    axis.title = element_text(size = 16, face = "bold"),
    legend.position = "none"
  )
