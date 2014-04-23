\name{progress}
\alias{progress}
\title{Progress function}
\usage{
progress(value, max.value = NULL)
}
\arguments{
  \item{value}{numeric; i-th iteration}

  \item{max.value}{numeric; n-th iteration}
}
\description{
Displays the percent completed during an iteration
}
\examples{
\dontrun{
for (ii in 1:1000) {
   progress(ii / 1000 * 100)
   Sys.sleep(.01)
}
}
}
