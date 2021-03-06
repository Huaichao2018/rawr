% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{response}
\alias{response}
\title{Response data}
\usage{
response(
  date,
  response,
  include = "(resp|stable)|([cpm]r|sd)$",
  default = NA,
  no_confirm = "stable|sd",
  progression = "prog|pd|relapse",
  n_confirm = 1L,
  n_prog = n_confirm,
  strict = FALSE,
  dr = 0,
  dp = NULL
)
}
\arguments{
\item{date}{date of assessment}

\item{response}{a factor variable of responses for each \code{date} with
levels ordered from best response to worst (e.g.,
\code{factor(., levels = c('CR', 'PR', 'SD', 'PD'))}}

\item{include}{integer vector of levels of \code{response} to include or
a single regular expression to match levels of \code{response}; useful if
a minimal response is required}

\item{default}{(optional) the default response if no assessments have been
confirmed, usually stable disease; must be a level of \code{response}}

\item{no_confirm}{responses that do not require confirmation assessments,
usually stable disease (default); must match a level of \code{response}}

\item{progression}{a character string to identify progression events in
\code{response}; must match a level of \code{response}}

\item{n_confirm}{to confirm a response, the number of subsequent responses
equal to or better than required; e.g., if \code{n_confirm = 1} (default),
to confirm a response, the next assessment must be at least as good as the
current; note that this only affects \code{.$confirmed} and
\code{.$bsf_confirmed} in the return object}

\item{n_prog}{similar to \code{n_confirm} but for progression; if
\code{nprog = 1}, then a progression must be followed by at least one
progression to confirm; note that this only affects \code{.$confirmed} and
\code{.$bsf_confirmed} in the return object}

\item{strict}{logical; if \code{TRUE}, only the first uninterrupted
sequence of confirmed responses will be evaluated for best response}

\item{dr}{(optional) difference in level required to confirm responses; if
\code{dr = 0} (default), the next response must be equal to or better to
confirm; if \code{dr = -1}, the next response must be at least one level
better; \code{dr = Inf} will be equivalent to unconfirmed responses since
any subsequent response can confirm}

\item{dp}{(optional) difference in level required to show progression; if
\code{dp = NULL} (default), only responses matching \code{progression}
pattern show progression; if \code{dp = 0}, any worse response will be
considered progression (e.g., CR followed by PR); \code{dp = 1},
progression is defined as a drop in response of two or more levels (e.g.,
CR to PR is not progression but CR to MR is progression)}
}
\value{
A list with the following elements:
\item{$unconfirmed}{a \code{1 x 10} data frame with dates of first and last
response, first and last best response, the response for each, date last
free from progression, and date of progression}
\item{$confirmed}{similar to \code{$unconfirmed} but only for responses
that have been confirmed}
\item{$bsf_unconfirmed}{an \code{n x 2} data frame with the best-so-far
responses matching \code{include} with corresponding dates}
\item{$bsf_confirmed}{similar to \code{$bsf_unconfirmed} but only for
responses that have been confirmed}
}
\description{
Get response data (dates, progression, best-so-far, best overall,
confirmed, etc.) for vectors of dates and response assessments.
}
\examples{
set.seed(1)
rsp <- c('CR', 'PR', 'SD', 'PD')
rsp <- c('sCR', 'CR', 'VGPR', 'PR', 'MR', 'SD', 'PD')
dat <- data.frame(
  id = rep(1:5, each = 10),
  date = Sys.Date() + 1:10,
  response = factor(
    # rsp[sample(seq_along(rsp), 50, TRUE, c(0.2, 0.5, 0.2, 0.1))], rsp
    rsp[sample(seq_along(rsp), 50, TRUE)], rsp
  )
)

sp <- split(dat[, -1L], dat$id)
ii <- 2
response(sp[[ii]]$date, sp[[ii]]$response)

unconf <- do.call(
  'rbind',
  lapply(sp, function(x) response(x$date, x$response)$unconfirmed)
)
conf <- do.call(
  'rbind',
  lapply(sp, function(x) response(x$date, x$response, default = 'SD')$confirmed)
)
do.call('cbind', sp)

}
