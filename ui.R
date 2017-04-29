#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Random numbers (Data Products project by PK)"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h4("Intro"),
      p("This is a simple Shiny application submitted as a project for Coursera's Data Products course."),
      h4("How to use"),
      p("Move the slider to change the number of random numbers on the graph."),
      p("Push button to regenerate numbers."),
      p("The means of X and Y values are displayed at the bottom. They appear also as guidelines. on the graph"),
      sliderInput("numbers", "Number of numbers:", min=0, max=200, value=50),
      actionButton("goButton", "Generate new numbers"),
      br(),
      textOutput("statsMeanX"),
      textOutput("statsMeanY")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
       plotOutput("distPlot")
    )
  )
))
