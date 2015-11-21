library(shiny)
sf <- function(x, k){

  x/2 + 25* x/(1+x*x) + 8 * cos(1.2*k)
  
}



# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot

  output$distPlot <- renderPlot({
    set.seed(12345)
    
    nObs = 250 
    obsVariance <- input$Q
    nu <- rnorm(nObs, mean=0, sd=sqrt(obsVariance)) 
    xset = seq(1,nObs)
    xset[1] <- input$x0
    xset[2] <- sf(xset[1],1) + nu[1]
    xest = seq(1,nObs)
    xest[1] <- input$x0
    xest[2] <- sf(xest[1],1)


    for(i in 2:nObs-1){
      xset[i+1] <- sf(xset[i],i) + nu[i]
      xest[i+1] <- sf(xest[i],i)
    }
    
    
    
    

    par(mfcol=c(1,3)) 

    plot(seq(1,nObs), xest, type="n",xlab='Step', ylab='State Value without Noise' )
    lines(seq(1,nObs), xest) 
    
   
    
    plot(seq(1,nObs), xset, type="n", xlab='Step', ylab='State Value with Noise')
    lines(seq(1,nObs), xset) 

    
    plot(seq(1,nObs), xset-xest, type="n", xlab='Step', ylab='Noise Value')
    lines(seq(1,nObs), xset-xest) 

    
  })
})