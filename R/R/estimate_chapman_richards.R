library(nortest)
library(robustbase)
library(openxlsx)

estimate_chapman_richards <- function(data, species_col = 'botanical_names', age_col = 'age', height_col = 'height', output_dir = getwd()) {
  
  # Create output directories
  current_datetime <- format(Sys.time(), '%Y%m%d_%H%M%S')
  output_folder_name <- paste0("artemis_", current_datetime)
  image_folder_path <- file.path(output_dir, output_folder_name, 'images')
  numerical_folder_path <- file.path(output_dir, output_folder_name, 'numerical')
  dir.create(image_folder_path, recursive = TRUE)
  dir.create(numerical_folder_path, recursive = TRUE)
  
  # Placeholder for results
  param_results <- data.frame(species = character(), A = numeric(), k = numeric(), p = numeric(), stringsAsFactors = FALSE)
  
  # For fitted values
  age_range <- 1:30
  fitted_values <- data.frame(age = age_range)
  
  # For each species, estimate parameters
  for (species in unique(data[[species_col]])) {
    species_data <- subset(data, data[[species_col]] == species)
    
    # Skip species with less than 30 observations
    if (nrow(species_data) < 30) {
      cat(paste("Skipping species due to insufficient data:", species, "\n"))
      next
    }
    
    success <- FALSE # Flag to track if the model fit was successful for the species
    tryCatch({
      model <- nlrob(eval(parse(text=height_col)) ~ A * (1 - exp(-k * eval(parse(text=age_col))))^p, 
                    data = species_data, 
                    start = list(A = max(species_data[[height_col]]), 
                                 k = 1/max(species_data[[age_col]]), 
                                 p = 3), 
                    trace = FALSE)
      success <- TRUE
    }, error = function(e) {
      tryCatch({
        model <- nlrob(eval(parse(text=height_col)) ~ A * (1 - exp(-k * eval(parse(text=age_col))))^p, 
                      data = species_data, 
                      start = list(A = max(species_data[[height_col]]), 
                                   k = 1/max(species_data[[age_col]]), 
                                   p = 4), 
                      trace = FALSE)
        success <- TRUE
      }, error = function(e) {
        cat(paste("Error with species:", species, ". Error message:", e$message, "\n"))
      })
    })
    
    if (success) {
      # Save parameters
      param_results <- rbind(param_results, c(species, coef(model)))

      # Generate fitted values
      fitted_height <- coef(model)['A'] * (1 - exp(-coef(model)['k'] * age_range))^coef(model)['p']
      fitted_values[species] <- fitted_height

      # QQ plot for species
      png(filename = file.path(image_folder_path, paste0(species, "_qq_plot.png")))
      qqnorm(residuals(model))
      qqline(residuals(model))
      dev.off()
    }
  }
  
  # Save results to Excel, if there are any
  if (nrow(param_results) > 0) {
    write.xlsx(param_results, file.path(numerical_folder_path, "parameters.xlsx"), row.names = FALSE)
  } else {
    cat("No parameter results to save to Excel.\n")
  }

  if (ncol(fitted_values) > 1) { # check if there are any columns besides 'age'
    write.xlsx(fitted_values, file.path(numerical_folder_path, "output_file.xlsx"), row.names = FALSE)
  } else {
    cat("No fitted values to save to Excel.\n")
  }
  
  return(list(parameters = param_results, fitted_values = fitted_values))
}
