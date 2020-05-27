# Libraries
library(plotly)
library(shiny)

# ui.R
ui <- fluidPage(
  mainPanel(
    # Add a selectInput that allows you to select a variable to map
    selectInput(
      inputId = "map_var",
      label = "select a variable to map",
      choices = list("Population" = "population",
                     "Vote" = "votes")
    ),
    
    # Use `plotlyOutput()` to show your map
    plotlyOutput(
      outputId = "plot"
    )
  )
)