library(tmap)
library(mapproj)
library(rgdal)
source("maphelper.R")
Daly1 = readOGR("data", "BigD")
namesbigD = readLines("data/BigDnames.txt")
names(Daly1@data) = namesbigD

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      shapeF=Daly1
      response <- switch(input$resp,
                     "PSSP" = "PSSP",
                     "FEID" = "FEID",
                     "NonNativeA" = "NonNative1",
                     "NonNativeB" = "NonNative_",
                     "Native" = "Native_Cov",
                     "Bare Ground" = "BareGrnd",
                     "Perennial Grass" = "GRASSP",
                     "BRTE" = "BRTE",
                     "POBU" = "POBU",
                     "Rock" = "ROCK",
                     "POSE" = "POSE",
                     "Native Perennial Grass" = "GRSNATP",
                     "Perennial Shrub" = "SHRUBP",
                     "Moss" = "Moss",
                     "ONAC" = "ONAC",
                     "CIAR4" = "CIAR4",
                     "TACA8" = "TACA8",
                     "ELEL5" = "ELEL5",
                     "CADR" = "CADR",
                     "Perennial Forb" = "FORBP")

      Cvar1 <- switch(input$var1,
                      "SLOPE" = "SLOPE",
                      "ELEVATION" = "ELEVATION",
                      "ASPECT" = "ASPECT",
                      "Bare Ground" = "BareGrnd")

      Cvar2 <- switch(input$var2,
                      "SLOPE" = "SLOPE",
                      "ELEVATION" = "ELEVATION",
                      "ASPECT" = "ASPECT",
                      "Bare Ground" = "BareGrnd")

      mymap(shape = shapeF, response = response,
            var1 = Cvar1, var2 = Cvar2,
                  max1 = input$Dist1[2],
                  min1 = input$Dist1[1], max2 = input$Dist2[2], min2 = input$Dist2[1])
    })
  }
)