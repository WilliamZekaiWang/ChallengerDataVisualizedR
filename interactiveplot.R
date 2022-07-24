interactiveplot <- function(){
  interactive_scatter <- plot_ly(
    data = df, 
    type = "scatter",
    mode   = 'markers',
    x = ~list_of_games, y = ~list_of_LP, 
    color = ~list_of_LP ,
    text = ~paste("Number of Games Played:", list_of_games,"<br>LP:", list_of_LP, "<br>Winrate:",list_of_wr ,"<br>User:", list_of_names),
    hoverinfo = "text"
  )%>%
    layout(showlegend = FALSE,
           xaxis = list(title = "Amount of games played"),
           yaxis = list(title = "Amount of LP"),
           plot_bgcolor="#f6fff2"
    )
  interactive_scatter
}