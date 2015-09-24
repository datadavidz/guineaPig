library(shiny)

data(ToothGrowth)

toothPred <- function(method, dosage) {
  modFit <- lm(len ~ supp + dose, data=ToothGrowth)
  pred <- predict(modFit, data.frame(supp=method, dose=dosage))
  return(as.numeric(pred))
}

shinyServer(
  function(input, output) {
    output$odosage <- renderPrint({input$dosage})
    output$omethod <- renderPrint({input$method})
    output$prediction <- renderPrint({toothPred(input$method, input$dosage)})
  }
)