library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
        
        n <- reactive({input$sampleSize * input$nSample})
        
        sample <- reactive({if (input$distribution == "Standard Uniform"){
                runif(n())
        } else if (input$distribution == "Standard Normal"){
                rnorm(n())
        } else if (input$distribution == "Poisson(10)"){
                rpois(n(), 10)
        } else if (input$distribution == "Exponential(5)"){
                rexp(n(), 5)
        } else if (input$distribution == "Student's t(df=5)"){
                rt(n(), 5)
        } else if (input$distribution == "Geometric(0.1)"){
                rgeom(n(), 0.1)
        }})
        
        matrixform <- reactive({matrix(sample(),input$sampleSize)})
        means <- reactive({colMeans(matrixform())})
        ave <- reactive({mean(means())})
        stddev <- reactive({sd(means())})
        xmin <- reactive({ave() - 4*stddev()})
        xmax <- reactive({ave() + 4*stddev()})
        range <- reactive({seq(xmin(),xmax(),length.out=101)})
        normvalue <- reactive({dnorm(range(),ave(),stddev())})
        output$mean <- reactive({ave()})
        
        output$plot1 <- renderPlot({
                hist(sample(), breaks=50, xlab="Sample Value",
                     main="Histogram of All Samples")
        }, height=400)
        
        output$plot2 <- renderPlot({
                h <- hist(means(), breaks=50, xlab="Mean Value", xlim=c(xmin(),xmax()),
                          main="Histogram of Mean of Samples")
                normvalueplot <- normvalue()*diff(h$mids[1:2])*length(means())
                lines(range(), normvalueplot, col="blue", lwd=2)
                legend("topleft", "Theoretical Normal Distribution", col="blue", lwd=2)
        }, height=400)
        
        output$ran <- reactive({c(length(range),length(normplot))})
        
})