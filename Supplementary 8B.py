import func_e
from func_e.core import Enrichment

# Paths to your input files
background_file = "Insert_your_file.txt"
query_file = "Insert_your_file.txt"
terms_file = "Insert_your_file.csv"
terms_to_features_file = "Insert_your_file.csv"

# Perform enrichment analysis
enrichment = Enrichment(
    background_file=background_file,
    query_file=query_file,
    terms_file=terms_file,
    terms_to_features_file=terms_to_features_file,
    ecut=0.05,  # P-value cutoff
)

# Output results
enrichment.run(output_prefix="/Users/vidhasrivastava/Amey_Lab/Marchantia/Interpro_Term_Enrichment/Output")
FUNC-E \
  --background "Insert_your_file.txt" \
  --query_list "Insert_your_filetxt"  \
  --terms "Insert_your_file.tsv" \
  --terms2features "nsert_your_file.txt" \
  --outprefix "Insert_your_path" \
  --ecut 0.01
