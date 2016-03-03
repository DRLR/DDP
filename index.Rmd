---
title: "Interactive analysis of the diamond data set"
author: "Lars (Data Science Practioner)"
highlighter: highlight.js
output:
  html_document:
    number_sections: yes
    toc: yes
job: Pitch Presentation for Coursera Course
knit: slidify::knit2slides
mode: selfcontained
hitheme: tomorrow
subtitle: Developing Data Products
framework: io2012
widgets: bootstrap
---

## Reproducible Pitch Coursera 

### See the Developing Data Products Course Project  

- Find here all the data that have been used for this presentation and also for the first part of the data Science Project: "First, you will create a Shiny application and deploy it on Rstudio's servers. Second, you will use Slidify or Rstudio Presenter to prepare a reproducible pitch presentation about your application." Therefore, an interactive explorator for the Diamonds data set was build. Have fun exploring this data set.

- "The Data Science Lab at Johns Hopkins is about all things data science. We produce courses, develop software, prototype apps, conduct research, and generally spread the word about data science. We believe that the intelligent application of data science skills can have a profound impact across all areas of our lives."

### Find all details here
URL: *https://www.coursera.org/learn/data-products*
URL: *https://www.coursera.org/learn/data-products/peer/tMYrn/course-project-shiny-application-and-reproducible-pitch*
URL: *http://jhudatascience.org/about/*

---

## Diamonds Dataset

### Diamonds Data Set Examples


```r
library(ggplot2)
head(diamonds, 10)
```

```
##    carat       cut color clarity depth table price    x    y    z
## 1   0.23     Ideal     E     SI2  61.5    55   326 3.95 3.98 2.43
## 2   0.21   Premium     E     SI1  59.8    61   326 3.89 3.84 2.31
## 3   0.23      Good     E     VS1  56.9    65   327 4.05 4.07 2.31
## 4   0.29   Premium     I     VS2  62.4    58   334 4.20 4.23 2.63
## 5   0.31      Good     J     SI2  63.3    58   335 4.34 4.35 2.75
## 6   0.24 Very Good     J    VVS2  62.8    57   336 3.94 3.96 2.48
## 7   0.24 Very Good     I    VVS1  62.3    57   336 3.95 3.98 2.47
## 8   0.26 Very Good     H     SI1  61.9    55   337 4.07 4.11 2.53
## 9   0.22      Fair     E     VS2  65.1    61   337 3.87 3.78 2.49
## 10  0.23 Very Good     H     VS1  59.4    61   338 4.00 4.05 2.39
```

---

## Diamond Dataset - Format

**A data frame with 53'940 rows and 10 variables.**

| Index | Field | Detail |
------- | ----- | ------ |
| [, 1] | price | price in US dollars (\$326--\$18,823) |
| [, 2]  | carat | weight of the diamond (0.2--5.01) |
| [, 3]	| cut | quality of the cut (Fair, Good, Very Good, Premium, Ideal) |
| [, 4]	| colour | diamond colour, from J (worst) to D (best) |
| [, 5]	| clarity | a measurement of how clear the diamond is (I1 (worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF (best)) |
| [, 6]	| x | length in mm (0--10.74) |
| [, 7]	| y | width in mm (0--58.9) |
| [, 8]	| z | depth in mm (0--31.8) |
| [, 9]	| depth | total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43--79) |
| [,10]	| table | width of top of diamond relative to widest point (43--95) |


---

## Analysis - code for interactive plotting of the diamond data set

```r
  #Reactive data set copy
  useddata <- reactive(diamonds)
  
  #Generate output for the plot in the application
  output$plot <- renderPlot({
    #Create plot based on input variables
    g <- ggplot(useddata(), aes_string(x=input$x, y=input$y)) + geom_point()
    #Do color coding by category
    g <- g + aes_string(color=input$color)
    #final plot available
    print(g)

```
