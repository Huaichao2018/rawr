\name{intr}
\alias{intr}
\title{Interval formatter}
\usage{
intr(..., fun = median, conf = NULL, digits = 2, na.rm = FALSE)
}
\arguments{
  \item{...}{numeric vector or string of numeric vectors}

  \item{fun}{summary stat function, usually
  \code{\link{mean}} or \code{\link{median}}}

  \item{conf}{width of confidence interval in \code{[0,1]};
  if \code{NULL} (default), returns min and max of
  \code{...}}

  \item{digits}{number of digits (includes trailing 0s)}

  \item{na.rm}{logical; if \code{TRUE}, any
  \code{\link{NA}} and \code{NaN} are removed from
  \code{...} before \code{fun} and \code{\link{quantile}}
  are computed}
}
\description{
Automatically calculate summary statistic and interval for
numeric vectors
}
\examples{
intr(1:10)
intr(1:10, conf = .95)
# inner quartile range
cbind(lapply(mtcars, intr, conf = .5), lapply(mtcars, intr, fun = mean))
# compare to
summary(mtcars)
}
\seealso{
\code{\link[rawr]{roundr}}
}
