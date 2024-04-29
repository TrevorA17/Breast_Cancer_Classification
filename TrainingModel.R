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

# Load necessary library
library(boot)

# Define the function to calculate the statistic of interest (e.g., mean, median, etc.)
statistic_function <- function(data, indices) {
  statistic <- mean(data[indices])  # Calculate the mean using the indices
  return(statistic)
}

# Perform bootstrapping
bootstrap_result <- boot(data = breast_cancer_data$radius_mean, statistic = statistic_function, R = 1000)

# Print the bootstrap results
print(bootstrap_result)

# Load necessary libraries
library(caret)

# Define the number of folds
num_folds <- 10

# Perform k-fold cross-validation
cv_results <- trainControl(method = "cv", number = num_folds)
model <- train(diagnosis ~ ., data = breast_cancer_data, method = "glm", trControl = cv_results)

# Print the cross-validation results
print(summary(model))

# Load necessary libraries
library(caret)

# Define the dependent variable
dependent_variable <- "diagnosis"



# Split the data into training and testing sets
set.seed(123)  # For reproducibility
train_index <- createDataPartition(breast_cancer_data[[dependent_variable]], p = 0.7, list = FALSE)
training_data <- breast_cancer_data[train_index, ]
testing_data <- breast_cancer_data[-train_index, ]

# Train logistic regression model
logistic_model <- train(as.formula(paste(dependent_variable, "~ .")), data = training_data, method = "glm", trControl = trainControl(method = "cv", number = 10))


# Make predictions on testing data
predictions_logistic <- predict(logistic_model, newdata = testing_data)

# Evaluate performance
confusionMatrix(predictions_logistic, testing_data[[dependent_variable]])


# Make predictions on testing data
predictions_logistic <- predict(logistic_model, newdata = testing_data)

# Evaluate performance
confusionMatrix(predictions_logistic, testing_data[[dependent_variable]])

# Train SVM model
svm_model <- train(as.formula(paste(dependent_variable, "~ .")), data = training_data, method = "svmLinear", trControl = trainControl(method = "cv", number = 10))

# Make predictions on testing data
predictions_svm <- predict(svm_model, newdata = testing_data)

# Evaluate performance
confusionMatrix(predictions_svm, testing_data[[dependent_variable]])

# Train random forests model
rf_model <- train(as.formula(paste(dependent_variable, "~ .")), data = training_data, method = "rf", trControl = trainControl(method = "cv", number = 10))

# Make predictions on testing data
predictions_rf <- predict(rf_model, newdata = testing_data)

# Evaluate performance
confusionMatrix(predictions_rf, testing_data[[dependent_variable]])

# Load necessary libraries
library(caret)

# Define dependent variable for classification
dependent_variable_classification <- "diagnosis"

# Train logistic regression model
logistic_model <- train(as.formula(paste(dependent_variable_classification, "~ .")), data = breast_cancer_data, method = "glm", trControl = trainControl(method = "cv", number = 10))

# Train SVM model
svm_model <- train(as.formula(paste(dependent_variable_classification, "~ .")), data = breast_cancer_data, method = "svmLinear", trControl = trainControl(method = "cv", number = 10))

# Train random forests model
rf_model <- train(as.formula(paste(dependent_variable_classification, "~ .")), data = breast_cancer_data, method = "rf", trControl = trainControl(method = "cv", number = 10))

# Compare model performance using resamples
models_comparison_classification <- resamples(list(Logistic = logistic_model, SVM = svm_model, Random_Forest = rf_model))

# Summarize model performance
summary(models_comparison_classification)

