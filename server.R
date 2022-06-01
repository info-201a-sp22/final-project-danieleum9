library(ggplot2)
library(plotly)
library(dplyr)
library("tidyverse")

air_df <- read.csv("PM2.5_Global_Air_Pollution_2010-2017.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  output$plot1 <- renderPlotly({

    edit_df <- air_df %>% 
      pivot_longer(!c(Country.Name, Country.Code), 
                   names_to = "Year",
                   values_to = "PM2.5")
    
    filtered_df <- edit_df %>% 
      filter(Country.Name %in% input$user_selection)
    
    air_plot1 <- ggplot(data = filtered_df) +
      geom_col(mapping = aes(x = Year, y = PM2.5, fill = Country.Name,
                             text = PM2.5)) + labs(
        title = "Annual Mean PM2.5 Exposure in Each Country 2010 - 2017",
        x = "Year",
        y = "Mean PM2.5 Exposure (Micrograms per Cubic Meter)",
        fill = "Country Name"
      )
      
    
    ggplotly(air_plot1, tooltip = "text")
    
  })
}
    
    
      