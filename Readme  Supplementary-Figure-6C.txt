This script performs a Chi-squared test and generates a mosaic plot to analyze the relationship between short core status and gene expression for Marchantia Fo47 DEGs.

Data:
The data is arranged in a 2x2 contingency table:

Row 1: Genes that belong to the short core set

Row 2: Genes that do not belong to the short core set

Column 1: Genes that are expressed

Column 2: Genes that are not expressed

Here are the counts used in the matrix:

Short core & expressed: 666

Short core & not expressed: 994

Not short core & expressed: 1702

Not short core & not expressed: 6495

Chi-squared Test:
A Pearson's Chi-squared test (with Yates' continuity correction) is performed to test the null hypothesis that expression and short core status are independent. The result is printed as:

bash
Copy
Edit
Pearson's Chi-squared test with Yates' continuity correction
X-squared = 44.75, df = 1, p-value = 2.6e-11
Interpretation: The p-value (2.6e-11) indicates a highly significant association between short core status and expression.

Mosaic Plot:
The mosaic plot visually represents the contingency table. It uses color shading to indicate the strength and direction of the deviation from expected counts (using Pearson residuals). The legend is displayed to interpret the shading.

Libraries used:

vcd: for mosaic plot visualization.
