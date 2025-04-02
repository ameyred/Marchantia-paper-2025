# Load necessary libraries
library(ggplot2)  # For creating bar plots
library(readr)    # For reading CSV files
library(dplyr)    # For data manipulation

# ==========================================
# DATA LOADING AND PREPROCESSING
# ==========================================

# Read the CSV file containing experimental data
data <- read_csv("~/Amey_Lab/Marchantia/For_Submission/TO_NCBS/Figure_1/Figure_1B_Coming_Soon/Figure_1B.csv") 

# Convert 'Sample' column into a factor to ensure proper ordering in the plot
data$Sample <- factor(data$Sample, levels = unique(data$Sample))

# Define custom colors for different DPI (Days Post-Inoculation) categories
colors <- c("Mock 3 DPI" = "#5DA899", "Fol4287 3DPI" = "#5DA899", "Fo47 3DPI" = "#5DA899",
            "Mock 5 DPI" = "#94CBEC", "Fol4287 5DPI" = "#94CBEC", "Fo47 5DPI" = "#94CBEC")

# ==========================================
# BAR PLOT VISUALIZATION
# ==========================================

# Create a bar plot to visualize the weight per thallus for different sample groups
ggplot(data, aes(x = Sample, y = `Per Thallus`, fill = Sample)) +
  geom_bar(stat = "identity") +  # Use "identity" to plot actual values (not counts)
  scale_fill_manual(values = colors) +  # Apply custom colors to different groups
  labs(title = "Weight per Thallus by Sample",  # Set plot title
       x = "Sample",  # X-axis label
       y = "Average Fresh Weight per Thallus") +  # Y-axis label
  theme_minimal(base_size = 16) +  # Use a minimal theme with a base font size of 16
  theme(
    panel.background = element_rect(fill = "white", color = NA),  # Set white background
    plot.background = element_rect(fill = "white", color = NA),   # Ensure full white plot background
    panel.grid.major = element_blank(),  # Remove major grid lines
    panel.grid.minor = element_blank(),  # Remove minor grid lines
    axis.line = element_line(size = 1.5, color = "black"),  # Set thick black axis lines
    axis.text = element_text(size = 16, color = "black"),   # Set larger axis text size
    axis.title = element_text(size = 18, face = "bold"),    # Make axis titles bold and larger
    axis.text.x = element_text(angle = 45, hjust = 1)       # Rotate x-axis labels for readability
  )

# ==========================================
# STATISTICAL ANALYSIS
# ==========================================

# Perform one-way ANOVA to compare means across different sample groups
anova_model <- aov(`Per Thallus` ~ Sample, data = data)

# Display ANOVA results
anova_results <- summary(anova_model)
print(anova_results)  # Print the ANOVA output to check statistical significance

# Check if ANOVA results are statistically significant (p < 0.05)
if (anova_results[[1]][["Pr(>F)"]][1] < 0.05) {
  # If significant, perform Tukey's HSD post-hoc test for pairwise comparisons
  tukey_results <- TukeyHSD(anova_model)
  print(tukey_results)  # Print Tukey's HSD results to check pairwise differences
}
