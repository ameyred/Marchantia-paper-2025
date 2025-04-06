This script performs a Chi-squared test to evaluate whether there is a statistically significant association between short core status and gene expression in Marchantia.

Data:
The data is arranged in a 2x2 contingency table:

Row 1: Genes that belong to the short core set

Row 2: Genes that do not belong to the short core set

Column 1: Genes that are expressed

Column 2: Genes that are not expressed

Here are the counts used in the matrix:

Short core & expressed: 1063

Short core & not expressed: 1030

Not short core & expressed: 4235

Not short core & not expressed: 10348

Chi-squared Test:
A Pearson's Chi-squared test (with Yates' continuity correction) is performed to test the null hypothesis that expression and short core status are independent. The result is printed as:

bash
Copy
Edit
Pearson's Chi-squared test with Yates' continuity correction
X-squared = 398.35, df = 1, p-value < 2.2e-16
Interpretation: The p-value is extremely small (< 2.2e-16), indicating a highly significant association between short core status and expression.

Mosaic Plot:
The mosaic plot provides a visual representation of the contingency table. The plot uses color shading to indicate the strength and direction of the deviation from expected counts (using Pearson residuals). The legend is displayed to interpret the shading.

Libraries used:

vcd: for mosaic plot visualization.
