library(ggplot2)
library(plotly)
library(dplyr)
library("tidyverse")
library(choroplethrMaps)
library(choroplethr)


data(country.map, package = "choroplethrMaps")


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
  output$plot2 <- renderPlotly({ 
    
    choropleth_data_df <- Pollution_df %>% 
      pivot_longer(!c(`Country Name`, `Country Code`), 
                   names_to = "Year",
                   values_to = "PM2.5")
    
    filtered_map <- choropleth_data_df %>% 
      filter(Year %in% input$user_selection)
    
    air_map <- choropleth_data_df %>% 
      filter(Year %in% input$Year_selection) %>% 
      rename(region = `Country Name`, value = PM2.5) %>% 
      mutate(region = tolower(region)) %>% 
      mutate(region = recode(
        region,
        "united states"             = "united states of america",
        "congo, dem. rep."          = "democratic republic of the congo",
        "congo, rep."               = "republic of congo",
        "korea, dem. rep."          = "south korea",
        "korea. rep."               = "north korea",
        "tanzania"                  = "united republic of tanzania",
        "serbia"                    = "republic of serbia",
        "slovak republic"           = "slovakia",
        "yemen, rep."               = "yemen", 
        "russian federation"        = "russia",
        "north macedonia"           = "macedonia", 
        "korea, dem. people's rep." = "north korea", 
        "korea, rep."               = "south korea", 
        "venezuela, rb"             = "venezuela", 
        "iran, islamic rep."        = "iran", 
        "lao pdr"                   = "laos", 
        "syrian arab republic"      = "syria",
        "bahamas, the"              = "the bahamas", 
        "timor-leste"               = "east timor", 
        "brunei darussalam"         = "brunei", 
        "cote d'ivoire"             = "ivory coast", 
        "northern cyprus"           = "cyprus", 
        "gambia, the"               = "gambia", 
        "guinea-bissau"             = "guinea bissau", 
        "egypt, arab rep."          = "egypt", 
        "kyrgyz republic"           = "kyrgyzstan",
        "eswatini"                  = "swaziland")) 

    
    choropleth_air<- country_choropleth(air_map) +
      labs(title = "Annual Mean PM2.5 Exposure in Each Country Map 2010 - 2017")
    
    ggplotly(choropleth_air)
    
  })
}
