library(ggplot2)
library(plotly)
library(dplyr)

air_df <- read.csv("PM2.5_Global_Air_Pollution_2010-2017.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  output$Total_Country_Pollution <- renderPlotly({
    
    year_selected <- input$Year_selection
    
    filtered_df <- air_df %>% 
      filter(year_selected == max(year_selected))
    
    PM2.5_plot <- ggplot(data = filtered_df) +
      geom_bar(mapping = aes(x = ï..Country.Name, y = year_selected, fill = ï..Country.Name)) +
      labs(
        title = "3 Countries With Highest PM2.5 In Year Selected",
        xlab = "Country picked",
        ylab = "Total PM2.5",
        colour = "Country color code"
      )
    
    return(PM2.5_plot)
    
  })
  
}
