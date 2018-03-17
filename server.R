data(iris)
train<-iris[,-5]
labels<-iris[,5]
suppressPackageStartupMessages(library(randomForest))

rf<-randomForest(train, labels, importance=TRUE)

shinyServer(
  
  function(input, output) {
    
    output$pred<-renderText({
      
      x1<-as.numeric(input$s1)
      x2<-as.numeric(input$s2)
      x3<-as.numeric(input$p1)
      x4<-as.numeric(input$p2)
      
      test<-data.frame(x1,x2,x3,x4)
      names(test)<-c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")
    
      levels(labels)[predict(rf,newdata=test)]
    })    
  }
)