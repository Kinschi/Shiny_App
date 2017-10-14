library(shiny)
shinyUI(fluidPage(
   sidebarLayout(
    
    sidebarPanel(
      textInput("text", "Which stock would you like to be shown (insert the stock symbol, e.g. AAPL for Apple or FB for Facebook)?", value="AAPL"),
      checkboxInput("show_xlab", "Show/Hide X Axis Label", value=TRUE),   
      checkboxInput("show_ylab", "Show/Hide Y Axis Label", value=TRUE),   
      checkboxInput("show_title", "Show/Hide Title", value=TRUE)),
      
    mainPanel(
      h3("Graph of selected stock"),
      plotOutput("plot1")))))
