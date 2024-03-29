#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinydashboard
#' @import shinydashboardPlus
#' @noRd
app_ui <- function(request) {
  tagList(

    dashboardPage(
      dashboardHeader(title = "Basic dashboard"),
      ## Sidebar content
      dashboardSidebar(
        sidebarMenu(
          menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
          menuItem("Widgets", tabName = "widgets", icon = icon("th"))
        )
      ),

      ## Body content
      dashboardBody(
        tabItems(
          # First tab content
          tabItem(tabName = "dashboard",
                  fluidRow(
                    box(plotOutput("plot1", height = 250)),

                    box(
                      title = "Controls",
                      sliderInput("slider", "Number of observations:", 1, 100, 50)
                    )
                  )
          ),

          # Second tab content
          tabItem(tabName = "widgets",
                  h2("Widgets tab content")
          )
        )
      )



    ) #dashboardPage

    # Leave this function for adding external resources
    # golem_add_external_resources(),
    # # Your application UI logic
    # fluidPage(
    #   h1("GolemTestApp")
    # )
  ) #taglist
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "GolemTestApp"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
