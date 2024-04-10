#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import shinyMobile
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic

    shinyMobile::f7Page(
      title = "Project ACCESS ScreenU Portal",
      options = list(theme=c("auto"), dark=TRUE, preloader = F,  pullToRefresh=F),
      allowPWA=TRUE,
      f7TabLayout(
        # panels are not mandatory. These are similar to sidebars
        navbar = f7Navbar(
          title= "ScreenU Screeners"),

        # f7Tabs is a special toolbar with included navigation
        f7Tabs(
          animated = TRUE,
          id = "tabs",
          f7Tab(
            tabName = "PortalTab",
            icon = f7Icon("house"),
            active = TRUE,
            hidden= T,
            f7Block(
              f7Shadow(
                intensity = 5,
                hover = TRUE,
                f7Card(
                  f7Align(h2("Click to start a screener"), side = c("center")),
                  br(),
                  f7Segment(container = c("segment"),
                  f7Button("alc","Alcohol Use Screener", href = "https://app.screenu.org/screening/6ba7997a-d6d2-492c-8a2b-bb2841bd014d?demo"),
                  f7Button("cannabis", "Cannabis Use Screener", href = "https://app.screenu.org/screening/ea3784d1-ddfc-4171-a59e-26ed55740941?demo"),
                  f7Button("rx", "Prescription Drug Screener", "href = https://app.screenu.org/screening/5af1f17d-4277-436c-8ebc-c7936fb761c9?demo")),
                  footer = NULL,
                  hairlines = F, strong = T, inset = F, tablet = FALSE)),
            )
          )
        )
      )
    )
  )
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
  # add_resource_path(
  #   "www",
  #   app_sys("app/www")
  # )

  tags$head(
    favicon(),
    # bundle_resources(
    #   path = app_sys("app/www"),
    #   app_title = "MassBaselineCleaner"
    # )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()

    HTML('<link rel="stylesheet" type="text/css" href="https://ewokozwok.github.io/MHScreener/www/framework7.bundle.min.css">')

  )
}
