# Load necessary libraries
library(ggplot2)    # For data visualization
library(dplyr)      # For data manipulation
library(tibble)     # For data frame operations

# Load the main dataset (all chromosomes)
data <- read.csv("~/Amey_Lab/Marchantia/Fol_erc3/Secretome_Comparison.csv", row.names = 1)

# =============================================
# ANALYSIS OF NON-ZERO POINTS (ALL CHROMOSOMES)
# =============================================

# Filter to include only points where both x and y are non-zero
non_zero_data <- data %>%
  filter(log2FC_erc3 != 0 & log2FC_WT != 0)

# Compute Kendall's correlation coefficient for non-zero points
kendall_correlation_non_zero <- cor(non_zero_data$log2FC_erc3, non_zero_data$log2FC_WT, 
                                    method = "kendall")

# Perform Kendall's correlation test for statistical significance
kendall_test_non_zero <- cor.test(non_zero_data$log2FC_erc3, non_zero_data$log2FC_WT, 
                                  method = "kendall")

# Print the correlation results
cat("Kendall Correlation Coefficient (Non-Zero Points):", kendall_correlation_non_zero, "\n")
cat("\nKendall Test Results (Non-Zero Points):\n")
print(kendall_test_non_zero)

# =============================================
# VISUALIZATION (ALL CHROMOSOMES)
# =============================================

# Count points in each category for legend labels
point_counts <- data %>%
  mutate(Point_Type = case_when(
    log2FC_erc3 == 0 ~ "x = 0",      # Points on y-axis
    log2FC_WT == 0 ~ "y = 0",        # Points on x-axis
    TRUE ~ "Other"                   # Points in the middle
  )) %>%
  group_by(Point_Type) %>%
  summarize(Count = n())

# Create legend labels with counts (e.g., "x = 0 (42)")
legend_labels <- point_counts %>%
  mutate(Label = paste(Point_Type, "(", Count, ")", sep = "")) %>%
  select(Point_Type, Label) %>%
  deframe()

# Create scatter plot with LOESS curve
ggplot(data, aes(x = log2FC_erc3, y = log2FC_WT)) +
  # Plot all points as diamonds (shape 18)
  geom_point(aes(
    color = case_when(
      log2FC_erc3 == 0 ~ "x = 0",
      log2FC_WT == 0 ~ "y = 0",
      TRUE ~ "Other"
    )
  ), shape = 18, size = 6, alpha = 0.7) +  # Large semi-transparent diamonds
  
  # Add LOESS curve using only non-zero data points
  geom_smooth(data = non_zero_data, aes(x = log2FC_erc3, y = log2FC_WT),
              method = "loess", se = FALSE, color = "black", linetype = "dotted") +
  
  # Customize labels and titles
  labs(
    title = "Scatter Plot with LOESS Curve (Non-Zero Data for Curve)",
    x = "log2FC (ERC3)",
    y = "log2FC (WT)",
    color = "Point Type"
  ) +
  
  # Custom color scheme with counts in legend
  scale_color_manual(
    values = c("x = 0" = "#5DA899",    # Teal for x=0 points
               "y = 0" = "#C26A77",    # Reddish for y=0 points
               "Other" = "#DCCD7D"),    # Gold for other points
    labels = legend_labels              # Labels with counts
  ) +
  
  # Theme customization
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),       # Center title
    legend.position = "right",                   # Legend on right
    panel.grid = element_blank(),                # No gridlines
    panel.background = element_rect(fill = "white", color = NA), # White background
    panel.border = element_blank(),              # No panel border
    axis.line = element_line(color = "black"),   # Black axis lines
    axis.ticks = element_line(color = "black"),  # Black ticks
    axis.text = element_text(size = 18),         # Larger axis text
    axis.title = element_text(size = 20)         # Larger axis titles
  )

# =============================================
# ANALYSIS OF SHORT CORE CHROMOSOMES ONLY
# =============================================

# Load data for short core chromosomes only
data <- read.csv("~/Amey_Lab/Marchantia/Fol_erc3/Secretome_Comparison_Short_Core.csv", 
                 row.names = 1)

# Count points in each category for legend labels (short core chromosomes)
point_counts <- data %>%
  mutate(Point_Type = case_when(
    log2FC_erc3 == 0 ~ "x = 0",
    log2FC_WT == 0 ~ "y = 0",
    TRUE ~ "Other"
  )) %>%
  group_by(Point_Type) %>%
  summarize(Count = n())

# Create legend labels with counts
legend_labels <- point_counts %>%
  mutate(Label = paste(Point_Type, "(", Count, ")", sep = "")) %>%
  select(Point_Type, Label) %>%
  deframe()

# Create scatter plot for short core chromosomes
ggplot(data, aes(x = log2FC_erc3, y = log2FC_WT)) +
  # Same visualization parameters as before
  geom_point(aes(
    color = case_when(
      log2FC_erc3 == 0 ~ "x = 0",
      log2FC_WT == 0 ~ "y = 0",
      TRUE ~ "Other"
    )
  ), shape = 18, size = 6, alpha = 0.7) +
  geom_smooth(data = non_zero_data, aes(x = log2FC_erc3, y = log2FC_WT),
              method = "loess", se = FALSE, color = "black", linetype = "dotted") +
  labs(
    title = "Scatter Plot with LOESS Curve (Non-Zero Data for Curve)",
    x = "log2FC (ERC3)",
    y = "log2FC (WT)",
    color = "Point Type"
  ) +
  scale_color_manual(
    values = c("x = 0" = "#5DA899", "y = 0" = "#C26A77", "Other" = "#DCCD7D"),
    labels = legend_labels
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5),
    legend.position = "right",
    panel.grid = element_blank(),
    panel.background = element_rect(fill = "white", color = NA),
    panel.border = element_blank(),
    axis.line = element_line(color = "black"),
    axis.ticks = element_line(color = "black"),
    axis.text = element_text(size = 18),
    axis.title = element_text(size = 20)
  )