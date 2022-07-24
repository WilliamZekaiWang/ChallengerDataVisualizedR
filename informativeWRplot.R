informativeWRplot <- function(){
  line <- lm(df$list_of_games ~ df$list_of_wr)
  plot_ly(data = df,
          type = "scatter",
          mode = "markers",  
          x = df$list_of_wr,
          y = df$list_of_games,
          name = paste("Challenger Player")
  )%>%
    add_trace(data = df, 
              y = line$fitted.values, 
              mode = 'lines', 
              alpha = 1, 
              name = paste("Linear Trend Line"),
              line = list(width = 2)
    )
}
