Olive oil: correlations and clustering app
========================================================
author: Federico Calore
date: 22 December 2015
font-import: https://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700
font-family: 'Open Sans'
transition: linear

First Slide
========================================================

h4("App usage instructions"),
           p("The variable selected above will be plotted as scatter plot,
             grouped by color and/or shape. In addition to the 8 data variables,
             also the cluster id is available (recommended for grouping)."),
           p("The number of clusters to be generated can be changed using the slider."),
           p("The app will recalculate the clusters on the fly with the kmeans 
             algorithm, using only the data variables, and the new centers will 
             be shown in the table below the plot."),
           h4("Dataset"),
           

```r
library(pgmm); data(olive)
```

Italian Olive Oil
           
           p("Data on the percentage composition of eight fatty acids found by
             lipid fraction of 572 Italian olive oils. The data come from three
             regions: Southern Italy, Sardinia, and Northern Italy. Within each
             region there are a number of different areas.")


- Bullet 1
- Bullet 2
- Bullet 3

GGplot scatter
========================================================
transition: zoom



![plot of chunk unnamed-chunk-2](DDP assignment presentation-figure/unnamed-chunk-2-1.png) 

Clusters of observations
========================================================


```r
km <- kmeans(olive[3:10], centers = 3)
```

<small>1200.5815217, 1384.8490566, 1079.8920455, 113.875, 176.490566, 78.1647727, 235.6902174, 216.8113208, 236.25, 7317.6521739, 6890.740566, 7812.6988636, 1001.0543478, 1197.9716981, 697.1477273, 32.9402174, 34.0754717, 28.1534091, 63.6956522, 62.5377358, 46.8977273, 15.1467391, 22.4245283, 10.0681818</small>

Conclusions
========================================================
incremental: true
