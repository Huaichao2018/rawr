% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/surv.R
\name{surv_extract}
\alias{surv_extract}
\alias{surv_median}
\alias{surv_prob}
\title{Extract \code{survfit} summaries}
\usage{
surv_extract(x, what = "median")

surv_median(
  x,
  ci = FALSE,
  digits = 0L,
  which = NULL,
  print = TRUE,
  na = ifelse(ci, "NR", "not reached"),
  show_conf = TRUE
)

surv_prob(
  x,
  times = pretty(x$time),
  ci = FALSE,
  digits = ifelse(percent, 0L, 2L),
  which = 1L,
  print = TRUE,
  show_conf = TRUE,
  percent = FALSE
)
}
\arguments{
\item{x}{an object of class \code{\link[survival]{survfit}}}

\item{what}{the data to return, either the index, character string(s), or
\code{NULL} (returns the entire table)}

\item{ci}{logical; if \code{TRUE}, the confidence interval is printed}

\item{digits}{number of digits past the decimal point to keep}

\item{which}{optional integer or character vector to select or re-order
the output; \code{which = NULL} and returns results for all strata}

\item{print}{logical; if \code{TRUE}, output is prepared for in-line
printing}

\item{na}{a character string to replace \code{NA} when median
times have not yet been reached}

\item{show_conf}{logical; if \code{TRUE}, includes the confidence level}

\item{times}{vector of times passed to \code{\link{surv_table}}}

\item{percent}{logical; if \code{TRUE}, percentages are shown instead of
probabilities}
}
\description{
Convenience functions to print results from \code{summary(x)$table}
where \code{x} is a \code{\link[survival]{survfit}} object.

\code{surv_median} and \code{surv_prob} extract median(s) and survival
estimate(s) with optional confidence intervals, respectively.
\code{surv_extract} is a generic extractor.
}
\examples{
library('survival')
sfit1 <- survfit(Surv(time, status) ~ 1, lung)
sfit2 <- survfit(Surv(time, status) ~ sex, lung, conf.int = 0.9)

surv_extract(sfit1, NULL)
surv_extract(sfit1, 2:3)
surv_extract(sfit2, 'median|CL')
surv_extract(sfit1, c('events', 'median'))


surv_median(sfit1)
surv_median(sfit2)
surv_median(sfit2, print = FALSE)

surv_median(sfit1, ci = TRUE)
surv_median(sfit2, ci = TRUE)
surv_median(sfit2, ci = TRUE, print = FALSE)


times <- 365.242 * c(0.5, 1, 2)
surv_prob(sfit1, times)
## compare
summary(sfit1, times)

surv_prob(sfit2, times, which = 'sex=2', digits = 3)
## compare
summary(sfit2, times)

surv_prob(sfit2, times = 365, ci = TRUE, which = NULL)

}
