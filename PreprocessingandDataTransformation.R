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

# Remove the first column from the dataset
breast_cancer_data <- breast_cancer_data[, -1]

# Check the structure of the dataset after removing the first column
str(breast_cancer_data)


# Open the dataset in a viewer window
View(breast_cancer_data)

# Check for missing values in each column
missing_values <- sapply(breast_cancer_data, function(x) sum(is.na(x)))

# Print columns with missing values
print(missing_values[missing_values > 0])

# Load necessary libraries
library(dplyr)

# Function to normalize a numeric vector
normalize <- function(x) {
  (x - min(x)) / (max(x) - min(x))
}

# Function to log-transform a numeric vector
log_transform <- function(x) {
  log(x + 1)  # Adding 1 to avoid log(0) issue
}

# Apply normalization and log transformation to numeric variables
breast_cancer_data_transformed <- breast_cancer_data %>%
  mutate(across(where(is.numeric), normalize)) %>%
  mutate(across(c(radius_mean, texture_mean), log_transform))

# View the first few rows of the transformed dataset
head(breast_cancer_data_transformed)

