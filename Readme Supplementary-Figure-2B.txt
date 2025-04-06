# Venn Diagram Analysis of Regulated Genes

## Overview
This Python script creates two Venn diagrams comparing gene regulation between tomato and Marchantia:
1. Up-regulated genes comparison
2. Down-regulated genes comparison

## Key Features
- Clear visualization of unique and shared genes
- Consistent color scheme across diagrams:
  - Tomato: #C26A77 (reddish)
  - Marchantia: #5DA899 (teal)
- 60% opacity for better overlap visibility
- Arial font throughout for publication readiness
- Proper scaling of diagram areas to match gene counts

## Dependencies
- Python 3.6+
- Required packages:
  - matplotlib (v3.3.0+)
  - matplotlib-venn (v0.11.5+)

## Input Data
The script uses pre-calculated gene counts:
- **Up-regulated**:
  - Tomato unique: 894 (2139 total - 1245 overlap)
  - Marchantia unique: 1712 (2957 total - 1245 overlap)
  - Overlap: 1245 genes

- **Down-regulated**:
  - Tomato unique: 460 (1040 total - 580 overlap)
  - Marchantia unique: 1184 (1764 total - 580 overlap)
  - Overlap: 580 genes

## Customization Options

### Visual Parameters
1. **Colors**:
   - Change in `set_color()` calls:
     - Tomato: '#C26A77'
     - Marchantia: '#5DA899'

2. **Transparency**:
   - Adjust alpha value in `set_alpha()` (0-1 range)

3. **Text**:
   - Font size in `set_fontsize()`
   - Font family in `set_fontfamily()`

### Diagram Features
1. To add outlines:
   ```python
   from matplotlib_venn import venn2_circles
   venn2_circles(subsets=(set1, set2, overlap), linestyle='dashed')
