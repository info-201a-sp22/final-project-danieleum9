library(plotly)
library(bslib)

air_df <- read.csv("PM2.5_Global_Air_Pollution_2010-2017.csv", stringsAsFactors = FALSE)

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    h1("PM2.5 Global Air Pollution 2010-2017", align = "center"),
    em(h2("Introduction")),
    p("write intro here")
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

sidebar_panel_widget2 <- sidebarPanel(
  selectInput(
    inputId = "Year_selection",
    label = "YOUR CODE HERE",
    choices = choropleth_data_df$Year,
    multiple = FALSE
  )
)

main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "plot1")
)

main_panel_plot2 <- mainPanel(
  plotlyOutput(outputId = "plot2")
)

conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    em(h2("Conclusion")),
    p("write conclusion here")
  )
)

first_tab <- tabPanel(
  "Countries PM 2.5 Chart",
  sidebarLayout(
    sidebar_panel_widget,
    main_panel_plot
  )
)

second_tab <- tabPanel(
  "Countries PM 2.5 Choropleth", 
  sidebarLayout(
    sidebar_panel_widget2, 
    main_panel_plot2
  )
)

ui <- navbarPage(
  "Global PM 2.5 Exposure",
  intro_tab,
  first_tab,
  second_tab,
  conclusion_tab
)
