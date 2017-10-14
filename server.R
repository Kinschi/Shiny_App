library(shiny)
shinyServer(function(input,output) {
  output$plot1 <- renderPlot({
    
    stock_selected <- input$text
    xlab <- ifelse(input$show_xlab, "Date", "")
    ylab <- ifelse(input$show_ylab, "Stock Price", "")
    main <- ifelse(input$show_title, "Stock price development of the selected stock", "")
    
    library(quantmod)
    getSymbols(stock_selected,src="yahoo")
    stock1 <- as.data.frame(get(stock_selected))
    library(data.table)
    stock1 <- setDT(stock1, keep.rownames = TRUE)[]
    stock1 <- stock1[order(rn, decreasing=TRUE),]
    stock1_date <- stock1[1:10,1]
    stock1_price <- stock1[1:10,7]
    names(stock1_price)[1] <- "adj_price" 
    
    plot(strptime(stock1_date$rn, '%Y-%m-%d'), as.numeric(stock1_price$adj_price), xlab=xlab, ylab=ylab, main=main)})})