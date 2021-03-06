% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sas.R
\name{r2sas}
\alias{r2sas}
\title{r2sas}
\usage{
r2sas(code, saspath, force, out)
}
\arguments{
\item{code}{character string of valid \code{SAS} code}

\item{saspath}{file path to sas executable as character string, passed to
\code{\link{sas_path}}}

\item{force}{logical; by default, user must interactively allow
\code{r2sas} to continue running \code{code}; set to \code{TRUE} to ignore
this or for non-interactive \code{R}}

\item{out}{either \code{FALSE}, directory (as character string) to dump
\code{.sas} program file, \code{.log} file, and any \code{SAS} output, i.e.,
\code{.lst} file(s)}
}
\description{
Write and run \code{SAS} code in \code{R}.

This is meant as a utility function for other \code{SAS} functions in this
package, and users are \emph{not} encouraged to use \code{r2sas} to
interface with \code{SAS} (while possible with this function, see examples).

To source an existing \code{.sas} program, see \code{\link{source_sas}}.

For macros, see \code{\link{get_margs}} and \code{\link{rmacro}}.

To convert \code{.sas7bdat} files, \code{\link{sas_mget}}.
}
\examples{
\dontrun{
code <- "
* this is a sas program file :;

options nodate nocenter nonumber;

x 'cd ./newfolder';

libname lib './newfolder';

data data;
  input id x y;
  datalines;
  1 1 1
  2 2 2
  3 1 3
  ;
run;

data data;
  set data;
  if x = 1 then delete;
run;
"

r2sas(code, sas_path(), FALSE, getwd())

## * this is a sas program file :;
## 
## options nodate nocenter nonumber;
## 
## x 'cd ./newfolder';
## 
## libname lib './newfolder';
##
## data data;
##   input id x y;
##   datalines;
##   1 1 1
##   2 2 2
##   3 1 3
##   ;
## run;
## 
## data data;
##   set data;
##   if x = 1 then delete;
## run;
## 
## 
## 
## ... will be run. Continue? (y/n): 
}

}
\seealso{
\code{\link{sas_path}}, \code{\link{rmacro}}, \code{\link{get_margs}},
\code{\link{sas_mget}}, \code{\link{source_sas}},
\code{\link{parse_formats}}, \code{\link{sas_catalog}}
}
