library(shiny)

shinyUI(
  pageWithSidebar(
 
  headerPanel("Converting Centimeters to Inches"), #title of application
  
  sidebarPanel(
    numericInput('CM', 'Enter length to convert in centimeters (up to 250 cm)', 0, min=0, max=1000,),
    submitButton('Submit')
    #tags$head(tags$style("#text1{color:red; font-size: 20px; font-style: italic;}"))
  ),
  
  mainPanel(
    
  h3('Results of conversion to inches'),
  h4('You entered this many centimeters:'),
  verbatimTextOutput("inputValue"),
  h4('Which resulted in a conversion of this many inches:'),
  verbatimTextOutput("prediction"), 
  plotOutput('newPlot')
    )
  ))