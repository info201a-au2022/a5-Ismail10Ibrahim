library(shiny)
library(dplyr)
library(plotly)
library(ggplot2)

read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")


firstpage <- tabPanel(
  "Introduction",
  titlePanel("Co2 Emmision Results & Effects"),
  fluidPage(
    img("", src = "https://iea.imgix.net/69f767b9-6676-4345-a1ea-9dc410ae5990/GettyImages-1303511343.png?auto=compress%2Cformat&fit=min&q=80&rect=0%2C0%2C3991%2C2245&w=2120&fit=crop&fm=jpg&q=70&auto=format&h=1193"),
    p(uiOutput('introduction')),
  h2("Introduction into Co2 Emmision"),
  p("The CO2 Commission is a body that is responsible for overseeing the implementation 
    of measures aimed at reducing carbon dioxide (CO2) emissions. CO2 is a greenhouse gas 
    that is released into the atmosphere through the burning of fossil fuels, such as coal and oil,
    and is a major contributor to climate change. The CO2 Commission typically works with governments, 
    businesses, and other organizations to develop and implement policies and programs that reduce CO2 emissions and promote the use of clean energy sources. 
    This can include things like setting emissions standards for industries, supporting the development of renewable energy technologies, and providing incentives 
    for individuals and businesses to reduce their own CO2 emissions."),
  h3("What does Malta do to reduce its Co2 emmision effects?"),
  p("Malta, like all countries, has CO2 emissions. CO2 is a greenhouse gas that is released into the atmosphere through the burning of fossil fuels, 
  such as coal and oil, and is a major contributor to climate change. It has a responsibility to reduce its CO2 emissions in order to mitigate the impacts 
    of climate change and help create a more sustainable future."),
  h3("How can society reduce the affect of Co2 inhalation and contact of it?"),
  p("One of the main ways that society can reduce the effects of CO2 inhalation and 
    contact is by reducing the amount of CO2 that is released into the atmosphere. 
    This can be achieved by transitioning to cleaner forms of energy, such as renewable 
    energy sources like wind and solar power, and implementing policies and programs that 
    encourage individuals and businesses to reduce their own carbon emissions. Additionally, 
    improving air quality through measures such as limiting vehicle emissions and reducing 
    industrial pollution can also help reduce the impact of CO2 on human health.")
)
)

secondpage<- tabPanel(
  "Chart Bar",
  titlePanel("Countries by Co2 emmision effect"),
  chart_sidebar <- sidebarPanel(
    selectInput(inputId = "first_country_chart",
                label = "Choose a Country",
                selected = "World",
                choice = country_highest_cases),
    selectInput(inputId = "second_Country_chart",
                label = "Choose Another Country",
                selected = "Malta",
                choice = country_lowest_cases)),
  chart_main <- mainPanel(plotlyOutput("chart")),
                                                     
  p("")
)

ui <- navbarPage(
  tags$title("Ismail's Co2 emmision research page"),
  firstpage,
  secondpage
)