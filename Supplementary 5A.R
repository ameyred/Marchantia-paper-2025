# Load necessary libraries
library(ggplot2)  # For creating the plot
library(dplyr)    # For data manipulation (not used here but loaded for consistency)

# Define the data frame with strain-wise percentage of upregulated CAZymes
data <- data.frame(
  Strain = c("erc3", "Fol4287 WT"),  # Two fungal strains: mutant and wild type
  CAZymes_Type = c("Upregulated effectors upon infection", "Upregulated effectors upon infection"),  # Shared description
  Count = c(10.5, 13.7)  # Percent of CAZymes upregulated during infection
)

# Create the bar plot
ggplot(data, aes(fill = Strain, y = Count, x = Strain)) +
  # Add bars with adjusted width and dodge for spacing
  geom_bar(stat = "identity", width = 0.4, position = position_dodge(width = 0.1)) +
  
  # Set plot title and axis labels
  labs(title = "Proportion of CAZymes in Fol4287 and erc3 mutant Infections",
       x = "Strain",
       y = "Percent Effectors") +
  
  # Limit y-axis to a max of 50% for better readability and consistent scaling
  scale_y_continuous(limits = c(0, 50), expand = c(0, 0)) +
  
  # Set custom colors for each strain
  scale_fill_manual(values = c("Fol4287 WT" = "#C26A77", "erc3" = "#90CBEC")) +
  
  # Theme customizations for cleaner look
  theme(
    panel.background = element_rect(fill = 'transparent'),  # Transparent background
    axis.text.y = element_text(size = 12),                  # Y-axis tick text size
    axis.title.y = element_blank(),                         # Remove y-axis label
    axis.line = element_line(colour = "black")              # Add black axis lines
  )
