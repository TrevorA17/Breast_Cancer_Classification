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

