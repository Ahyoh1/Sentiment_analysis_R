library(shiny)
library (tm)
library(wordcloud)

function(input, output, session) {
  wc_data <- reactive({
    input$update
    
    isolate({
      withProgress({
        setProgress(message = "Processing corpus...")
        getTermMatrix(input$selection)
    })
  })
})


worldcloud_rep <- repeatable(wordcloud)

output$plot <- renderPlot({
  wc_corpus <- wc_data()
  wordcloud(names(wc_corpus), wc_corpus, min.freq = input$freq, 
            max.words=input$max, 
            colors = brewer.pal(8, "Dark2"), 
            scale = c(8,0.3))
  })
}
