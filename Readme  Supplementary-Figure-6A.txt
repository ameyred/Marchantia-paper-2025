This script performs a Chi-squared test to evaluate whether there is a significant association between short core status and expression of genes in tomato.

The data is arranged in a 2x2 contingency table:

Row 1: Genes that belong to the short core set

Row 2: Genes that do not belong to the short core set

Column 1: Number of genes that are expressed

Column 2: Number of genes that are not expressed

Raw counts used:

Short core & expressed = 644
Short core & not expressed = 1601
Not short core & expressed = 3917
Not short core & not expressed = 11334

These are input into a matrix, and a Pearson’s Chi-squared test (with Yates’ continuity correction) is performed.

The script then prints the test result:

X-squared = 8.9979, df = 1, p-value = 0.002703

This indicates a statistically significant association between being in the short core and being expressed.

To visualize this relationship, a mosaic plot is generated using the vcd package. The plot includes shading that represents Pearson residuals — this helps in identifying which combinations deviate most from expected proportions.

Dependencies:

vcd

RColorBrewer

Both are used for visual styling in the mosaic plot.

This test helps interpret enrichment or depletion patterns of gene subsets in transcriptomic experiments.
