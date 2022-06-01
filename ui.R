library(plotly)
library(bslib)
library(dplyr)


air_df <- read.csv("PM2.5_Global_Air_Pollution_2010-2017.csv", stringsAsFactors = FALSE)

intro_tab <- tabPanel(
  "Introduction",
  fluidPage(
    p("Climate change is a daunting reality obstructing the quality-of-life for future generations. The amount of CO2 in the atmosphere is often mentioned within this conversation, but the amount of pollution in the air is scarcely motioned. PM2.5 is a very common pollutant in the air. PM2.5 is very bad for people as it can cause coughing and sneezing in the short term, but later, could lead to heart disease, lung cancer and other major life threatening issues (reference). The questions we are seeking to answer from our analysis including what changes in air pollution over the last decade for the whole world? Which countries had the highest levels of air pollution? What phases of industrialization are the countries in that are producing the most and least air pollution? How can we utilize the data that we collected to predict future air pollution outcomes?

The dataset we are using to answer the questions was founded on kaggle.com(dataset). The data was collected by Karl Weinmeister. The data was collected through the World Bank website. The data was collected to show the historical air quality data from 2010-2017 for 240 countries. The possible challenges and limitations we might encounter while implementing this project include the accuracy of national data, whether there were unique situations leading to increased PM2.5 air pollution in certain countries, and background information the population and development level of a country. we should focus more on countries that have larger populations or developed because the air pollution changes of these countries could be closer to reality. The pattern we are going to find in these countries could be more reliable to do further research in this field.
"),
    img(src='https://static.euronews.com/articles/stories/06/09/80/96/1100x619_cm
sv2_0492db39-425d-56e4-a14a-3f63b8f7d94f-6098096.jpg', align = "left", height="50%", width="50%", align="right") 
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
    choices = edit_df$Year,
    multiple = FALSE
  )
)


sidebar_panel_widget3 <- sidebarPanel(
  radioButtons("radio", label = h3("Checkbox group"), 
               choices = list("2010" = "2010", "2011" = "2011", "2012" = "2012",
                               "2013" = "2013", "2014" = "2014", "2015" = "2015",
                               "2016" = "2016", "2017" = "2017"), selected = "2010")
)

main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "plot1")
)

main_panel_plot2 <- mainPanel(
  plotlyOutput(outputId = "plot2")
)

main_panel_plot3 <- mainPanel(
  plotlyOutput(outputId = "plot3")
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

third_tab <- tabPanel(
  "Countries PM 2.5 Choropleth", 
  sidebarLayout(
    sidebar_panel_widget2, 
    main_panel_plot2
  )
)


second_tab <- tabPanel(
  "Finland, Nepal, and U.S.",
  sidebarLayout(
    sidebar_panel_widget3,
    main_panel_plot3
  ),
  em("The reasoning as to why these three countries were chosen was to compare the countries with the highest exposure of PM2.5 in 2017--as Nepal had the highest PM2.5 exposure in 2017 and Finland had the lowest PM2.5 exposure in 2017. The United States was also incorporated into the chart to help visualize where one of most advanced country sits in terms of PM2.5 levels compared to Nepal and Finland.", align = "center")
)

ui <- navbarPage(
  "Global PM 2.5 Exposure",
  intro_tab,
  first_tab,
  second_tab,
  third_tab,
  conclusion_tab
)
