#Libraries
library(shiny)
library(ggplot2)

#Data set copy
useddata <- diamonds

#Application
shinyUI(
  navbarPage("Data Set Explorer",
             #First Tab
             tabPanel("About this App",
                      #Explaining the App
                      wellPanel(
                        h4("Welcome!"),
                        helpText("This Shiny App is created for the 'Developing Data Products' course of Coursera.
                                 I focused for this course on a basic application (no fancy machine learning) to work with the shiny package.
                                 Using this App you'll be able to explore the 'Diamond' dataset. It is from the 'ggplot2' package."),
                        helpText(a("Diamond Prices Data Set's Reference",href="http://www.inside-r.org/packages/cran/ggplot2/docs/diamonds"))
                        
                        ),
                      #hr(),
                      wellPanel(
                        h4("About the Diamond data set"),
                        helpText("This data set containing the prices and other attributes of almost 54,000 diamonds. The variables are as follows:")
                        
                        ),
                      tags$ul(
                                tags$ul(
                                  tags$li(
                                    "price: price in US dollars (326$--18,823$)"
                                  ),
                                  tags$li(
                                    "carat: weight of the diamond (0.2--5.01)"
                                  ),
                                  tags$li(
                                    "cut: quality of the cut (Fair, Good, Very Good, Premium, Ideal)"
                                  ),
                                  tags$li(
                                    "colour: diamond colour, from J (worst) to D (best)"
                                  ),
                                  tags$li(
                                    "clarity: a measurement of how clear the diamond is (I1 (worst), SI1, SI2, VS1, VS2, VVS1, VVS2, IF (best))"
                                  ),
                                  tags$li(
                                    "depth: total depth percentage = z / mean(x, y) = 2 * z / (x + y) (43--79)"
                                  ),
                                  tags$li(
                                    "table: width of top of diamond relative to widest point (43--95)"
                                  ),
                                  tags$li(
                                    "x: length in mm (0--10.74)"
                                  ),
                                  tags$li(
                                    "y: width in mm (0--58.9)"
                                  ),
                                  tags$li(
                                    "z: depth in mm (0--31.8)"
                                  )
                                )
                               
                      ),
                      #hr(),
                      wellPanel(
                        h4("App functionalities"),
                        helpText("With this app you'll be able to, basically:"),
                        tags$ul(
                          tags$li(h5("Plot the data:"),
                                  tags$ul(
                                    tags$li(
                                      "Plot X vs Y plots with any of the variables contained."
                                    ),
                                    tags$li(
                                      "Color the data points by category."
                                    )
                                  )
                          )
                        )
                      )
                      ),
             #Second Tab
             tabPanel("How to use this App",
                      wellPanel(
                        h4("Navigate the App:"),
                        helpText("This App is structured with a navigation bar panel of 4 tabs: About this App,
                                 How to use this App, Plot  and Reference Sources and Code. Nobody wants to read 
                                 this so go on to the Plot tab and have fun with my tiny shiny application.")
                        ),
                      wellPanel(
                        h4("How to use the Plot:"),
                        helpText("As you can see on the Plot tab, first you can select the variables to plot. By default will be shown
                                 a 'carat' vs 'cut' plot color coded by 'price'. By using these selectboxes you have access to the
                                 variables stored at 'Diamond' dataset (previously downloaded automatically by using the
                                 datasets R library) and select the variables you want to plot. Under them you can see 4
                                 checkboxes which allow you to plot the measures points"),
                        helpText("At the right of this panel the plot is shown, it refreshes the new information
                                 you selected at the checkbox just in a second. Notice labels on both axes are
                                 displayed according to selected variables. This is also implemented on the 'server.R'."),
                        helpText("Below these a big panel with 4 subpanels is shown. These subpanels will allow
                                 the user to control some parameters of the data displayed on the plot (from left to right):"),
                        tags$ul("",
                                tags$li(tags$b("Data Information:"), "See the maximum, minimum and average value for X and Y selected and plotted variables"),
                                tags$li(tags$b("Color Section:"), "Select the line and/or the fill color/s for each element plotted, such as, the fit line, the data area, data points or lines;
                                        simply click on the desired tab element and again click on the rectangle with the HEX characters for the RGB color,
                                        then just choose your desired color on the pannel that popped out."),
                                tags$li(tags$b("X and Y Axis Zoom on Plot:"), "Zoom In the X and/or Y variables with these sliders. Two text boxes will show
                                        the maximum and minimum values now shown (after zooming) on the plot, for X and Y variables, so you can
                                        get a better image of data plotted (i.e., to see which days or months in 1974 had days on which Temperature was
                                        over 80F).")
                                )
                                )
                                ),
             #Third Tab
             tabPanel("Plot",
                      pageWithSidebar(
                        headerPanel("Example Explorer of the Diamonds data set"),
                        #Panel defining the input variables
                          sidebarPanel(
                                #Default x is carat
                                selectInput('x', 'Select the data for the x-axis of the plot', names(useddata)),
                                #Default y is set to cut
                                selectInput('y', 'Select the data for the y-axis of the plot', names(useddata), 
                                      names(useddata)[[2]]),
                                #Default category is set to price
                                selectInput('color', 'Color data by category', names(useddata),names(useddata)[[7]]
                          )    
                        ),
                        #Panel creating the plot
                        mainPanel(
                           plotOutput('plot')
                           )
                      )
             ),
             #Fourth Tab
             tabPanel("Reference Sources",
                      tabsetPanel(
                        #Second level tab 1
                        tabPanel("Shiny informations",
                                 wellPanel(
                                   h4("Basic Notions:"),
                                   helpText("The whole App is structured with a 'navbarPage'.
                                            Basically this Shiny interface widget creates the top navigation bar shown at the top of it and
                                            the title is defined. Then each one of the tabs you want to create on this bar,
                                            has to be inserted using the function 'tabPanel'. Then, if you look up the code at 'ui.R' file
                                            you'll find a basic (huge) structure with a 'navBarPage' with as many 'tabPage' inside it as
                                            tabs in the top bar of the App. See Shiny reference below:"),
                                   helpText(a("Shiny Ref: navbarPage",href="http://shiny.rstudio.com/reference/shiny/latest/navbarPage.html")),
                                   helpText(a("Shiny Ref: Application Layour Guide(tabPage explained on it)",href="http://shiny.rstudio.com/articles/layout-guide.html")),
                                   helpText("Additionally, I used a lot the 'wellPanel' function in this App. Do you see the 'gray-shadowed rectangle'
                                            under this text? Well, that's a 'wellPanel'."),
                                   helpText(a("Shiny Ref: wellPanel", href="http://shiny.rstudio.com/reference/shiny/latest/wellPanel.html")),
                                   helpText("Let's have a look at the User Interface. So Shiny is a kind of html based
                                            App creator, and that makes it possible to use a bunch of html parameters for improving your App.
                                            If you don't know anything about HTML I'm refering to bold titles, headers, tabs, separators, lists, and all this stuff
                                            used  for the App. See the Shiny reference below:"),
                                   helpText(a("Shiny Ref: User-interface", href="http://shiny.rstudio.com/tutorial/lesson2/")),
                                   h4("Control Widgets"),
                                   helpText("Control widgets are interface tools that allow the user to communicate with the App.
                                            They can be buttons, text input boxes, checkboxes, radio buttons, etc...
                                            They make your App interactive. With them you can insert values and
                                            variables to your main R function (which is stored and specified at 'server.R' file, and
                                            which will do the hard calculation job). The control widgets
                                            are called in the 'ui.R' file (user interface), and then its value can be got at the
                                            'server.R' value by simply using the 'input$' prefix (followed by the widget ID). See the
                                            Shiny reference and documentation about control widgets below:"),
                                   helpText(a("Shiny Ref: Control widgets Tutorial",href="http://shiny.rstudio.com/tutorial/lesson3/")),
                                   helpText(a("Shiny Ref: Widget Gallery", href="http://shiny.rstudio.com/gallery/widget-gallery.html"))
                                   )
                                   ),
                        #Second level tab 2
                        tabPanel("Reference for libraries used",
                                 wellPanel(
                                   h4("shiny"),
                                   helpText("Necessary package to create and run Shiny Apps."),
                                   helpText(a("Shiny Ref: Get started with Shiny",href="http://shiny.rstudio.com/tutorial/lesson1/")),
                                   h4("ggplot2"),
                                   helpText("Package used to create better-looking plots."),
                                   helpText("Furthermore, necessary package to get the diamond data set."),
                                   helpText(a("R Ref: package ggplot2",href="http://cran.r-project.org/web/packages/ggplot2/index.html"))
                                 )
                        ),
                        tabPanel("Github Link",
                                 wellPanel(
                                   h4("DDP"),
                                   helpText(a("The Github repository containing the code for this application.",href="https://github.com/DRLR/DDP/"))
                   
                                 )
                        )
                        )
                        )
             
             )
  )