% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/zxx.R
\name{fapply}
\alias{fapply}
\alias{fapply_by}
\title{Apply summary functions over list or vector}
\usage{
fapply(data, ...)

fapply_by(formula, data, ...)
}
\arguments{
\item{data}{for \code{fapply}, a vector, list, or data frame to operate on;
for \code{fapply_by}, a data frame containing the variables in \code{formula}}

\item{...}{summary function(s) such as \code{length(.)} or
\code{mean(., na.rm = TRUE)} to apply; names are not required but strongly
recommended}

\item{formula}{a formula such as \code{y ~ x} or \code{cbind(y1, y2) ~ x1 + x2}
where the \code{y} variables are numeric data to be split into groups
according to the grouping \code{x} variables (usually factors)}
}
\description{
\code{fapply} applies summary function(s) over a vector, list, or data
frame, and \code{fapply_by} applies summary function(s) over subsets of
a data frame.
}
\examples{
tmp <- recoder(mtcars, 6, NA)
fapply(tmp, mean = mean(.), median = median(., na.rm = TRUE))
fapply(mtcars$mpg, mean = mean(.))

## define a new function
ci <- function(x) {
  q <- quantile(x, c(0.025, 0.975), na.rm = TRUE)
  sprintf('\%.0f (\%.2f, \%.2f)', median(x), q[1], q[2] )
}
fapply(mtcars, median(.), '95\% CI' = ci(.))

## compare: 
t(fapply(mtcars, min(.), mean(.), max(.), length(.)))
summary(mtcars)


fapply_by(mpg ~ vs + am, mtcars, mean(.), median(.), length(.))
fapply_by(as.matrix(mtcars) ~ vs, mtcars, mean = mean(.))

## one ~ one, one ~ many, many ~ one, and many ~ many
fapply_by(disp ~ cyl, mtcars, mean = mean(.))
fapply_by(disp ~ cyl + vs, mtcars, mean = mean(.))
fapply_by(cbind(disp, wt) ~ cyl, mtcars, mean = mean(.))
fapply_by(cbind(disp, wt) ~ cyl + vs, mtcars, mean = mean(.), n = length(.))

## compare
aggregate(cbind(disp, wt) ~ cyl + vs, mtcars, function(x)
  c(mean(x), length(x)))

}
