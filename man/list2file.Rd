% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zxx.R
\name{list2file}
\alias{list2file}
\title{List to file}
\usage{
list2file(l, targetdir = getwd(), sep, ...)
}
\arguments{
\item{l}{a list of data frames or matrices}

\item{targetdir}{target directory (created if doesn't exist)}

\item{sep}{field separator string; default is none which results in
\code{.rda} data files; "\code{,}" creates \code{.csv} files; any other
separator will create \code{.dat} files}

\item{...}{additional arguments passed to \code{\link{save}} if \code{sep}
is not given or to \code{\link{write.table}} if \code{sep} is given}
}
\value{
\code{list2file} will create \code{length(l)} files in the \code{targetdir}.
}
\description{
Save a \emph{named} list of data frames or matrices into \code{R} data files
\code{.rda}, \code{.csv}, or \code{.txt} files.
}
\examples{
\dontrun{
dfl <- setNames(list(mtcars, iris), c('mtcars','iris'))

## .csv files
list2file(dfl, '~/desktop/tmp', sep = ',')

## r data files
list2file(dfl, '~/desktop/tmp')
}

}
