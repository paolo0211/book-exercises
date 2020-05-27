# UI for scatterplot
library(shiny)
library(ggplot2)

# Get a vector of column names (from `mpg`) to use as select inputs
mpg_colname <- colnames(mpg)

# Create a variable `x_input` that stores a `selectInput()` for your
# variable to appear on the x axis of your chart.
# Use the vector of column names as possible values, and make sure
# to assign an inputId, label, and selected value

x_input <- selectInput(
  inputId = "x",
  label = "x variable for the chart",
  choices  = mpg_colname,
  selected = "displ"
)

# Using a similar approach, create a variable `y_input` that stores a
# `selectInput()` for your variable to appear on the y axis of your chart.
# Add a `selectInput` for the `y` variable

y_input <- selectInput(
  inputId = "y",
  label = "y variable for the chart",
  choices = mpg_colname,
  selected = "cyl"
)


# Create a variable `color_input` as a `selectInput()` that allows users to
# select a color from a list of choices
colors <- list("red" = "red", "yellow" = "yellow", "blue" = "blue")
color_input <- selectInput(
  inputId = "color",
  label = "choose a color",
  choices = colors
)


# Create a variable `size_input` as a `sliderInput()` that allows users to
# select a point size to use in your `geom_point()`
size_input <- sliderInput(
  inputId = "size",
  label = "size for the points in the chart",
  min = 0,
  max = 10,
  value = 0
)


# Create a variable `ui` that is a `fluidPage()` ui element. 
# It should contain:
ui <- fluidPage(
  h1("Scatter plot machine"),
  x_input,
  y_input,
  color_input,
  size_input,
  plotOutput(
    outputId = "scatter"
  )
)

  # A page header with a descriptive title


  # Your x input

  
  # Your y input

  
  # Your color input

  
  # Your size input

  
  # Plot the output with the name "scatter" (defined in `app_server.R`)

