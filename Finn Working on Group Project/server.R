library(ggplot2)
library(plotly)
library(dplyr)

air_df <- read.csv("PM2.5_Global_Air_Pollution_2010-2017.csv", stringsAsFactors = FALSE)

server <- function(input, output) {
  
  output$Total_Country_Pollution <- renderPlotly({
    
    year_selected <- input$Year_selection
    
    filtered_df <- edit_df %>% 
      filter(Year == input$Year_selection)
    
    PM2.5_plot <- ggplot(data = filtered_df) +
      geom_col(mapping = aes(x = ï..Country.Name, y = Year, fill = ï..Country.Name)) +
      labs(
        title = "3 Countries With Highest PM2.5 In Year Selected",
        xlab = "Country picked",
        ylab = "Total PM2.5",
        colour = "Country color code"
      )
    
    ggplotly(PM2.5_plot)
    
  })
  
}
