#' Grid layout
#'
#' These functions are the foundation of any application. Grid elements are
#' nested as follows: `container() > columns() > column() ~ column()`. A
#' `column()` may be created with an explicit width, 1 through 12. To fit a
#' column automatically to its content use `width = "content"`. To divide the
#' space in a row evenly amongst all columns use `width = "equal"`. For examples
#' and usage tips see the sections below.
#'
#' @param ... Any number of tags elements passed as child elements or named
#'   arguments passed as HTML attributes to the parent element.
#'
#' @param width A [responsive] argument. One of `1:12`, `"content"`, or
#'   `"equal"`, defaults to `"equal"`.
#'
#' @param centered One of `TRUE` or `FALSE` specifying how a container fills the
#'   browser or viewport window. If `TRUE` the container is responsively
#'   centered, otherwise, if `FALSE`, the container occupies the entire width of
#'   the viewport, defaults to `FALSE`.
#'
#' @family layout functions
#' @export
#' @examples
#'
#' ### Equal width columns
#'
#' container(
#'   columns(
#'     column(
#'       "Aliquam erat volutpat."
#'     ),
#'     column(
#'       "Mauris mollis tincidunt felis."
#'     ),
#'     column(
#'       "Cum sociis natoque penatibus et magnis dis parturient montes,",
#'       "nascetur ridiculus mus."
#'     )
#'   )
#' )
#'
#' ###  Shiny's panel with sidebar layout
#'
#' container(
#'   columns(
#'     column(
#'       width = 4,
#'       card(
#'         title = "Sidebar",
#'         formGroup(
#'           label = "Control 1",
#'           selectInput("control1", "...")
#'         ),
#'         formGroup(
#'           label = "Control 2",
#'           selectInput("control2", "...")
#'         ),
#'         formGroup(
#'           label = "Control 3",
#'           selectInput("control3", "...")
#'         )
#'       )
#'     ),
#'     column(
#'       d4("Main panel")
#'     )
#'   )
#' )
#'
#' ### Mobile friendly grids
#'
#' # Use `column()`s [responsive] `width` argument to make mobile friendly
#' # applications.
#'
#' container(
#'   columns(
#'     column(
#'       width = c(sm = 4),
#'       "Mauris ac felis vel velit tristique imperdiet."
#'     ),
#'     column(
#'       width = c(sm = 4),
#'       "Nam vestibulum accumsan nisl."
#'     ),
#'     column(
#'       width = c(sm = 4),
#'       "Proin neque massa, cursus ut, gravida ut, lobortis eget, lacus."
#'     )
#'   )
#' )
#'
#' # or
#'
#' container(
#'   columns(
#'     column(
#'       width = c(sm = 4),
#'       "Aenean in sem ac leo mollis blandit."
#'     ),
#'     column(
#'       width = c(sm = 8),
#'       "Nulla posuere. In id erat non orci commodo lobortis."
#'     )
#'   )
#' )
#'
#' ### Fit columns to their content
#'
#' container(
#'   columns(
#'     column(),
#'     column(
#'       width = "content",
#'       "Cras placerat accumsan nulla. Aenean in sem ac leo mollis blandit."
#'     ),
#'     column()
#'   )
#' )
#'
column <- function(..., width = "equal") {
  dep_attach({
    width <- resp_construct(width, c(1:12, "equal", "content"))
    width <- lapply(width, function(x) if (x == "content") "auto" else x)

    classes <- resp_classes(width, "col")

    # `col-*-equal` classes are actually `col-*`
    # "equal" is a placeholder
    classes <- gsub("-equal$", "", classes)

    tag_class_add(tags$div(...), classes)
  })
}

#' @rdname column
#' @export
columns <- function(...) {
  dep_attach({
    tags$div(class = "row", ...)
  })
}

#' @rdname column
#' @export
container <- function(..., centered = FALSE) {
  dep_attach({
    tags$div(
      class = if (centered) "container" else "container-fluid",
      ...
    )
  })
}
