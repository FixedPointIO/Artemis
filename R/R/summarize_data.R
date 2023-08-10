library(nortest)
library(ggplot2)
library(gridExtra)

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
  
  # Combined QQ Plots and Histograms for Numeric Data (excluding age)
  if (any(numeric_cols)) {
    cols_to_plot <- setdiff(names(data_frame[numeric_cols]), "age")
    plot_list <- list()
    
    for (colname in cols_to_plot) {
      # QQ Plot
      plot_qq <- ggplot(data_frame, aes(sample = data_frame[[colname]])) + 
        geom_qq() + 
        geom_qq_line() + 
        ggtitle(paste("QQ Plot for", colname))
      
      # Histogram
      plot_hist <- ggplot(data_frame, aes(data_frame[[colname]])) + 
        geom_histogram(aes(y = ..density..), bins = 30, fill = "blue", alpha = 0.7) + 
        geom_density(col = "red") + 
        ggtitle(paste("Histogram for", colname))
      
      plot_list[[colname]] <- list(plot_qq, plot_hist)
    }
    
    grid.arrange(grobs = unlist(plot_list, recursive = FALSE))
  }
  
  return(summary_list)
}
