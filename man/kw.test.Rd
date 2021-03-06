% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stat.R
\name{kw.test}
\alias{kw.test}
\alias{kw.test.default}
\alias{kw.test.formula}
\title{Test for trend in proportions}
\usage{
kw.test(x, ...)

\method{kw.test}{default}(x, g, ..., simulate.p.value = FALSE, B = 2000L)

\method{kw.test}{formula}(formula, data, ...)
}
\arguments{
\item{x}{a factor-like vector giving the (unordered) variable (equivalently
the row variable of a contingency table); if \code{x} is also ordered,
consider using \code{\link{jt.test}}

alternatively, \code{x} can be an \code{r x c} table or matrix with at
least two rows (unordered) and three columns (ordered); \code{x} may also
be a list of the row variable split by the ordered column variable in
which case the list is assumed to be ordered, i.e., \code{x[[1]]} <
\code{x[[2]] < ... < x[[c]]}; see examples}

\item{...}{further arguments to be passed to or from methods}

\item{g}{a factor-like vector giving the \emph{ordered} group for each
corresponding element of \code{x}, ignored with a warning if \code{x} is a
list or table; if \code{g} is not a factor, it will be coerced, and groups
will be ordered as sort(unique(g)); see \code{\link{factor}}}

\item{simulate.p.value}{logical; if \code{TRUE}, p-value is computed using
by Monte Carlo simulation}

\item{B}{an integer specifying the number of replicates used in the Monte
Carlo test}

\item{formula}{a formula of the form \code{row ~ column} where \code{row}
gives the (unordered) row variable and \code{column} gives the
\emph{ordered} column variable}

\item{data}{an optional matrix or data frame (or similar: see
\code{\link{model.frame}}) containing the variables in \code{formula}; by
default the variables are taken from \code{environment(formula)}}
}
\value{
A list with class "\code{htest}" containing the following elements:

\item{\code{statistic}}{the chi-squared test statistic}
\item{\code{parameter}}{the degrees of freedom of the approximate chi-
squared distribution of the test statistic}
\item{\code{p.value}}{the p-value of the test (two-sided)}
\item{\code{method}}{a character string describing the test, and,
optionally, the number of Monte Carlo replications, if applicable}
\item{\code{data.name}}{a character string giving the names of the data}
\item{\code{conf.int}}{optionally (if \code{simulate.p.value = TRUE}),
the 99\% confidence interval of the Monte Carlo p-value}
\item{\code{summary}}{optionally (if \code{simulate.p.value = TRUE}),
a summary of the simulated test statistics}
}
\description{
Performs a test for trend in an \code{r x c} contingency table with
one nominal (rows, r > 2) and one ordinal (columns, c > 2) variable.
}
\examples{
## example from Exact Test (Mehta), figure 11.1
## system.file('docs', 'PASW_Exact_Tests.pdf', package = 'rawr')
dat <- data.frame(
  regimen  = rep(c('CTMX', 'CCNU', 'MTX', 'CTX+CCNU', 'CTX+CCNU+MTX'),
                 times = c(2, 2, 3, 4, 6)),
  response = c('NR', 'NR', 'NR', 'PR', 'NR', 'NR', 'NR',
               'NR', 'NR', 'PR', 'PR', 'NR', 'PR', 'CR', 'CR', 'CR', 'CR')
)
dat$response2 <- factor(dat$response, c('NR', 'PR', 'CR'))

kw.test(dat$regimen, dat$response)   ## incorrect
kw.test(dat$regimen, dat$response2)  ## correct


## the following are equivalent to the above
kw.test(dat$regimen ~ dat$response2)
kw.test(regimen ~ response2, dat)
kw.test(split(dat$regimen, dat$response2))
kw.test(table(dat$regimen, dat$response2))


## compare (note formula is reversed)
kruskal.test(response2 ~ regimen, dat)

\dontrun{
## simulate p-value with 5k replicates
set.seed(1)
kw.test(regimen ~ response2, dat, simulate.p.value = TRUE, B = 5000)
}

}
\seealso{
\code{\link{jt.test}} for doubly-ordered tables; \code{\link{cuzick.test}};
\code{\link{ca.test}}; \code{DescTools::CochranArmitageTest};
\code{\link{prop.trend.test}}
}
