#Introductory Page, scss - Leo
<<<<<<< HEAD
=======
  >>>>>>> 557329d1de128451d12efa98aba0f94d34315db2
library(choroplethrMaps)
library(choroplethr)
library(rgdal)
install.packages("rgdal")
data(country.map, package = "choroplethrMaps")


#Page 1 - Select country function graph - Daniel E



#Page 2 - select year for top 3 countries graph - Finn



#Page 3 - choreography - Daniel M



#Conclusion, theme - Rupali

output$plot2 <- renderPlotly({ 
  
  choropleth_data_df <- air_df %>% 
    pivot_longer(!c(Country.Name, Country.Code), 
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
  
  
  choropleth_air <- country_choropleth(air_map) +
    labs(title = "Annual Mean PM2.5 Exposure in Each Country Map 2010 - 2017")
  
  ggplotly(choropleth_air, 
           tooltip = c("x", "y"))
  
})
}

map <- plot_usmap("states", data = air_map, values = "PM2.5") + labs(
  title = "test",
  fill = "Country"
) +
  scale_fill_continuous(low = "white", high = "purple")

ggplotly(map)


sidebar_panel_widget2 <- sidebarPanel(
  selectInput(
    inputId = "Year_selection",
    label = "YOUR CODE HERE",
    choices = choropleth_data_df$Year,
    multiple = FALSE
    
    
    
    third_tab <- tabPanel(
      "Countries PM 2.5 Choropleth", 
      sidebarLayout(
        sidebar_panel_widget2, 
        main_panel_plot2
      )
    )