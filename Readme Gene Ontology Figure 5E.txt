# Circle Packing Visualization of Enriched InterPro Terms (ERC3 Condition)

## Overview
This R script creates a circle packing visualization of enriched InterPro terms from down-regulated genes in the ERC3 condition, where:
- Circle size represents the number of genes in each term
- Circle color represents the significance of enrichment (-log10 p-value)
- Labels show the term name and gene count

## Key Differences from Previous Version
- Analyzes data from the ERC3 condition specifically
- Updated file path reflecting ERC3 dataset location
- Modified plot title to indicate ERC3 condition

## Dependencies
- R (version 4.0+ recommended)
- Required packages:
  - `packcircles` (v0.3.4+)
  - `ggplot2` (v3.3.0+)
  - `stringr` (v1.4.0+)
  - `viridis` (v0.6.0+)

## Input Data
- **File**: `utput.FUNC-E.enriched_terms_nr.tsv` (Note: Possible typo in filename - "utput" instead of "output"?)
- **Location**: `~/Amey_Lab/Marchantia/Interpro_Term_Enrichment/Down_Regulated/erc3/`
- **Required Columns**:
  - `Name`: InterPro term name
  - `Count.In.Module`: Number of genes in term (Note: Watch for typo 'Count.In.Module' vs 'Count.In.Module')
  - `Fishers.p.value`: Enrichment p-value

## Usage Notes
1. Verify the filename is correct ("output" vs "utput")
2. Check column name consistency ("Count.In.Module" spelling)
3. The script will produce:
   - A circle packing visualization
   - Color gradient showing significance
   - Size legend indicating gene counts
   - Term labels with gene counts

## Customization Options
1. To adjust circle spacing:
   - Modify `scaling_factor` value (line 20)

2. To change label formatting:
   - Adjust `width` in `str_wrap()` (line 36)
   - Modify `size` in `geom_text()` (line 50)

3. To save the plot:
   ```r
   ggsave("erc3_interpro_circle_pack.png", width = 10, height = 8, dpi = 300)
