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


main_panel_plot <- mainPanel(
  plotlyOutput(outputId = "plot1")
)

conclusion_tab <- tabPanel(
  "Conclusion",
  fluidPage(
    h2("Conclusion"),
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


ui <- navbarPage(
  "Global PM 2.5 Exposure",
  intro_tab,
  first_tab,
  conclusion_tab
)
