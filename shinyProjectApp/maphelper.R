mymap = function(shape, response, var1, var2, min1, max1, min2, max2){
  
  mydata = shape@data 
  
  mydata["facet1"] = mydata[var1]
  
  mydata["facet2"] = mydata[var2]
  
  mybreaks1 = quantile(mydata$facet1, probs = c(0, min1, max1, 1), na.rm = TRUE)
  
  mybreaks2 = quantile(mydata$facet2, probs = c(0, min2, max2, 1), na.rm = TRUE)
  
  names = c('Low', 'Med', 'High')
  
  cutvar1 = cut(mydata$facet1, breaks = mybreaks1, labels = paste(names, var1))
  
  cutvar2 = cut(mydata$facet2, breaks = mybreaks2, labels = paste(names, var2))
  
  mydata2 = cbind(mydata, cutvar1, cutvar2)
  mydata2$cutvar1 = factor(mydata2$cutvar1, levels(mydata2$cutvar1)[c(3,2,1)]) 
  #cutvar3 = cut(mydata$facet)
  
  shape@data = mydata2
  shape2 = shape
  
  #make the map
  mytmap = tm_shape(shape2) +
    tm_fill(response, 
            palette = "Greens",
            colorNA = "grey60", 
            legend.show = TRUE,
            title= paste(response, "cover")) + 
    tm_facets(c("cutvar1", "cutvar2"), showNA=F, free.coords=F, drop.units = F, scale.factor = 6) +
    tm_layout(outer.margins=c(.05,0,.05,0), 
              inner.margins=c(0,0,.02,0), asp=0) +
    tm_legend(text.size = 1,
              title.size = 2,
              position = c("right", "top"),
              bg.color = "white",
              frame = "black")
  mytmap
}