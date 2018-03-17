library(shiny)
library(datasets)
data(iris)

shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Iris Species Predictor"),
  # Sidebar with a slider input for features 
    sidebarPanel(
      p('Slide the bars below to input Sepal and Petal length and width
        measurements:'),
      
      sliderInput("s1", label = strong("Sepal Length"), value=5, min=4.3, 
                  max=7.9, step = 0.1),
      sliderInput("s2", label = strong("Sepal Width"), value=3, min=2, 
                  max=4.4, step = 0.1),
      sliderInput("p1", label = strong("Petal Length"), value=3, 
                  min=1, max=6.9, step = 0.1),
      sliderInput("p2", label = strong("Petal Width"), value=2, min=0.1, 
                  max=2.5, step = 0.1)
    ),
    
    mainPanel(
      p('When Sepal and Petal length and width measurements are input,
        click the button below:'),
      submitButton("Predict Species"),
      
      h3('Iris Species:'),
      verbatimTextOutput("pred")
    )
))