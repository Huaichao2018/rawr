% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stat.R
\name{lm.beta}
\alias{lm.beta}
\title{Standardize regression coefficients}
\usage{
lm.beta(x, weights = 1)
}
\arguments{
\item{x}{an \code{\link{lm}} object}

\item{weights}{a vector of weights; see details}
}
\description{
Computes standardized regression coefficients (beta) for linear models.
}
\details{
The optional \code{weights} argument can be used to scale the standard
deviation(s) of the coefficient(s). The default is \code{weights = 1}, but
\code{weights = 2} has also been suggested so that the generic comparison
is with inputs equal to the mean +/- 1 standard deviation [Gelman] (see
references). Additionally, \code{weights} can be a vector of weights for
each coefficient.
}
\examples{
cc <- with(mtcars, cor(mpg, wt))
lm.beta(lm(mpg ~ wt, data = mtcars))

cc ^ 2
summary(lm(mpg ~ wt, data = mtcars))$r.squared

lm.beta(lm(mpg ~ wt + disp + vs, data = mtcars), weights = 2)

}
\references{
\url{http://onlinelibrary.wiley.com/doi/10.1002/sim.3107/abstract}
}
\seealso{
\code{\link[QuantPsyc]{lm.beta}}
}
