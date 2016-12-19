library(shiny)


shinyServer(function(input, output) {
  
  
  V = read.csv("V.csv",header=TRUE)
  output$score <- renderText({
    paste("Predicted Score for the innings is:", round(input$runs + V[input$balls,input$wickets+1], digits=0))
  })
  
  
})