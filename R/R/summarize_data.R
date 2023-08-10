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
    
    plot_list <- list() # To store plots
    
    for (colname in cols_to_plot) {
      # QQ Plot using ggplot2
      sample_values <- data_frame[[colname]]
      theoretical_quantiles <- qnorm((rank(sample_values, na.last = "keep") - 0.5) / length(sample_values))
      qq_data <- data.frame(sample = sample_values, theoretical = theoretical_quantiles)
      qq_plot <- ggplot(qq_data, aes(x = theoretical, y = sample)) +
        geom_point() +
        geom_smooth(method = "lm", color = "red") +
        ggtitle(paste("QQ Plot for", colname)) +
        theme_minimal()
      
      # Histogram using ggplot2
      hist_plot <- ggplot(data_frame, aes_string(colname)) +
        geom_histogram(aes(y = ..density..), bins = 30) +
        geom_density(color = "blue") +
        ggtitle(paste("Histogram for", colname)) +
        theme_minimal()
      
      plot_list[[paste0(colname, "_qq")]] <- qq_plot
      plot_list[[paste0(colname, "_hist")]] <- hist_plot
    }
    
    # Combine plots using gridExtra
    combined_plot <- grid.arrange(
      plot_listheightqq,plotlistheight_qq, plot_listheight_hist,
      plot_listdbhqq,plotlistdbh_qq, plot_listdbh_hist,
      nrow = 2
    )
  }
  
  return(summary_list)
}
