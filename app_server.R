library(shiny)
library(tidyverse)
library(dplyr)
library(plotly)

Carbon_data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

#Figure out what year had the highest cases of CO2 emmision 
carbon_emmision_highest <- Carbon_data %>% 
  drop_na() %>% 
  filter(co2 == max(co2)) %>% 
  pull(year) 

#Figure out what year had the lowest cases of CO2 emmision 
carbon_emmision_lowest <- Carbon_data %>% 
  drop_na() %>% 
  filter(co2 == min(co2)) %>% 
  pull(year) 
  
#Figure out what country had the highest number of Co2 emmision cases 
country_highest_cases <- Carbon_data %>% 
  drop_na() %>% 
  filter(co2 == max(co2)) %>% 
  pull(country) 
  country_highest_cases
  
#Figure out what country had the highest number of Co2 emmision cases 
country_lowest_cases <- Carbon_data %>% 
    drop_na() %>% 
    filter(co2 == min(co2)) %>% 
    pull(country) 
  country_highest_cases

#Figure out what country has the highest Co2 energy per unit
Co2_country_energy <- Carbon_data %>% 
  filter(co2_per_unit_energy == max(co2_per_unit_energy, na.rm = TRUE)) %>% 
  pull(country)
  Co2_country_energy


  

server <- function(input, output){
  output$messages <- renderText({
    msg <- paste("The carbon emmission caused by co2 was highest in 2018", +
                 carbon_emmision_highest)
    return(msg)
  output$messages <- renderText({
    msg <- paste("The carbon emmision caused by co2 was lowest in 2016", +
                   carbon_emmision_lowest)
    return(msg)
  output$messages <- renderText({
    msg <- paste("The country with the highest co2 energy per unit is Kuwait", +
                   Co2_country_energy)
    return(msg)
    
  })
  })
  })
  
  #Aggregate by country
  plot <- function(country, population) {
    co2_country_emmision <- Carbon_data %>% 
      filter(country %in% input$country)
    filter(population %in% input$population)
    return(co2_country_emmision)
  }
  
  
  output$graph <- renderPlotly({
     ggplot(plot(input$country)) +
      geom_bar(mapping = aes(x = country, y = population, color = country)) +
      labs(x = "Country", y = "population", title = "Co2 effect of country by population") +
      coord_flip()
  })  
}
  
  

  
  
  
    

  


