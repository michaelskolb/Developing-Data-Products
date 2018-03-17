Iris Species Predictor
========================================================
author: Michael Kolb
date: 3/17/2018
autosize: true

Summary
========================================================

This Shiny application issues an iris species prediction from the 
following flower measurements:

- Sepal length
- Sepal width
- Petal length
- Petal width

Link to Shiny application: https://michaelskolb.shinyapps.io/IrisPredictor/

How to use the predictor
========================================================

* Slide each bar to input sepal and petal flower measurements
* Press the Predict Species button in the panel on left
* Note the species in the panel on right

What the predictor does
========================================================

* The Predict Species button passes flower measurements input to
  the Shiny user interface panel as outputs to the Shiny server
* Each flower measurement is then included as a variable to predict
  species from a random forest model on Shiny server, which has been 
  trained with Iris data
* The iris species identified as most likely is then passed back
  to the Shiny user interface as text

The Shiny user interface
========================================================

R code implements each slider bar and Predict Species button

<!--html_preserve--><div class="col-sm-4">
<form class="well">
<div class="form-group shiny-input-container">
<label class="control-label" for="s1">
<strong>Sepal Length</strong>
</label>
<input class="js-range-slider" id="s1" data-min="4.3" data-max="7.9" data-from="5" data-step="0.1" data-grid="true" data-grid-num="9" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-keyboard-step="2.77777777777778" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="s2">
<strong>Sepal Width</strong>
</label>
<input class="js-range-slider" id="s2" data-min="2" data-max="4.4" data-from="3" data-step="0.1" data-grid="true" data-grid-num="8" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-keyboard-step="4.16666666666667" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="p1">
<strong>Petal Length</strong>
</label>
<input class="js-range-slider" id="p1" data-min="1" data-max="6.9" data-from="3" data-step="0.1" data-grid="true" data-grid-num="9.83333333333333" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-keyboard-step="1.69491525423729" data-data-type="number"/>
</div>
<div class="form-group shiny-input-container">
<label class="control-label" for="p2">
<strong>Petal Width</strong>
</label>
<input class="js-range-slider" id="p2" data-min="0.1" data-max="2.5" data-from="2" data-step="0.1" data-grid="true" data-grid-num="8" data-grid-snap="false" data-prettify-separator="," data-prettify-enabled="true" data-keyboard="true" data-keyboard-step="4.16666666666667" data-data-type="number"/>
</div>
<div>
<button type="submit" class="btn btn-primary">Predict Species</button>
</div>
</form>
</div><!--/html_preserve-->

The Shiny server predictive model
========================================================

* R code implements random forest model, rf, from Iris data


```r
train<-iris[,-5]
labels<-iris[,5]
rf<-randomForest(train, labels, importance=TRUE)
```

* Flower measurements are passed as data.frame inputs to predict from rf


```r
x1<-as.numeric(input$s1)
x2<-as.numeric(input$s2)
x3<-as.numeric(input$p1)
x4<-as.numeric(input$p2)
      
test<-data.frame(x1,x2,x3,x4)
levels(labels)[predict(rf,newdata=test)]
```
