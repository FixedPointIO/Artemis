clean_forestry_data <- function(data_frame) {
  # 0. Remove leading and trailing spaces from all observations and headers
  data_frame <- data.frame(lapply(data_frame, trimws), stringsAsFactors = FALSE)
  colnames(data_frame) <- trimws(colnames(data_frame))
  
  # 1. Check for duplicate IDs
  if (anyDuplicated(data_frame$commontreeid) > 0) {
    cat("Warning: There are duplicate commontreeid entries.\n")
  }
  
  # 2. Convert all strings to lowercase for consistency
  char_cols <- sapply(data_frame, is.character)
  data_frame[char_cols] <- lapply(data_frame[char_cols], tolower)
  
  # 3. Check for missing observations
  missing_data <- sapply(data_frame, function(col) sum(is.na(col)))
  cat("Number of missing observations per column:\n")
  print(missing_data)
  
  # 4. Validate Numeric Fields
  numeric_cols <- c("height", "age", "dbh")
  for (col in numeric_cols) {
    if (any(!is.na(as.numeric(data_frame[[col]])) & !is.finite(as.numeric(data_frame[[col]])))) {
      cat(paste("Warning: Non-numeric data found in column", col, "\n"))
    }
  }
  
  # 5. Ensure consistent quote marks
  data_frame[char_cols] <- lapply(data_frame[char_cols], function(col) {
    gsub('"', "'", col)
  })

  # 6. Remove observations where age is less than 1
  data_frame <- data_frame[data_frame$age >= 1, ]

  # Additional cleaning tasks can be added here as needed
  
  return(data_frame)
}
