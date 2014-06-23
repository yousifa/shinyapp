library(shiny)

shinyUI(pageWithSidebar(
     
     headerPanel("MPG V. HP"),
     
     sidebarPanel("This data is from the mtcars dataset, which contains information of many types of cars. 
                  We are displaying data for MPG vs the HorsePower of the cars.",br(),br(),
                  "Select the style of graph you would like to display below:",br(),br(),
          radioButtons("typ",
                       "Type of graph:",
                       list("Points" = "p",
                            "Histogram" = "h"))
         
     ),
     
     mainPanel(
          plotOutput("Plot")
     )
))