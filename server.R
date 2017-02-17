
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(tidyverse)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    x    <- faithful[, 2]
    bins <- seq(min(x), max(x), length.out = input$bins + 1)

    # draw the histogram with the specified number of bins
    ggplot(faithful,aes(x=waiting))+
      geom_histogram(bins=input$bins,col='red',fill='lightblue')+
      coord_flip()
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')

  })

})
