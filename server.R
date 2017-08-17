
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

    model1 <- lm(mpg ~ hp, data = mtcars)
   
    model1pred <- reactive({
        hpInput <- input$slider1
        predict(model1, newdata = data.frame(hp = hpInput))
    })
    
    output$plot1 <- renderPlot({
        hpInput <- input$slider1
        plot(mtcars$hp, mtcars$mpg, xlab = "Horsepower",
             ylab = "MPG", bty = "n", pch = 16,
             xlim = c(0, 400), ylim = c(0, 50))
        title(main = "Measured and predicted MPG based on Horsepower")
        abline(model1, col = "blue", lwd = 2)
 
        points(hpInput, model1pred(), col = "blue", pch = 16, cex = 2)

    })
    output$pred1 <- renderText({
        model1pred()
    })
    
    model2 <- lm(mpg ~ wt, data = mtcars)
    
    model2pred <- reactive({
        wtInput <- input$slider2/1000
        predict(model2, newdata = data.frame(wt = wtInput))
    })
    
    output$plot2 <- renderPlot({
        wtInput <- input$slider2/1000
        plot(mtcars$wt, mtcars$mpg, xlab = "Weight",
             ylab = "MPG", bty = "n", pch = 16,
             xlim = c(1.000, 6.000), ylim = c(0, 50))
        title(main = "Measured and predicted MPG based on Weight")
        abline(model2, col = "blue", lwd = 2)
        points(wtInput, model2pred(), col = "blue", pch = 16, cex = 2)
        
    })
    output$pred2 <- renderText({
        model2pred()
    })   
    
})