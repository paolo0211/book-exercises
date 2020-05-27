### Exercise 5 ###
library(shiny)
library(ggplot2)
# Create a shiny server that creates a scatterplot. 

# It should use an `input` with features: `x_var`, `y_var`, `color`, and `size`
# Save the result of `renderPlot` to output$scatter
server <- function(input, output) {
  output$scatter <- renderPlot ({ 
    plot <- ggplot(data = mpg) +
      geom_point(mapping = aes_string(x = input$x, y = input$y),
      size = input$size,
      color = input$color) +
      labs(x = input$x, y = input$y)
    return(plot)
  })
}