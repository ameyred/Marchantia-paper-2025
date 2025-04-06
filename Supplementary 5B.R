# Load required libraries
library(ggplot2)  # For plotting
library(dplyr)    # For data manipulation

# Load the input CSV file (adjust the path as necessary)
data <- read.csv("C:/Users/Siddharth kaushik/Downloads/erc3 WT Cazyme family graph.csv")

# Summarize the data: count the number of entries per Category and Annotation
data_summary <- data %>%
  group_by(Category, Annotation) %>%
  summarise(count = n(), .groups = 'drop')  # Dropping groups after summarising

# Create gradient color palettes for each category
# Light to dark blue for Category 1, pink gradient for Category 2
gradient_colors_cat1 <- colorRampPalette(c("#90CBEC", "#3182BD"))(
  length(unique(data_summary$Annotation[data_summary$Category == unique(data_summary$Category)[1]]))
)
gradient_colors_cat2 <- colorRampPalette(c("#C26A77", "#FFB6C1"))(
  length(unique(data_summary$Annotation[data_summary$Category == unique(data_summary$Category)[2]]))
)

# Sort categories to ensure consistent color assignment
unique_categories <- sort(unique(data_summary$Category))

# Assign gradient colors to each annotation within its category
data_summary$color <- ifelse(
  data_summary$Category == unique_categories[1],
  gradient_colors_cat1[as.numeric(factor(data_summary$Annotation[data_summary$Category == unique_categories[1]]))],
  gradient_colors_cat2[as.numeric(factor(data_summary$Annotation[data_summary$Category == unique_categories[2]]))]
)

# Create a stacked bar plot
ggplot(data_summary, aes(fill = color, y = count, x = Category)) + 
  geom_bar(position = "stack", stat = "identity", width = 0.4) +  # Stacked bars per category
  
  labs(y = "Count", x = "Category") +  # Add axis labels
  
  scale_fill_identity() +  # Use manual fill colors (already mapped)
  
  # Add labels (annotation names) to the center of each stacked segment
  geom_text(aes(label = Annotation), 
            position = position_stack(vjust = 0.5), 
            color = "black") + 
  
  # Minimalist clean theme
  theme(
    panel.grid = element_blank(),  # Remove gridlines
    panel.background = element_rect(fill = 'transparent'),  # Transparent background
    axis.line = element_line(colour = "black")  # Add axis lines
  )
