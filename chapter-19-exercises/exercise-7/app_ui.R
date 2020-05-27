# ui.R
library(shiny)
library(plotly)

# Define a variable `map_sidebar_content` that is a `sidebarPanel()` for your
# first (map) page that contains:
map_sidebar_content <- sidebarPanel(
  selectInput(
    inputId = "map_var",
    label = "select variable to map",
    choices = list("votes" = "votes",
                   "population" = "population")
  )
)
  # An input to select variable to map

# Define a variable `map_main_content` that is a `mainPanel()` for your
# first (map) page that contains the `plotlyOutput()` of your map
map_main_content <- mainPanel(
  plotlyOutput(
    outputId = "map"
  )
)

# Create a variable `map_panel` that stores a `tabPanel()` for your first page
# It should include the following:
map_panel <- tabPanel(
  "map",
  sidebarLayout(
    map_sidebar_content,
    map_main_content
  )
)
  # A `sidebarLayout()` that contains...
    
    # Your `map_sidebar_content`
    
    # Your `map_main_content`


# Define a variable `scatter_sidebar_content` that is a `sidebarPanel()` for 
# your second (scatter) page that contains:
# - a `textInput()` widget for searching for a state in your scatter plot
scatter_sidebar_content <- sidebarPanel(
  textInput(
    inputId = "scatter_var",
    label = "search for a state"
  )
)

# Define a variable `scatter_main_content` that is a `mainPanel()` for your
# second (scatter) page that contains the `plotlyOutput()` of your scatter
scatter_main_content <- mainPanel(
  plotlyOutput(
    outputId = "scatter"
  )

)

# Create a variable `scatter_panel` that stores a `tabPanel()` for your 2nd page
# It should include the following:
scatter_panel <- tabPanel(
  "scatter plot",
  sidebarLayout(
    scatter_sidebar_content,
    scatter_main_content
  )
)
  # Add a titlePanel to your tab
  
  # Create a sidebar layout for this tab (page)
    
    # Display your `scatter_sidebar_content`
    
    
    # Display your `scatter_main_content`
    
# Define a variable `ui` storing a `navbarPage()` element containing
# your two pages defined above
ui <- navbarPage(
  "exercise",
  map_panel,
  scatter_panel
)
