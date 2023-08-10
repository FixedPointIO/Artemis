library(nortest)

summarize_data <- function(data_frame) {
  summary_list <- list()
  
  # Numeric Summary
  numeric_cols <- sapply(data_frame, is.numeric)
  if (any(numeric_cols)) {
    numeric_summary <- lapply(data_frame[numeric_cols], function(col) {
      ad_test <- ad.test(col)
      list(
        Min = min(col, na.rm = TRUE),
        `1st Qu` = quantile(col, 0.25, na.rm = TRUE),
        Median = median(col, na.rm = TRUE),
        Mean = mean(col, na.rm = TRUE),
        `3rd Qu` = quantile(col, 0.75, na.rm = TRUE),
        Max = max(col, na.rm = TRUE),
        SD = sd(col, na.rm = TRUE),
        `Anderson-Darling Test p-value` = ad_test$p.value
      )
    })
    summary_list$Numeric <- numeric_summary
  }
  
  # Categorical Summary
  char_cols <- sapply(data_frame, is.character)
  if (any(char_cols)) {
    char_summary <- lapply(data_frame[char_cols], function(col) {
      freq_table <- table(col)
      list(
        `Number of Unique Values` = length(unique(col)),
        `Most Frequent Value` = names(freq_table)[which.max(freq_table)],
        Frequency = max(freq_table)
      )
    })
    summary_list$Categorical <- char_summary
  }
  
  # Missing Data
  missing_data <- sapply(data_frame, function(col) sum(is.na(col)))
  summary_list$Missing_Data <- missing_data
  
  # QQ Plots for Numeric Data
  if (any(numeric_cols)) {
    par(mfrow = c(2, ceiling(sum(numeric_cols) / 2))) # Arrange plots in a grid
    lapply(names(data_frame[numeric_cols]), function(colname) {
      qqnorm(data_frame[[colname]], main = paste("QQ Plot for", colname))
      qqline(data_frame[[colname]])
    })
  }
  
  return(summary_list)
}
