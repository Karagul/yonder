% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/design.R
\name{float}
\alias{float}
\title{Float}
\usage{
float(tag, side)
}
\arguments{
\item{tag}{A tag element.}

\item{side}{A \link{responsive} argument. One of \code{"left"} or \code{"right"} specifying
the side to float the element.}
}
\description{
Use \code{float()} to float an element to the left or right side of its parent
element. A newspaper layout is a classic usage where an image is floated with
text wrapped around.
}
\examples{

### Newspaper layout

div(
  div() \%>\%
    width(5) \%>\%
    height(5) \%>\%
    margin(right = 2) \%>\%
    background("amber") \%>\%
    float("left"),
  p(
    "Fusce commodo. Nullam tempus. Nunc rutrum turpis sed pede.",
    "Phasellus lacus.  Cras placerat accumsan nulla.",
    "Fusce sagittis, libero non molestie mollis, ",
    "magna orci ultrices dolor, at vulputate neque nulla lacinia eros."
  ),
  p(
    "Nulla facilisis, risus a rhoncus fermentum, tellus tellus",
    "lacinia purus, et dictum nunc justo sit amet elit."
  ),
  p(
    "Proin neque massa, cursus ut, gravida ut, lobortis eget, lacus.",
    "Aliquam posuere.",
    "Sed id ligula quis est convallis tempor."
  )
)

}
\seealso{
Other design utilities: 
\code{\link{active}()},
\code{\link{affix}()},
\code{\link{background}()},
\code{\link{border}()},
\code{\link{display}()},
\code{\link{font}()},
\code{\link{height}()},
\code{\link{padding}()},
\code{\link{scroll}()},
\code{\link{shadow}()},
\code{\link{width}()}
}
\concept{design utilities}
