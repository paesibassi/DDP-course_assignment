library(shiny)
library(ggplot2)
library(pgmm)
data(olive)
olive$Region <- as.factor(olive$Region)
olive$Area <- as.factor(olive$Area)
olive$Cluster <- NA

shinyServer(function(input, output) {
  
  # Generate main description text
  formulaText <- reactive({
    t <- paste("Plotted using",
          input$variableX, "and",
          input$variableY)
    if (input$variableC != "" | input$variableS != "") {
      t <- paste(t, " and grouping by")
    }
    if (input$variableC != "") {
      t <- paste(t, input$variableC, "as color")
    }
    if (input$variableC != "" & input$variableS != "") {
      t <- paste(t, ",")
    }
    if (input$variableS != "") {
      t <- paste(t, input$variableS, "as shape")
      }
    t <- paste(t, ".")
  print(t)
  })
  
  output$selection <- renderText({
    formulaText()
  })
  
  # Generate clusters
  km <- reactive({
    kmeans(olive[, 3:10], centers = input$numK)
  })
  
  oliveC <- reactive({
    olive[, 11] <<- as.factor(km()$cluster)
    olive
  })
  
  # Generate scatter ggplot
  output$olivePlotGG <- renderPlot({
    g <- ggplot(data = oliveC(), aes_string(x = input$variableX, y = input$variableY)) +
      geom_point(size = 3)
    if (input$variableC != "") {g <- g + aes_string(color = input$variableC)}
    if (input$variableS != "") {g <- g + aes_string(shape = input$variableS)}
    print(g)
  }) #, height = 600)
  
  # Generate description texts
  clustersD <- reactive({
    paste("Generated", input$numK, "clusters; sizes and centers in the tables here below.")
  })
  
  output$numClusters <- renderText({
    clustersD()
  })
  output$cenClusters <- renderDataTable({
    cbind(
      data.frame("Cl.Size"=km()$size),
      round(km()$centers, digits = 2)
    )
  }, options = list(orderClasses = TRUE,
                    paging = FALSE,
                    searching = FALSE,
                    searchable = FALSE))
})
