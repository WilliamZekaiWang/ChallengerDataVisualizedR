#####Library and Source#####
install.packages('httr', 'dplr', 'car', 'plotly')
library(httr)
library(dplyr)
library(car)
library(plotly)

source("~/ChallengerDataVisualizedR/informativeLPplot.R")
source("~/ChallengerDataVisualizedR/informativeWRplot.R")
source("~/ChallengerDataVisualizedR/interactiveplot.R")

#Get solo/duo data#####
base_url_challengersolo <- "https://na1.api.riotgames.com/lol/league/v4/challengerleagues/by-queue/RANKED_SOLO_5x5?api_key="

challengersolo <- httr::GET(paste0(base_url_challengersolo, Sys.getenv("apikey")))
challengersolo <- httr::content(challengersolo)

list_of_players <- list()
list_of_players <- append(list_of_players ,challengersolo$entries) 

#Sorting solo/duo challenger data#####

list_of_wins <- c()
list_of_loses <- c()
list_of_games <- c()
list_of_LP <- c()
list_of_names <- c()
list_of_wr <- c()

for (i in 1:300){
  list_of_wins <- append(list_of_wins, as.integer(list_of_players[[i]][[5]]))
}

for (i in 1:300){
  list_of_loses <- append(list_of_loses, as.integer(list_of_players[[i]][[6]]))
}

for (i in 1:300){
  list_of_games <- append(list_of_games, sum(as.integer(list_of_wins[i]),as.integer(list_of_loses[i])))
}

for (i in 1:300){
  list_of_LP <- append(list_of_LP, as.integer(list_of_players[[i]][[3]]))
}
for (i in 1:300){
  list_of_names <- append(list_of_names, as.character(list_of_players[[i]])[[2]])
}
for (i in 1:300){
  list_of_wr <- append(list_of_wr, round(list_of_wins[i]/list_of_games[i], digits=3))
}

df <- data.frame(list_of_names, list_of_LP, list_of_games, list_of_wr)
df <- arrange(df, list_of_LP)


#Functions####
informativeLPplot()#shows a plot of LP to Games played alongside a linear trend line
informativeWRplot()#shows a plot of WR to Games played alongside a linear trend line
interactiveplot()#shows a plot of LP to Games played which you can hover across to see player name, win rate, and LP
