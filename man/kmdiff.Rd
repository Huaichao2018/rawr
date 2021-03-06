% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/surv.R
\name{kmdiff}
\alias{kmdiff}
\title{Difference in two Kaplan-Meier estimates}
\usage{
kmdiff(s, col = adjustcolor("grey", 0.5), conf.int = 0.95)
}
\arguments{
\item{s}{an object of class \code{\link[survival]{survfit}}}

\item{col}{color used for the band}

\item{conf.int}{the level of the two-sided confidence interval}
}
\description{
Draw a confidence band for comparing two survival curves. The shaded region
is centered at the midpoint of the two survival estimates, and the height
is half the width of the approximate \code{conf.int} pointwise confidence
region. Curves not overlapping the shaded area are approximately
significantly different at the \code{1 - conf.int} level.
}
\examples{
library('survival')
fit <- survfit(Surv(time, status) ~ sex, lung)

## survival:::plot.survfit
plot(fit, mark.time = TRUE, col = 1:2)
kmdiff(fit)

## rawr::kmplot (add = TRUE to add to plot before resetting par)
kmplot(fit, add = TRUE)
kmdiff(fit)
legend(
  'topright', fill = adjustcolor('grey', 0.5),
  legend = sprintf('Difference\n1/2 \%s CL', fit$conf.int)
)

}
\seealso{
Adapted from \code{rms::survdiffplot}
}
