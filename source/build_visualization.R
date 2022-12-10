# Building Visualization Function

# Loading libraries
library(plotly)
library(ggplot2)
library(dplyr)
library(tidyverse)

# GDP Function:
build_gdp <- function(df, input_country, input_year) {
  if(input_country == "Select Country") {
    return()
  } else {
    df <- df %>% 
      filter(country == input_country) %>% 
      filter(year >= input_year[1], year <= input_year[2])
    plot <- ggplot(df, aes(x = year, y = gdp)) +
      geom_line(color = "blue") +
      labs(title = paste0("GDP vs Time for ", input_country),
           x = "Years",
           y = "GDP (Gross Domestic Product)")
    return(plot)
  }
}

# CO2 Function:
build_co2 <- function(df, input_country, input_year) {
  if(input_country == "Select Country") {
    return()
  } else {
    df <- df %>% 
      filter(country == input_country) %>% 
      filter(year >= input_year[1], year <= input_year[2])
    plot <- ggplot(df, aes(x = year, y = co2)) +
      geom_line(color = "red") +
      labs(title = paste0("CO2 Emissions vs Time for ", input_country),
           x = "Years",
           y = "Annual CO2 Emissions")
    return(plot)
  }
}
