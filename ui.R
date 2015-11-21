shinyUI(
     fluidPage(
          title = "Volume to Weight Conversion for Cooking",
          fluidRow(
               column(width = 12, align = "center",
                      h1("Volume to Weight Conversion for Cooking"))),
          fluidRow(
               column(width = 3, 
                      selectInput("Ingredient", 
                                  "Choose Ingredient:", 
                                  as.vector(food[,1]))),
               column(width = 3,
                      numericInput("Volume", "Volume:", 1, 0, 1000000000)),
               column(width = 3,
                      selectInput("Unit", label="Unit",
                                  choices=c("Cups", "Tablespoon", "teaspoon",
                                            "Pints", "Quarts", "Gallons",
                                            "Milliliters", "Liters", 
                                            "Fluid Ounces"))),
               column(width = 3, 
                      actionButton("submit", "Add Ingerdient"))),
          fluidRow(
               column(8, 
                      h5(dataTableOutput("result"))),
               column(4, 
                      h5(plotOutput("chart")))),
          fluidRow(
               h2("Instructions"),
               column(12, includeText("instructions.txt"))
          )
))