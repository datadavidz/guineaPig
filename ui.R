library(shiny)

shinyUI(pageWithSidebar(
  headerPanel("Guinea Pig Tooth Care"),
  sidebarPanel(
    h3("Guinea Pig Treatment Protocol"),
    radioButtons("method", "Delivery method:", c("Orange Juice" = "OJ", "Ascorbic Acid" = "VC")),
    sliderInput("dosage", "Dosage level (mg):", value=0.5, min=0.5, max=2, step = 0.5),
    submitButton("Submit")
  ),
  mainPanel(
    h3("Instructions"),
    p("This app will predict the mean length of your guinea pig's odontoblast (tooth) cells based 
      on a specific Vitamin C treatment protocol. Select the delivery method and adjust the dosage
      level using the controls on the left and then hit the Submit button.  The predicted mean 
      length of the odontoblast cells will appear below."),
    h3("Prediction"),
    h4("For dosage level:"),
    verbatimTextOutput("odosage"),
    h4("And using delivery method as:"),
    verbatimTextOutput("omethod"),
    h4("Results in a predicted mean length of odontoblast cells (um):"),
    verbatimTextOutput("prediction")
  )
))
