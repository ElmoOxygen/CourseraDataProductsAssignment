shinyServer(function(input,output,session) {
  
  ingTable <- reactiveValues()
  ingTable$df <- data.frame(Ingredients = numeric(0), 
                            Weight.grams = numeric(0), 
                            OriginalMeasure = numeric(0))
  
  observeEvent(input$submit, 
    if (input$submit > 0) {
      isolate({volml <- input$Volume * as.numeric(units[grep(paste("^", input$Unit, sep = ""),
                                                             colnames(units))])
      ing <- (paste("^", input$Ingredient, "$", sep = ""))
      conv <- food[grep(ing, x = food[ , 1], perl = TRUE), 2]
      weight <- (volml * conv)
      result <- c(input$Ingredient, weight, 
                  paste(input$Volume, input$Unit))})
      ingTable$df[input$submit,] <- result
    })
  
  output$result <- renderDataTable({
    if (input$submit > 0) {ingTable$df}
    else {data.frame(Ingredients = "NA", 
                     Weight.grams = "NA",
                     OriginalMeasure = "NA")}
    })
  
  output$chart <- renderPlot({
       if (input$submit > 0) {
            g <- ggplot(data=ingTable$df, 
                        aes(x=100, 
                            y=as.numeric(Weight.grams), 
                            fill=as.factor(Ingredients)))
            g <- g + geom_bar(stat="identity", position="fill", width=1)
            g <- g + coord_polar(theta="y")
            g <- g + guides(fill=guide_legend(title="Ingredients"))
            g <- g + theme(axis.ticks = element_blank(), 
                           axis.text.x = element_blank(),
                           axis.text.y = element_blank(),
                           axis.line = element_blank(),
                           axis.title.x = element_blank(),
                           axis.title.y = element_blank())
            g
       }
       else {}
  })
  output$test <- renderText({
       str(ingTable$df)
  })
  
  })