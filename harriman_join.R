#posible scrips to join several data frames an plot it all together 

library(tidyverse)
library(lubridate)
library(plotly)
library(htmlwidgets)
#call dataand add node column 
Harriman_4309 = read.csv("Harriman_4309.csv", header = TRUE)
Harriman_4309$Node <- "Harriman_4309"
  
Harriman_435 = read.csv("Harriman_435.csv", header = TRUE)
Harriman_435$Node <- "Harriman_435"

Harriman_data <- rbind(Harriman_435, Harriman_4309)

# values over equal or over 250
Harriman_data_250 <- filter(Harriman_data, LMP>=250)

# parse dates
Harriman_data_250$Local.Time = ymd_hms(Harriman_data_250$Local.Time)

#Harriman$id <- factor(rep(1:length(df.list), each = sapply(df.list, nrow)))
#g <- geom(newDF, aes(x = dX, y = dY, colour = id)
 #         g <- g + geom_line()
#        print(g))
          
#ggplot(bind_rows(Harriman_data_250, .id="id"), aes(dX, dY, colour=id)) +
#      geom_line()
 
Harriman_t_LPM_plot_250 <- ggplot(data = Harriman_data_250, aes(x = Local.Time, y = LMP, colour=Node)) +
  geom_point() +
  scale_x_datetime(name ="Time") +
  ggtitle("Time vs LMPs from Harriman >= 250" )
 
Harriman_t_LPM_plot_250_interactive <- ggplotly(Harriman_t_LPM_plot_250)


saveWidget(Harriman_t_LPM_plot_250_interactive, file = "Harriman_t_LPM_plot_250_interactive.html")

