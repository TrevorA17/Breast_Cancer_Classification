# Load the breast cancer dataset
breast_cancer_data <- read.csv("data/breast_cancer.csv", colClasses = c(
  id = "character",
  diagnosis = "factor",
  radius_mean = "numeric",
  texture_mean = "numeric",
  perimeter_mean = "numeric",
  area_mean = "numeric",
  smoothness_mean = "numeric",
  compactness_mean = "numeric",
  concavity_mean = "numeric",
  concave_points_mean = "numeric",
  symmetry_mean = "numeric",
  fractal_dimension_mean = "numeric",
  radius_se = "numeric",
  texture_se = "numeric",
  perimeter_se = "numeric",
  area_se = "numeric",
  smoothness_se = "numeric",
  compactness_se = "numeric",
  concavity_se = "numeric",
  concave_points_se = "numeric",
  symmetry_se = "numeric",
  fractal_dimension_se = "numeric",
  radius_worst = "numeric",
  texture_worst = "numeric",
  perimeter_worst = "numeric",
  area_worst = "numeric",
  smoothness_worst = "numeric",
  compactness_worst = "numeric",
  concavity_worst = "numeric",
  concave_points_worst = "numeric",
  symmetry_worst = "numeric",
  fractal_dimension_worst = "numeric"
), header = TRUE)

# Display the structure of the dataset
str(breast_cancer_data)

# View the first few rows of the dataset
head(breast_cancer_data)

# Open the dataset in a viewer window
View(breast_cancer_data)

# Summary statistics for numeric variables
summary(breast_cancer_data[, -c(1, 2)]) 

# Frequency table for the 'diagnosis' variable
table(breast_cancer_data$diagnosis)

# Calculate mean for numeric variables
means <- sapply(breast_cancer_data[, -c(1, 2)], mean)

# Calculate median for numeric variables
medians <- sapply(breast_cancer_data[, -c(1, 2)], median)

# Calculate mode for the 'diagnosis' variable
mode <- as.character(names(sort(table(breast_cancer_data$diagnosis), decreasing = TRUE)[1]))

# Combine results into a data frame
central_tendency <- data.frame(
  Variable = names(means),
  Mean = means,
  Median = medians
)

# Add mode for the 'diagnosis' variable
mode_df <- data.frame(Variable = "diagnosis", Mode = mode)
central_tendency <- rbind(central_tendency, mode_df)

# Print central tendency measures
print(central_tendency)

# Compute measures of distribution for numeric variables
distribution_stats <- data.frame(
  Variable = character(),
  Variance = numeric(),
  Standard_Deviation = numeric(),
  Skewness = numeric(),
  Kurtosis = numeric(),
  stringsAsFactors = FALSE
)

# Loop through numeric variables
for (col in names(breast_cancer_data[, -c(1, 2)])) {
  var_value <- var(breast_cancer_data[, col])
  sd_value <- sd(breast_cancer_data[, col])
  skewness_value <- moments::skewness(breast_cancer_data[, col])
  kurtosis_value <- moments::kurtosis(breast_cancer_data[, col])
  
  distribution_stats <- rbind(distribution_stats, data.frame(
    Variable = col,
    Variance = var_value,
    Standard_Deviation = sd_value,
    Skewness = skewness_value,
    Kurtosis = kurtosis_value
  ))
}

# Print measures of distribution
print(distribution_stats)

# Compute correlation matrix
correlation_matrix <- cor(breast_cancer_data[, -c(1, 2)])

# Print correlation matrix
print(correlation_matrix)

# Load necessary library for visualization
library(ggplot2)

# Plot correlation heatmap
ggplot2::ggplot(data = reshape2::melt(correlation_matrix), aes(Var2, Var1, fill = value)) +
  ggplot2::geom_tile() +
  ggplot2::scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                                midpoint = 0, limit = c(-1, 1), space = "Lab", 
                                name="Correlation") +
  ggplot2::theme_minimal() +
  ggplot2::theme(axis.text.x = ggplot2::element_text(angle = 45, vjust = 1, size = 10, hjust = 1)) +
  ggplot2::coord_fixed()


# Load necessary libraries for visualization
library(ggplot2)

# Histograms for each numeric variable
histogram_radius_mean <- ggplot(data = breast_cancer_data, aes(x = radius_mean)) +
  geom_histogram(fill = "lightblue", color = "black") +
  labs(title = "Histogram of Radius Mean", x = "Radius Mean", y = "Frequency")

histogram_texture_mean <- ggplot(data = breast_cancer_data, aes(x = texture_mean)) +
  geom_histogram(fill = "lightblue", color = "black") +
  labs(title = "Histogram of Texture Mean", x = "Texture Mean", y = "Frequency")

# Print histograms individually
print(histogram_radius_mean)
print(histogram_texture_mean)

# Boxplots for each numeric variable
boxplot_radius_mean <- ggplot(data = breast_cancer_data, aes(x = 1, y = radius_mean)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "Boxplot of Radius Mean", x = "", y = "Radius Mean")

boxplot_texture_mean <- ggplot(data = breast_cancer_data, aes(x = 1, y = texture_mean)) +
  geom_boxplot(fill = "lightblue", color = "black") +
  labs(title = "Boxplot of Texture Mean", x = "", y = "Texture Mean")

# Print boxplots individually
print(boxplot_radius_mean)
print(boxplot_texture_mean)

# Load necessary libraries for visualization
library(ggplot2)

# Scatterplots for each pair of numeric variables
scatterplot_radius_mean_texture_mean <- ggplot(data = breast_cancer_data, aes(x = radius_mean, y = texture_mean)) +
  geom_point() +
  labs(title = "Scatterplot of Radius Mean vs. Texture Mean", x = "Radius Mean", y = "Texture Mean")

# Print scatterplots individually
print(scatterplot_radius_mean_texture_mean)

