library(shiny)
library("shinythemes")

shinyUI(fluidPage(theme = shinytheme("spacelab"),
  fluidRow(
    
    # Application title
    headerPanel("Italian olive oil dataset - correlations and clustering"),
    
    column(3, offset = 0,
           h4("Control panel"),
           selectInput("variableX", "Main variable for X axis:",
                       list("Palmitic",
                            "Palmitoleic",
                            "Stearic",
                            "Oleic",
                            "Linoleic",
                            "Linolenic",
                            "Arachidic",
                            "Eicosenoic")),
           selectInput("variableY", "Secondary variable for Y axis:",
                       list("Palmitic",
                            "Palmitoleic",
                            "Stearic",
                            "Oleic",
                            "Linoleic",
                            "Linolenic",
                            "Arachidic",
                            "Eicosenoic"),
                       selected = "Palmitoleic"),
           selectInput("variableC", "Grouping by color:",
                       list("None" = "",
                            "Region",
                            "Area",
                            "Cluster"),
                       selected = "Cluster"),
           selectInput("variableS", "Grouping by shape:",
                       list("None" = "",
                            "Region",
                            "Area",
                            "Cluster")),
           sliderInput("numK", "Number of clusters",
                       min = 1, max = 15, value = 3, step = 1)
    ),
    
    column(8,
           fluidRow(
             h4("Scatter plot of variables and groupings", align = "center"),
             textOutput("selection"),
             plotOutput("olivePlotGG")
           ),
           fluidRow(
             h4("Clusters of observations", align = "center"),
             textOutput("numClusters"),
             p(" "),
             column(12, offset = 0,
                    dataTableOutput("cenClusters")
                    )
           )
    )
  )
))
