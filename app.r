library(shiny)
install.packages('rsconnect')
source("app_ui.r")
source("app_server.R")

shinyApp(ui, server)