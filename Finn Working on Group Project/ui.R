
library(plotly)
library(bslib)

air_df <- read.csv("PM2.5_Global_Air_Pollution_2010-2017.csv", stringsAsFactors = FALSE)

my_theme <- bs_theme(bg = "#87CEEB", 
                  fg = "white", 
                  primary = "black",
) 


sidebar_panel_widget <- sidebarPanel(
  radioButtons(
    inputId = "year_selection",
    label = "Pick Year of Graph",
    choices = c("X2010", "X2011", "X2012", "X2013", "X2014", "X2015", "X2016", "X2017"),
    selected = "X2017"
  )
)

main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "Total_Country_Pollution"),
  
)

climate_tab <- tabPanel(
  "Climate Viz",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot,
  )
)

ui <- navbarPage(
  theme = my_theme,
  "Countries with most PM 2.5",
  climate_tab
)

