informativeLPplot <- function(){
  
  regression_line <- lm(df$list_of_LP ~ df$list_of_games)
  
  informative_scatter <- plot_ly(
    data = df,
    type = "scatter",
    mode = "markers",
    name = "Challenger Player",
    x = ~list_of_games, y = ~list_of_LP
  )%>%
    add_trace(data = df, 
              y = regression_line$fitted.values, 
              name = paste('Linear Trend Line'), 
              mode = 'lines', 
              alpha = 1, 
              line = list(width = 2)
    )
  informative_scatter
}