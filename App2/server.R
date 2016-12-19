library(shiny)


shinyServer(function(input, output) {
  
  load("P.Rdata")
  #V = read.csv("V.csv",header=TRUE)
  output$probability <- renderText({
    paste("Winning probability is:", round(P[input$target-input$runs+6,input$balls,input$wickets+1]*100,digits = 0),"%")
  })
  
  
})