% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{pfun}
\alias{pfun}
\alias{psum}
\title{Pairwise binary functions}
\usage{
pfun(..., na.rm = FALSE, FUN = `+`)

psum(..., na.rm = FALSE)
}
\arguments{
\item{...}{numeric vectors, matrices, or data frames with equal dimensions}

\item{na.rm}{logical; if \code{TRUE}, omits missing values (including
\code{\link{NaN}}) from calculations}

\item{FUN}{a binary function}
}
\value{
An object similar to input objects after successively combining elements
with \code{FUN}.
}
\description{
Perform binary operations on vectors, matrices, or data frames.
}
\examples{
x <- c(-1, NA, 4, 15)
y <- c(NA, NA, 6, -1)
psum(x, y)
psum(x, y, na.rm = TRUE)

x <- matrix(x, 4, 4)
y <- matrix(y, 4, 4)
psum(x, y)
psum(x, y, na.rm = TRUE)

pfun(x, y, x, FUN = `-`)
pfun(x, y, x, FUN = `-`, na.rm = TRUE)
x - y - x

}
\seealso{
\code{\link{pmin}}; \code{\link{pmax}}
}
