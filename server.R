
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)

shinyServer(function(input, output) {

  #output$selected_var = renderText(
  #  paste("You chose ", input$var)
  #)
  
  output$map = renderPlot({
    
    counties = reactive({
      race = readRDS("data/counties(1).rds")
      counties_map = map_data("county")
      counties_map = counties_map %>%
        mutate(name = paste(region, subregion, sep = ","))
      
      left_join(counties_map, race, by = "name")
    })
    
    inputrace = switch(input$var,
                       "Percent White" = counties()$white,
                       "Percent Black" = counties()$black,
                       "Percent Hispanic" = counties()$hispanic,
                       "Percent Asian" = counties()$asian
    )
    
    ggplot(counties(), aes(x = long, y = lat, group = group,
                         fill = inputrace)) +
      geom_polygon(color = "white") +
      scale_fill_gradient(low = "white", high = "darkred") +
      theme_void()

  })

})
