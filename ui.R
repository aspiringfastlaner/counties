
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(ggplot2)
library(dplyr)


shinyUI(fluidPage(

  # Application title
  titlePanel("USA Census Visualizations"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with information from the 2010 census"),
      selectInput(input = "var",
                  label = "Choose a Variable",
                  choices = list("Percent White", "Percent Black",
                                 "Percent Hispanic", "Percent Asian"),
                  selected = "Percent White")),

    # Show a plot of the generated distribution
    mainPanel(
      plotOutput(outputId = "map")
    )
  )
))
