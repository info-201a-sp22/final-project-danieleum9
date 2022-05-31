library(plotly)
library(bslib)

air_df <- read.csv("PM2.5_Global_Air_Pollution_2010-2017.csv", stringsAsFactors = FALSE)

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    p("")
  )
)

sidebar_panel_widget <- sidebarPanel(
  selectInput(
    inputId = "user_selection",
    label = "YOUR CODE HERE",
    choices = air_df$Country.Name,
    multiple = FALSE
  )
)


main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "plot1")
)

climate_tab <- tabPanel(
  "PM 2.5",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  )
)


ui <- navbarPage(
  "PM2.5 Levels",
  intro_tab,
  climate_tab
)
