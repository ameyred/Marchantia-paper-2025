# Circle Packing Visualization of Enriched InterPro Terms

## Overview
This R script creates a circle packing visualization of enriched InterPro terms from down-regulated genes, where:
- Circle size represents the number of genes in each term
- Circle color represents the significance of enrichment (-log10 p-value)
- Labels show the term name and gene count

## Dependencies
- R (version 4.0+ recommended)
- Required packages:
  - `packcircles` (v0.3.4+)
  - `ggplot2` (v3.3.0+)
  - `stringr` (v1.4.0+)
  - `viridis` (v0.6.0+)

## Input Data
- **File**: `Output.FUNC-E.enriched_terms_nr.tsv`
- **Location**: `~/Amey_Lab/Marchantia/Interpro_Term_Enrichment/Down_Regulated/Fol_WT/`
- **Required Columns**:
  - `Name`: InterPro term name
  - `Count.In.Module`: Number of genes in term
  - `Fishers.p.value`: Enrichment p-value

## Key Features
1. **Circle Packing Algorithm**:
   - Circles sized by gene count
   - Efficient space utilization with no overlaps

2. **Visual Encoding**:
   - Size = Gene count
   - Color = -log10(p-value) (viridis scale)
   - Labels = Term name + gene count

3. **Customizations**:
   - Dynamic text sizing based on circle size
   - Text wrapping for long labels
   - Adjustable spacing between circles
   - Clean, publication-ready theme

## Usage Instructions
1. Ensure input file exists at specified path
2. Run script in R/RStudio
3. The plot will be displayed in the graphics device

## Customization Options
1. **Circle Spacing**:
   - Adjust `scaling_factor` (line 20)

2. **Text Wrapping**:
   - Modify `width` parameter in `str_wrap()` (line 36)

3. **Color Scheme**:
   - Change `option` in `scale_fill_viridis()` (line 51)
   - Available options: "viridis", "magma", "plasma", "inferno", "cividis"

4. **Plot Dimensions**:
   - To save plot, add:
     ```r
     ggsave("interpro_circle_pack.png", width = 10, height = 8, dpi = 300)
     ```

## Interpretation
- Larger circles = more genes in the term
- Warmer colors (yellow) = more significant p-values
- Cooler colors (purple) = less significant p-values

## Notes
- The script automatically handles:
  - P-value transformation
  - Label formatting
  - Circle positioning
  - Aspect ratio preservation
- For very large datasets, consider increasing `npoints` in `circleLayoutVertices()` for smoother circles
