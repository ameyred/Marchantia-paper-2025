# Import necessary libraries
import pandas as pd

# File paths (replace with actual file paths)
input_file = "insert_your_file_here"  # Path to the input CSV file containing InterPro annotations and Gene IDs
output_file = "insert_your_file_here"  # Path to save the output gene set file in FUNC-E format

# Load the InterPro data
print("Loading data...")
data = pd.read_csv(input_file, sep=",", header=0)  # Read CSV file into a DataFrame
print(f"Data loaded with {len(data)} rows.")  # Print the number of rows in the loaded data

# Strip leading/trailing spaces from column names for consistency
data.columns = data.columns.str.strip()  # Strip extra spaces from column names
print("Columns in the file after stripping:", data.columns)  # Print the column names after stripping spaces

# Drop rows where 'InterPro_Annotations' column is missing (NaN)
data = data.dropna(subset=["InterPro_Annotations"])  # Remove rows with missing annotations
print(f"Filtered data has {len(data)} rows.")  # Print the number of rows after filtering

# Convert 'InterPro_Annotations' and 'Gene_ID' columns to string type for consistency
data["InterPro_Annotations"] = data["InterPro_Annotations"].astype(str)
data["Gene_ID"] = data["Gene_ID"].astype(str)

# Group by 'InterPro_Annotations' and aggregate associated 'Gene_ID' values
# This creates a gene set for each InterPro annotation
gene_sets = (
    data.groupby("InterPro_Annotations")["Gene_ID"]
    .apply(lambda x: " ".join(set(x)))  # Join Gene_IDs into space-separated strings
    .reset_index()  # Reset the index to get a clean DataFrame
)

# Save the gene set file in FUNC-E format (each line contains an annotation and its corresponding gene IDs)
with open(output_file, "w") as f:  # Open the output file in write mode
    for _, row in gene_sets.iterrows():  # Iterate over each row in the gene sets DataFrame
        f.write(f"{row['InterPro_Annotations']} {row['Gene_ID']}\n")  # Write annotation and gene IDs to file

print(f"Gene set file saved as {output_file}")  # Print confirmation that the gene set file has been saved

# FUNC-E Command for Enrichment Analysis (replace with actual FUNC-E command in your terminal or script)
# This command performs enrichment analysis using the prepared gene set file
# Replace the paths with actual paths for the background file, query list, and gene set file
FUNC_E_COMMAND = """
FUNC-E --background "insert_your_file_here" \
       --query_list "insert_your_file_here" \
       --ecut 0.01 \
       --terms "insert_your_file_here" \
       --terms2features "insert_your_file_here" \
       --outprefix "insert_your_file_here"
"""

# Print the FUNC-E command to the console for reference
print(FUNC_E_COMMAND)

# Check the file encoding for the query file (ensure it's in UTF-8 encoding)
# Replace with the actual path to your query file
file_encoding_command = "file -I insert_your_file_here"
print(file_encoding_command)  # Print the file encoding check command
