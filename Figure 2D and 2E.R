# Load necessary libraries
library(tidyverse) # Includes ggplot2 for visualization, dplyr for data manipulation
library(RColorBrewer) # For color palettes
library(ggrepel) # For better label handling
library(gridExtra) # For arranging multiple plots
library(plotly) # For interactive plots

# Load Data (Marchantia)
data <- read.csv(file.choose())  # Prompt user to select the dataset

# Define core effector categories
data$Significance_Core <- ifelse(data$LabelC == 100, "Highlighted", "Regular")

# **Quadrant Plot for Core Effectors - Marchantia**
p <- ggplot(data, aes(x = MLFC_C, y = -log10(PM_C), color = Core)) +
  geom_vline(xintercept = 0, linetype = "dashed", colour = "black") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", colour = "black") +
  geom_point(aes(shape = Significance_Core), size = ifelse(data$LabelC == 100, 6, 3)) +
  scale_shape_manual(values = c("Highlighted" = 16, "Regular" = 1)) +
  scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 10)) +
  scale_y_continuous(limits = c(0, 300)) +
  scale_color_manual(values = c("#5DA899", "#C26A77", "#2E2585", "black")) +
  theme_minimal() +
  theme(legend.position = "right")

p


# **Quadrant Plot for Lineage-Specific Effectors - Marchantia**
r <- ggplot(data, aes(x = MLFC_L, y = -log10(PM_L), color = Lineage_specific)) +
  geom_vline(xintercept = 0, linetype = "dashed", colour = "black") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", colour = "black") +
  geom_point(aes(shape = Significance_Core), size = ifelse(data$LabelL == 100, 6, 3)) +
  scale_shape_manual(values = c("Highlighted" = 16, "Regular" = 1)) +
  scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 10)) +
  scale_y_continuous(limits = c(0, 300)) +
  scale_color_manual(values = c("white", "#5DA899", "#C26A77", "#2E2585")) +
  theme_minimal() +
  theme(legend.position = "right") +
  geom_text(aes(label = ifelse(LabelL == 100, as.character(Lineage_specific), "")), 
            hjust = -0.2, vjust = 0.5, size = 3)

r


# **Quadrant Plot for Effectors - Tomato**
data <- read.csv(file.choose())  # Prompt user to select Tomato dataset

# Define significance categories
data$Significance_Core <- ifelse(data$LabelC == 100, "Highlighted", "Regular")

q <- ggplot(data, aes(x = TLFC_C, y = -log10(PT_C), color = Core)) +
  geom_vline(xintercept = 0, linetype = "dashed", colour = "black") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", colour = "black") +
  geom_point(aes(shape = Significance_Core), size = ifelse(data$LabelC == 100, 6, 3)) +
  scale_shape_manual(values = c("Highlighted" = 16, "Regular" = 1)) +
  scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 10)) +
  scale_y_continuous(limits = c(0, 300)) +
  scale_color_manual(values = c("#5DA899", "#C26A77", "#2E2585", "black")) +
  theme_minimal() +
  theme(legend.position = "right")

q


# **Quadrant Plot for Lineage-Specific Effectors - Tomato**
s <- ggplot(data, aes(x = TLFC_L, y = -log10(PT_L), color = Lineage_specific)) +
  geom_vline(xintercept = 0, linetype = "dashed", colour = "black") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed", colour = "black") +
  geom_point(aes(shape = Significance_Core), size = ifelse(data$LabelL == 100, 6, 3)) +
  scale_shape_manual(values = c("Highlighted" = 16, "Regular" = 1)) +
  scale_x_continuous(limits = c(0, 20), breaks = seq(0, 20, 10)) +
  scale_y_continuous(limits = c(0, 300)) +
  scale_color_manual(values = c("yellow", "green", "blue", "white", 
                                "#5DA899", "#C26A77", "black", "#2E2585")) +
  theme_minimal() +
  theme(legend.position = "right") +
  geom_text(aes(label = ifelse(LabelL == 100, as.character(Lineage_specific), "")), 
            hjust = -0.2, vjust = 0.5, size = 3)

s
