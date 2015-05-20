library(shiny)

shinyUI(fluidPage(
        
        titlePanel("The Central Limit Theorem (CLT) Demonstration"),
        hr(),
        
        sidebarLayout(
                sidebarPanel(
                        p("Please, select the type of distribution from which the random variables are selected, 
                                the size of each sample, and the number of samples to generate."),
                        hr(),
                        selectInput('distribution', 'Choose a distribution:', 
                                    c("Exponential(5)", "Standard Uniform", "Standard Normal", 
                                      "Student's t(df=5)", "Poisson(10)","Geometric(0.1)")),
                        sliderInput("sampleSize", "Sample Size", 1, 50, 5),
                        sliderInput('nSample', 'Number of Samples', min=100, max=5000, 
                                    value=1000, step=100),
                        h4('Mean of samples'),
                        verbatimTextOutput('mean')
                ),
        
                mainPanel(
                        p('You can see that the first plot of the sample shows that the sample follows the
                  original distribution very closely, but plot of the means of sample follows the normal
                  distribution as the sample size increases. At small sample sizes (less than 10) it is 
                  a hybrid between the 2 distributions.'),
                        br(),
                        fluidRow(
                                column(6, plotOutput('plot1', width = "100%")),
                                column(6, plotOutput('plot2', width = "100%"))
                        )
                )
        ),
        br(),
        wellPanel(
                
                        includeMarkdown("usermanual.rmd")
                
        )
))