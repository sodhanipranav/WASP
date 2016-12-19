library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel(""),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      
      numericInput("target",
                  label = "Target",min = 0,max = 450,value = 300),
      numericInput("runs", 
                  label = "Runs Made", min = 0, max = 300,value = 110),
      numericInput("wickets", 
                  label = "Wickets Down", min = 0, max = 10,value = 0),
      numericInput("balls", 
                  label = "Balls Bowled", min = 1, max = 300,value = 120),  
    
    submitButton("Submit")
  ),
    # Show a plot of the generated distribution
    mainPanel(
      verbatimTextOutput("probability")
      
      
    )
  )
)
)