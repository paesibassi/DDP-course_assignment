Olive oil: correlations and clustering app
========================================================
author: Federico Calore
date: 22 December 2015
font-import: https://fonts.googleapis.com/css?family=Open+Sans:400italic,700italic,400,700
font-family: 'Open Sans'
transition: linear

First Slide
========================================================

- Bullet 1
- Bullet 2
- Bullet 3

http://rpubs.com/SAScat/Project2
https://xiaodan.shinyapps.io/LegoSetViz

https://rpubs.com/senthilkumar_k/49447
https://senthilkumar-k.shinyapps.io/DevDataProd-CourseProject/

GGplot scatter
========================================================
transition: zoom



![plot of chunk unnamed-chunk-2](DDP assignment presentation-figure/unnamed-chunk-2-1.png) 

Clusters of observations
========================================================


```r
km <- kmeans(olive[3:10], centers = 3)
```

<small>1384.8490566, 1200.5815217, 1079.8920455, 176.490566, 113.875, 78.1647727, 216.8113208, 235.6902174, 236.25, 6890.740566, 7317.6521739, 7812.6988636, 1197.9716981, 1001.0543478, 697.1477273, 34.0754717, 32.9402174, 28.1534091, 62.5377358, 63.6956522, 46.8977273, 22.4245283, 15.1467391, 10.0681818</small>

Conclusions
========================================================
incremental: true