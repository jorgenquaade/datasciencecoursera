
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
shinyUI(fluidPage(
    titlePanel("Choose horse power and weight to get an estimated MPG"),
    sidebarLayout(
        sidebarPanel(
            sliderInput("slider1", "What is the Horsepower of the car?", 50, 400, value = 150),
            sliderInput("slider2", "What is the Weight of the car? (in pounds)", 1000, 6000, value = 3200),
            h3("Predicted MPG based on Horsepower"),
            textOutput("pred1"),
            h3("Predicted MPG based on weight"),
            textOutput("pred2")            
        ),
        mainPanel(
            plotOutput("plot1"),
            plotOutput("plot2")
        )
    )
))