# library(shiny) USE THIS TO RUN THE APP  IN ANOTHER SCRIPT
# runApp("shinyProjectApp")
library(shiny)
shinyUI(fluidPage(
  titlePanel("CCmap visualization for Daly Creek"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create a CCmap from Daly Creek sampling data."),
      
      selectInput("resp", 
                  label = "Choose a response variable to display",
                  choices = c("PSSP", "FEID", "NonNativeA", "NonNativeB",
                              "Native", "Bare Ground", "Perennial Grass",
                              "BRTE", "POBU", "Rock", "POSE", "Native Perennial Grass",
                              "Perennial Shrub", "Moss", "ONAC", "CIAR4", "TACA8",
                              "ELEL5", "CADR", "Perennial Forb"), #MORE CHOICES HERE
                  selected = "PSSP"),
      selectInput("var1", 
                  label = "Choose a conditioning variable to display",
                  choices = c("SLOPE", "ASPECT", "ELEVATION", "Bare Ground"), #MORE CHOICES HERE
                  selected = "SLOPE"),
      selectInput("var2", 
                  label = "Choose a second conditioning variable to display",
                  choices = c("SLOPE", "ASPECT", "ELEVATION", "Bare Ground"), #MORE CHOICES HERE
                  selected = "ELEVATION"),
      
      sliderInput("Dist1", 
                  label = "Distribution of conditioning variable 1",
                  min = .01, max = .99, value = c(0, 1)),
      sliderInput("Dist2", 
                  label = "Distribution of conditioning variable 2",
                  min = .01, max = .99, value = c(0, 1))
      ),
    
    mainPanel(plotOutput("map"))
  )
))
