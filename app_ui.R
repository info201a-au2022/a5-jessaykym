# Shiny App UI

# Loading libraries
library(shiny)

# Sourcing files
source("./app_server.R")

# Introduction Page
introduction <- fluidPage(
  h1("Does CO2 Emissions Correlate with GDP (Gross Domestic Product)?"),
  p("CO2 emissions are the amount of carbon dioxide that is released into the atmosphere 
    as a result of human activities, such as the burning of fossil fuels for energy. These 
    emissions are a major contributor to global warming, which is the ongoing rise in the 
    average temperature of the Earth's atmosphere and oceans. GDP, or Gross Domestic Product,
    is a measure of the economic output of a country or region. It is often used as an indicator
    of the overall health of an economy, as well as a way to compare the relative size of 
    different economies. There may be a relationship between CO2 emissions and GDP, as economic 
    growth and development often involve the use of energy, which can result in the emission of 
    greenhouse gases. However, the exact nature of this relationship is complex and varies 
    depending on factors such as the mix of industries in a given economy, the availability of 
    renewable energy sources, and the effectiveness of policies aimed at reducing emissions.", 
    style = "font-size: 16px"),
  p("To start answering this question we can look at some interesting points in the data and have
    some benchmarks about our data.", style = "font-size: 16px"),
  h2("Which Country has the Highest CO2 Emissions in 2021?"),
  p("From our data set, we can see that the country with the highest CO2 emissions in 2021 was:", 
    style = "font-size: 18px"),
  strong(summary_info$max_co2_2021, style = "font-size: 18px"),
  h2("Which Country has the Highest GDP in 2018 (Most Recent GDP Recording in Data Set)?"),
  p("From our data set, we can see tha tthe country with the highest GDP in 2018 was:", 
           style = "font-size: 18px"),
  strong(summary_info$max_gdp_2018, style = "font-size: 18px"),
  h2("What Year did the Country with the Highest GDP have its Highest CO2 Emission?"),
  p("From our data set, we can see that China had the most CO2 emission and GDP in the most
           recent dates that have been recorded. The year where China had the most CO2 emission was:", 
           style = "font-size: 18px"),
  strong(summary_info$max_co2_year, style = "font-size: 18px")
)

# User Input for Visualization
input_country <- selectInput(
  inputId = "country",
  label = "Choose a Country",
  choices = c("Select Country", countries$country),
  selected = "Select Country"
)

# User Slider Input for Visualization
input_year_range <- sliderInput(
  inputId = "year",
  label = "Select a Time Frame",
  min = year_range[1],
  max = year_range[2],
  value = year_range
)

# Visualization Page
visualization1 <- fluidPage(
  h1("CO2 Emissions vs GDP in Each Country"),
  sidebarLayout(
    sidebarPanel(
      input_country,
      input_year_range,
      h4("Description"),
      p("The lines graphs will show the relationship between CO2 emissions and GDP over time for a given
        country.", style = "font-size: 16px"),
      h4("Findings"),
      p("The overall trend that we see from the graphs for each country is that when GDP increases, then
        so does CO2 emissions. This is a general trend, meaning that there are other factors that we are 
        missing from our graphs when it comes to how CO2 emissions and GDP are calculated each year in each
        country.", style = "font-size: 16px")
    ),
    mainPanel(
      plotlyOutput("gdp_visual"),
      plotlyOutput("co2_visual"),
      p("Note: There are two graphs because of the range of values for CO2 emissions and GDP. The difference in 
        values was too great to see if there was a relationship between CO2 emissions and GDP on a single graph.")
    )
  )
)

# Navigation UI
navigation <- navbarPage(
  title = "CO2 Emissions and GDP Comparison",
  tabPanel("About", introduction),
  tabPanel("Visualizations", visualization1)
)

# Shiny UI
ui <- fluidPage(
  img(src = "backgroundimage (1).jpeg", width = "100%"),
  navigation
)
