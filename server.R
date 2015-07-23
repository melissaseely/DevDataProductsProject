##Your Shiny Application

#1. Write a shiny application with associated supporting documentation. 
#The documentation should be thought of as whatever a user will need 
#to get started using your application.
#
#2.Deploy the application on Rstudio's shiny server
#
#3. Share the application link by pasting it into the text box below
#
#4. Share your server.R and ui.R code on github

#The application must include the following:

#1. Some form of input (widget: textbox, radio button, checkbox, ...)
#2. Some operation on the ui input in sever.R
#3. Some reactive output displayed as a result of server calculations
#4. You must also include enough documentation so that a novice user 
#could use your application.
#5. The documentation should be at the Shiny website itself. Do not post 
#to an external link.

#The Shiny application in question is entirely up to you. However, 
#if you're having trouble coming up with ideas, you could start from 
#the simple prediction algorithm done in class and build a new algorithm 
#on one of the R datasets packages. Please make the package simple for 
#the end user, so that they don't need a lot of your prerequisite 
#knowledge to evaluate your application. You should emphasize a simple 
#project given the short time frame.  



library(shiny)
library(UsingR)
datafile <- read.csv(("centimeters.csv"), na.strings=c("NA","#DIV/0!", ""))

convertCMtoIN <- function(CM) CM/2.54

shinyServer(
  function(input, output){
  output$inputValue <- renderPrint({input$CM})
  output$prediction <- renderPrint({convertCMtoIN(input$CM)})
  output$newPlot <- renderPlot({
    plot(datafile$centimeters, datafile$inches, xlab = 'Centimeters', ylab = 'Inches')
    cm <-  input$CM
    lines(c(cm, cm), c(0,20000), col="red", lwd=5)
    grid(12, col="lightgray", lty = "dotted", lwd = 1)
  })
  }
)
