library(shiny)
source("ui.R")
source("server.R")
library(rsconnect)
library(markdown)

shinyApp(ui = ui, server = server)

