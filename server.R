#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
isGenerated <- FALSE
# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  isolate({
  randomNumbers <- reactive({
    input$goButton
    isolate(data.frame(X=runif(200, 0, 1), Y=runif(200, 0, 1)))
    })
  })
  
  data <- reactive({
    randomNumbers()[1:input$numbers, ]
  })
  
  meanX <- reactive({mean(data()$X)})
  meanY <- reactive({mean(data()$Y)})
  output$statsMeanX <- reactive({paste0("X_mean: ", format(meanX(), digits = 2, nsmall = 2))})
  output$statsMeanY <- reactive({paste0("Y_mean: ", format(meanY(), digits = 2, nsmall = 2))})
  
  output$distPlot <- renderPlot({
    ggplot(data(), aes(X, Y)) +
      geom_point(size=2) +
      scale_x_continuous(breaks=seq(0, 1, 0.25), minor_breaks = NULL, limits=c(0, 1)) +
      scale_y_continuous(breaks=seq(0, 1, 0.25), minor_breaks = NULL, limits=c(0, 1)) +
      geom_vline(xintercept=meanX()) +
      geom_hline(yintercept=meanY())
  })
})


