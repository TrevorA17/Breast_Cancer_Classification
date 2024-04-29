# Load the saved SVM model
loaded_svm_model <- readRDS("./models/svm_model.rds")

#* @apiTitle Breast Cancer Diagnosis Prediction Model API
#* @apiDescription Used to predict breast cancer diagnosis.

#* @param radius_mean Mean radius of the tumor
#* @param texture_mean Mean texture of the tumor
#* @param perimeter_mean Mean perimeter of the tumor
#* @param area_mean Mean area of the tumor
#* @param smoothness_mean Mean smoothness of the tumor
#* @param compactness_mean Mean compactness of the tumor
#* @param concavity_mean Mean concavity of the tumor
#* @param concave_points_mean Mean number of concave portions of the contour
#* @param symmetry_mean Mean symmetry of the tumor
#* @param fractal_dimension_mean Mean fractal dimension of the tumor
#* @param radius_se Standard error of the radius of the tumor
#* @param texture_se Standard error of the texture of the tumor
#* @param perimeter_se Standard error of the perimeter of the tumor
#* @param area_se Standard error of the area of the tumor
#* @param smoothness_se Standard error of the smoothness of the tumor
#* @param compactness_se Standard error of the compactness of the tumor
#* @param concavity_se Standard error of the concavity of the tumor
#* @param concave_points_se Standard error of the number of concave portions of the contour
#* @param symmetry_se Standard error of the symmetry of the tumor
#* @param fractal_dimension_se Standard error of the fractal dimension of the tumor
#* @param radius_worst Worst radius of the tumor
#* @param texture_worst Worst texture of the tumor
#* @param perimeter_worst Worst perimeter of the tumor
#* @param area_worst Worst area of the tumor
#* @param smoothness_worst Worst smoothness of the tumor
#* @param compactness_worst Worst compactness of the tumor
#* @param concavity_worst Worst concavity of the tumor
#* @param concave_points_worst Worst number of concave portions of the contour
#* @param symmetry_worst Worst symmetry of the tumor
#* @param fractal_dimension_worst Worst fractal dimension of the tumor

#* @get /breast_cancer_diagnosis

predict_breast_cancer <- function(radius_mean, texture_mean, perimeter_mean, area_mean,
                                  smoothness_mean, compactness_mean, concavity_mean, concave_points_mean,
                                  symmetry_mean, fractal_dimension_mean, radius_se, texture_se,
                                  perimeter_se, area_se, smoothness_se, compactness_se, concavity_se,
                                  concave_points_se, symmetry_se, fractal_dimension_se, radius_worst,
                                  texture_worst, perimeter_worst, area_worst, smoothness_worst,
                                  compactness_worst, concavity_worst, concave_points_worst,
                                  symmetry_worst, fractal_dimension_worst) {
  
  # Create a data frame using the arguments
  to_be_predicted <- data.frame(
    radius_mean = as.numeric(radius_mean),
    texture_mean = as.numeric(texture_mean),
    perimeter_mean = as.numeric(perimeter_mean),
    area_mean = as.numeric(area_mean),
    smoothness_mean = as.numeric(smoothness_mean),
    compactness_mean = as.numeric(compactness_mean),
    concavity_mean = as.numeric(concavity_mean),
    concave_points_mean = as.numeric(concave_points_mean),
    symmetry_mean = as.numeric(symmetry_mean),
    fractal_dimension_mean = as.numeric(fractal_dimension_mean),
    radius_se = as.numeric(radius_se),
    texture_se = as.numeric(texture_se),
    perimeter_se = as.numeric(perimeter_se),
    area_se = as.numeric(area_se),
    smoothness_se = as.numeric(smoothness_se),
    compactness_se = as.numeric(compactness_se),
    concavity_se = as.numeric(concavity_se),
    concave_points_se = as.numeric(concave_points_se),
    symmetry_se = as.numeric(symmetry_se),
    fractal_dimension_se = as.numeric(fractal_dimension_se),
    radius_worst = as.numeric(radius_worst),
    texture_worst = as.numeric(texture_worst),
    perimeter_worst = as.numeric(perimeter_worst),
    area_worst = as.numeric(area_worst),
    smoothness_worst = as.numeric(smoothness_worst),
    compactness_worst = as.numeric(compactness_worst),
    concavity_worst = as.numeric(concavity_worst),
    concave_points_worst = as.numeric(concave_points_worst),
    symmetry_worst = as.numeric(symmetry_worst),
    fractal_dimension_worst = as.numeric(fractal_dimension_worst)
  )
  
  # Use the loaded model to make predictions
  prediction <- predict(loaded_svm_model, newdata = to_be_predicted)
  
  # Return the prediction
  return(prediction)
}
