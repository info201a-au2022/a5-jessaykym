# Shiny App Server

# Loading libraries
library(shiny)
library(dplyr)

# Sourcing files
source("./source/build_visualization.R")

# Read in data
data <- read.csv("https://raw.githubusercontent.com/owid/co2-data/master/owid-co2-data.csv")

# Data Wrangling
max_co2_2021 <- data %>% 
  filter(year == "2021") %>% 
  filter(iso_code != "") %>%
  filter(co2 != "NA") %>% 
  select(country, co2) %>% 
  filter(co2 == max(co2)) %>% 
  pull(country)

max_gdp_2018 <- data %>% 
  filter(year == "2018") %>% 
  filter(iso_code != "") %>% 
  filter(gdp != "NA") %>% 
  select(country, gdp) %>% 
  filter(gdp == max(gdp)) %>% 
  pull(country)

max_co2_year <- data %>% 
  filter(country == "China") %>% 
  filter(co2 != "NA") %>% 
  filter(co2 == max(co2)) %>% 
  pull(year)

countries <- data %>% 
  filter(iso_code != "") %>% 
  distinct(country) %>% 
  select(country)

year_range <- range(data$year)

plot_df <- data %>% 
  filter(iso_code != "") %>%
  select(country, year, gdp, co2)

# Summary Info
summary_info <- list()
summary_info$max_co2_2021 <- max_co2_2021
summary_info$max_gdp_2018 <- max_gdp_2018
summary_info$max_co2_year <- max_co2_year

# Shiny Server
server <- function(input, output) {
  output$gdp_visual <- renderPlotly({
    return(build_gdp(plot_df, input$country, input$year))
  })
  
  output$co2_visual <- renderPlotly({
    return(build_co2(plot_df, input$country, input$year))
  })
}