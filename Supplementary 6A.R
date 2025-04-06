# --------------------------------------------
# Tomato Expression vs. Short Core: Chi-squared Test and Mosaic Plot
# --------------------------------------------

# Input data as a 2x2 contingency matrix
# Format: rows = "Short core" vs. "Not short core"
#         cols = "Expressed" vs. "Not expressed"
data <- matrix(c(644, 1601, 3917, 11334), nrow = 2)

# Perform Chi-squared test (with Yates’ continuity correction)
result_chisq <- chisq.test(data)

# Print result summary
print(result_chisq)

# Output example:
# Pearson's Chi-squared test with Yates' continuity correction
# X-squared = 8.9979, df = 1, p-value = 0.002703
# Interpretation: Statistically significant association between "short core" status and expression.

# --------------------------------------------
# Mosaic Plot Visualization
# --------------------------------------------

# Load required libraries
library(vcd)
library(RColorBrewer)

# Reassign data with named rows and columns for clarity
data <- matrix(c(644, 1601, 3917, 11334), nrow = 2)
rownames(data) <- c("Short core", "Not short core")
colnames(data) <- c("Expressed", "Not expressed")

# Generate mosaic plot
mosaic(data, 
       shade = TRUE,         # Color shading based on residuals
       legend = TRUE,        # Show legend
       main = "Mosaic Plot: Short Core vs. Expression", 
       labeling_args = list(set_varnames = c(Short.core = "Short Core", Expression = "Expression")))
