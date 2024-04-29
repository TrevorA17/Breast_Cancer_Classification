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

# Load necessary library
library(caret)

# Set seed for reproducibility
set.seed(123)

# Split the dataset into training (70%) and testing (30%) sets
train_index <- createDataPartition(y = breast_cancer_data$diagnosis, p = 0.7, list = FALSE)
training_data <- breast_cancer_data[train_index, ]
testing_data <- breast_cancer_data[-train_index, ]

# Print the dimensions of training and testing sets
cat("Training set dimensions:", nrow(training_data), "observations and", ncol(training_data), "variables\n")
cat("Testing set dimensions:", nrow(testing_data), "observations and", ncol(testing_data), "variables\n")
