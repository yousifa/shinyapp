library(shiny)

shinyServer(function(input, output) {
     
     data(mtcars)
     str(mtcars)
     autoTrans<-mean(mtcars$mpg[mtcars$am==0])
     manTrans<-mean(mtcars$mpg[mtcars$am==1]);
     data.frame(autoTrans,manTrans)
     
     confid<-t.test(mtcars$mpg ~ factor(mtcars$am))
     minC<-confid$conf.int[1]
     maxC<-confid$conf.int[2]
     data.frame(minC,maxC)
     
     model1<-glm(mpg~as.factor(cyl)+as.factor(vs)+as.factor(am)+as.factor(gear)+as.factor(carb)+disp+hp+drat+wt+qsec, 
                 data=mtcars)
     model2<-glm(mpg ~ as.factor(cyl)+as.factor(am)+hp+wt,
                 data=mtcars)
     layout(matrix(c(1,2,3,4),2,2))
     
     pairs(mpg ~ ., data = mtcars)
     
     attach(mtcars)
     
     
     
     output$Plot <- renderPlot({
          
          

          plot(hp, mpg, type=input$typ, xlab="HP", cex=1.2, ylab="MPG", main="MPG v. HP")
     })
})