library (shiny)

fluidPage(
        titlePanel("Word Cloud"),
        sidebarLayout(
          sidebarPanel(
            selectInput("selection", "Upload a test file",
                        choices = re_),
            actionButton("update","Go!"),
            hr(),
            sliderInput("freq",
                        "Minimum Frequency:",
                        min = 1,  max = 50, value = 15),
            sliderInput("max",
                        "Maximum Number of Words:",
                        min = 1,  max = 300,  value = 100)
          ),
          mainPanel(
            plotOutput("plot")
          )
        )
      )


