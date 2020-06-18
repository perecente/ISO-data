#The porpouse of this scrip is to load an analize holiyoke dataset

library(tidyverse)
library(lubridate)
library(plotly)
library(htmlwidgets)

library(gghighlight)
#call data
Holiyoke_data = read.csv("Holiyoke_4486.csv", header = TRUE)

# values over equal or over 250
Holiyoke_data_250 <- filter(Holiyoke_data, LMP>=250)

# parse dates
Holiyoke_data_250$Local.Time = ymd_hms(Holiyoke_data_250$Local.Time)



Holiyoke_t_LPM_plot_250 <- ggplot(data = Holiyoke_data_250, aes(x = Local.Time, y = LMP)) +
  geom_point() +
    scale_x_datetime(name ="Time") +
  ggtitle("Time vs LMPs from Holiyoke >= 250" )



Holiyoke_t_LPM_plot_250_interactive <- ggplotly(Holiyoke_t_LPM_plot_250)


saveWidget(Holiyoke_t_LPM_plot_250_interactive, file = "Holiyoke_t_LPM_plot_250_interactive.html")



