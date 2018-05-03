---
layout: page
slug: file-input
roxygen:
  rdname: ~
  name: fileInput
  doctype: ~
  title: Upload user files
  description: Upload files to the server.
  parameters:
  - name: id
    description: A character string specifying the HTML id of the file input.
  - name: placeholder
    description: |-
      A character string specifying the text inside the file
      input, defaults to `"Choose file"`.
  - name: left,right
    description: |-
      A character string or button element placed prepended or
        appended respectively to the file input. For more information refer to
        [inputGroup()].

        Clicking on an element specified by `right` also opens the file input
        dialog.
  - name: '...'
    description: |-
      Additional named arguments passed on as HTML attributes to the
      parent element.
  - name: multiple
    description: |-
      One of `TRUE` or `FALSE` specifying whether or not the user
      can upload multiple files at once, defaults to `TRUE`.
  - name: accept
    description: |-
      A character vector of possible MIME types or file extensions,
      defaults to `NULL`, in which case any file type may be selected.
  sections: ~
  examples: |
    if (interactive()) {
      shinyApp(
        ui = container(
          fileInput("upload") %>%
            margins(c(0, "auto", 0, "auto"))
        ),
        server = function(input, output) {
          observe({
            req(input$upload)
            print(input$upload)
          })
        }
      )
    }

    if (interactive()) {
      shinyApp(
        ui = container(
          fileInput(
            id = "upload",
            left = buttonInput(NULL, "Upload") %>%
              background("white") %>%
              border("green", -1)
          ) %>%
            margins(c("auto", 0, "auto", 0))
        ),
        server = function(input, output) {
          observe({
            req(input$upload)

            for (path in input$upload$datapath) {
              cat(readLines(path), "\n")
            }
          })
        }
      )
    }

    if (interactive()) {
      shinyApp(
        ui = container(
          fileInput("upload1") %>%
            margins(3),
          fileInput("upload2") %>%
            margins(3)
        ),
        server = function(input, output) {
          observeEvent(input$upload1, {
            cat("Upload 1:", input$upload1$name, "\n")
          })

          observeEvent(input$upload2, {
            cat("Upload 2:", input$upload2$name, "\n")
          })
        }
      )
    }
  aliases: ~
  family: ~
  export: no
  filename: file.R
  source:
  - fileInput <- function(id, placeholder = "Choose file", left = NULL,
  - '                      right = "Browse", ..., multiple = TRUE, accept = NULL)
    {'
  - '  if (is_tag(left) && !tagIs(left, "button")) {'
  - '    stop('
  - '      "invalid `fileInput()` argument, `left` must be a button element or ",'
  - '      "character string", call. = FALSE'
  - '    )'
  - '  }'
  - '  if (is_tag(right) && !tagIs(right, "button")) {'
  - '    stop('
  - '      "invalid `fileInput()` argument, `right` must be a button element or ",'
  - '      "character string", call. = FALSE'
  - '    )'
  - '  }'
  - '  if (!is.null(left)) {'
  - '    left <- tags$div(class = "input-group-prepend", if (is_tag(left)) {'
  - '      left'
  - '    }'
  - '    else {'
  - '      tags$span(class = "input-group-text", left)'
  - '    })'
  - '  }'
  - '  if (!is.null(right)) {'
  - '    right <- tags$div(class = "input-group-append", if (is_tag(right)) {'
  - '      right'
  - '    }'
  - '    else {'
  - '      tags$span(class = "input-group-text", right)'
  - '    })'
  - '  }'
  - '  tags$div('
  - '    class = "dull-file-input input-group", id = id,'
  - '    ..., left, tags$div(class = "custom-file", tags$input('
  - '      type = "file",'
  - '      class = "custom-file-input", multiple = if (multiple) {'
  - '        NA'
  - '      }'
  - '    ), tags$label('
  - '      class = "custom-file-label",'
  - '      placeholder'
  - '    )), right'
  - '  )'
  - '}'
---