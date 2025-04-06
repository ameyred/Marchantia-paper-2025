# Fo47 Effector Gene Chromosome Map

## Overview
This script creates a visualization of effector genes across the Fo47 genome chromosomes, with:
- Chromosomes shown as horizontal bars
- Effector genes marked as colored ticks
- Color intensity representing effector scores
- Special highlighting for chromosome 7

## Key Features
- **Intuitive Layout**: Chromosomes arranged vertically with genomic position on x-axis
- **Score Visualization**: Gradient from light pink (low) to dark red (high) scores
- **Highlighting**: Chromosome 7 shown in distinct blue
- **Publication Ready**: Clean design with proper labels and color bar

## Dependencies
- Python 3.6+
- Required packages:
  - matplotlib (3.3.0+)
  - pandas (1.1.0+)
  - numpy (1.19.0+)

## Input Data
- **File**: `Fo47 Chromomap effector all.txt`
- **Format**: Tab-delimited with columns:
  - GeneID: Effector gene identifier
  - Chromosome: Chromosome number
  - Start/End: Genomic coordinates
  - Score: Effector score (numeric)

## Customization Options

### Visual Parameters
1. **Colors**:
   - Highlight color: Modify `"#3D65A5"` for special chromosomes
   - Default chromosome color: Change `"#cce6ff"`
   - Gradient: Adjust in `gradient_color()` function

2. **Layout**:
   - Figure size: Adjust in `figsize=(12,10)`
   - Gene tick width: Change `0.04` value

3. **Text**:
   - Font sizes in `ax.set_xlabel()` and `ax.text()`

### Data Handling
1. To highlight additional chromosomes:
   ```python
   highlighted_chromosomes = {"7", "3", "5"}  # Add more as needed
