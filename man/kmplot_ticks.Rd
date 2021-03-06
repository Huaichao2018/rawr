% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/surv.R
\name{kmplot_ticks}
\alias{kmplot_ticks}
\title{Add ticks to \code{kmplot}}
\usage{
kmplot_ticks(
  s,
  data = eval(s$call$data),
  by_var,
  what,
  y = 0,
  time,
  event,
  strata,
  col = NULL,
  pch = NULL,
  ...
)
}
\arguments{
\item{s}{an object of class \code{\link{survfit}}}

\item{data}{the data set used to fit \code{s} which should also contain
\code{by_var} and optionally \code{time}, \code{event}, and \code{strata};
\code{kmplot_ticks} will attempt to select these variables based on the
call to \code{survfit}}

\item{by_var, what}{a variable, \code{by_var} in \code{data} for which
tick marks are to be placed at each occurrence of \code{what}}

\item{y}{the y-coordinate(s) for each point, recycled as needed}

\item{time, event, strata}{(optional) variables used to fit \code{s}}

\item{col}{a vector of colors (one for each strata level of \code{s}) for
tick marks; note these colors should match the curves of the survival plot}

\item{pch}{a vector of plotting characters to distinguish censoring and
events}

\item{...}{additional arguments passed to \code{\link{points}}}
}
\description{
Add tick marks to a \code{\link{kmplot}} representing a specific event,
\code{what}, occurring within a variable, \code{by_var}.
}
\examples{
library('survival')
s <- survfit(Surv(futime, fustat) ~ rx, ovarian)

kmplot(s, add = TRUE)
kmplot_ticks(s, by_var = 'resid.ds', what = 1)
kmplot_ticks(s, by_var = 'resid.ds', what = 2, pch = '*', y = 0.05)

}
\seealso{
\code{\link{kmplot}}; \code{\link{kmplot_by}}
}
