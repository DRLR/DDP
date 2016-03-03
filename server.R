#Libraries
library(shiny)
library(ggplot2)

#Application
function(input, output) {
  
  #Reactive data set copy
  useddata <- reactive(diamonds)
  
  #Generate output for the plot in the application
  output$plot <- renderPlot({
    #Create plot based on input variables
    g <- ggplot(useddata(), aes_string(x=input$x, y=input$y)) + geom_point()
    #Do color coding by category
    g <- g + aes_string(color=input$color)
    #final plot available
    print(g)
    
  }, height=700, width=700)
  
}