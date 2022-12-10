# Shiny App

# Loading libraries
library(shiny)
library(rsconnect)

# Sourcing ui and server files
source("app_ui.R")
source("app_server.R")

# Run the application
shinyApp(ui = ui, server = server)