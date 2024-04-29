# Saving the best SVM model
saveRDS(svm_model$finalModel, "./models/svm_model.rds")

# Load the saved model
loaded_svm_model <- readRDS("./models/svm_model.rds")

# Prepare new data for prediction
new_data <- data.frame(
  radius_mean = 15.0,
  texture_mean = 25.0,
  perimeter_mean = 100.0,
  area_mean = 700.0,
  smoothness_mean = 0.1,
  compactness_mean = 0.2,
  concavity_mean = 0.3,
  concave_points_mean = 0.15,
  symmetry_mean = 0.2,
  fractal_dimension_mean = 0.08,
  radius_se = 0.5,
  texture_se = 1.0,
  perimeter_se = 3.0,
  area_se = 50.0,
  smoothness_se = 0.01,
  compactness_se = 0.05,
  concavity_se = 0.1,
  concave_points_se = 0.03,
  symmetry_se = 0.06,
  fractal_dimension_se = 0.008,
  radius_worst = 18.0,
  texture_worst = 29.0,
  perimeter_worst = 120.0,
  area_worst = 800.0,
  smoothness_worst = 0.12,
  compactness_worst = 0.25,
  concavity_worst = 0.35,
  concave_points_worst = 0.2,
  symmetry_worst = 0.3,
  fractal_dimension_worst = 0.1
)

# Load necessary library
library(kernlab)

# Use the loaded model to make predictions
predictions_loaded_model <- predict(loaded_svm_model, newdata = new_data)

# Print predictions
print(predictions_loaded_model)
