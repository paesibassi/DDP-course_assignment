library(shiny)
library("shinythemes")

shinyUI(fluidPage(theme = shinytheme("spacelab"),
  fluidRow(
    
    # Application title
    headerPanel("Italian olive oil dataset - correlations and clustering"),
    
    column(3, offset = 0,
           h4("Control panel"),
           selectInput("variableX", "Select a variable for X axis:",
                       list("Palmitic",
                            "Palmitoleic",
                            "Stearic",
                            "Oleic",
                            "Linoleic",
                            "Linolenic",
                            "Arachidic",
                            "Eicosenoic")),
           selectInput("variableY", "Select a variable for Y axis:",
                       list("Palmitic",
                            "Palmitoleic",
                            "Stearic",
                            "Oleic",
                            "Linoleic",
                            "Linolenic",
                            "Arachidic",
                            "Eicosenoic"),
                       selected = "Palmitoleic"),
           selectInput("variableC", "Group by color (optional):",
                       list("None" = "",
                            "Region",
                            "Area",
                            "Cluster"),
                       selected = "Cluster"),
           selectInput("variableS", "Group by shape (optional):",
                       list("None" = "",
                            "Region",
                            "Area",
                            "Cluster")),
           sliderInput("numK", "Select how many clusters to generate",
                       min = 1, max = 15, value = 3, step = 1),
           h4("App usage instructions"),
           p("The variable selected above will be plotted as scatter plot,
             grouped by color and/or shape. In addition to the 8 data variables,
             also the cluster id is available (recommended for grouping)."),
           p("The number of clusters to be generated can be changed using the slider."),
           p("The app will recalculate the clusters on the fly with the kmeans 
             algorithm, using only the data variables, and the new centers will 
             be shown in the table below the plot."),
           h4("Dataset"),
           strong("Italian Olive Oil"), br(),
           code("library(pgmm); data(olive)"),
           p("Data on the percentage composition of eight fatty acids found by
             lipid fraction of 572 Italian olive oils. The data come from three
             regions: Southern Italy, Sardinia, and Northern Italy. Within each
             region there are a number of different areas.")
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
