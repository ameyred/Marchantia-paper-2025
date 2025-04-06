# --------------------------------------------
# Marchantia Fo47 DEGs: Chi-squared Test and Mosaic Plot
# --------------------------------------------

# Define input data as a 2x2 contingency matrix
# Format: rows = "Short core" vs. "Not short core"
#         cols = "Expressed" vs. "Not expressed"
data <- matrix(c(666, 994, 1702, 6495), nrow = 2)

# Perform Chi-squared test (with Yates’ continuity correction)
result_chisq <- chisq.test(data)

# Print Chi-squared test result
print(result_chisq)

# Output example:
# Pearson's Chi-squared test with Yates' continuity correction
# X-squared = 44.75, df = 1, p-value = 2.6e-11
# Interpretation: Statistically significant association between "short core" status and expression.

# --------------------------------------------
# Mosaic Plot Visualization
# --------------------------------------------

# Load required libraries for mosaic plot
library(vcd)

# Assign data with row and column names for clarity
data <- matrix(c(666, 994, 1702, 6495), nrow = 2)
rownames(data) <- c("Short core", "Not short core")
colnames(data) <- c("Expressed", "Not expressed")

# Generate mosaic plot
mosaic(data, 
       shade = TRUE,         # Shading based on residuals
       legend = TRUE,        # Display legend
       main = "Mosaic Plot: Short Core vs. Expression",
       labeling_args = list(set_varnames = c(Short.core = "Short Core", Expression = "Expression")))
