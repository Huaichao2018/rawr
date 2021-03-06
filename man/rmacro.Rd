% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sas.R
\name{rmacro}
\alias{rmacro}
\title{Call \code{SAS} macros}
\usage{
rmacro(
  path,
  name,
  args,
  saspath,
  show.args = FALSE,
  force = FALSE,
  firstArgs,
  lastArgs,
  out = getwd()
)
}
\arguments{
\item{path}{path to macro (\code{.sas}) file as character string}

\item{name}{macro name; if missing, \code{\link{get_margs}} will search
\code{path} for macro names; if missing and \code{get_margs} finds more
than one macro in \code{path}, will throw an error}

\item{args}{arguments passed to the macro, separated by commas (do not
include semicolons---\code{args} is passed directly as
\code{\%macro(args);} ); if unsure of the macro parameters, run
\code{rmacro} with \code{show.args = TRUE}}

\item{saspath}{file path to sas executable as character string, passed to
\code{\link{sas_path}}}

\item{show.args}{logical; if \code{TRUE}, \code{rmacro} will only return
the macro names and arguments found in \code{path}}

\item{force}{logical; by default, user must interactively allow
\code{r2sas} to continue running \code{code}; set to \code{TRUE} to ignore
this or for non-interactive \code{R}}

\item{firstArgs}{(optional) character string of (valid) \code{SAS} commands
separated by semicolons to be excuted \emph{before} the macro; for example,
\code{options <OPTIONS>;} or \code{x "cd ..";}}

\item{lastArgs}{(optional) commands to be executed \emph{after} the macro;
see \code{firstArgs}}

\item{out}{either \code{FALSE}, directory (as character string) to dump
\code{.sas} program file, \code{.log} file, and any \code{SAS} output,
i.e., \code{.lst} file(s)}
}
\description{
\code{rmacro} runs \code{SAS} macros in \code{.sas} files from \code{R}.
}
\examples{
\dontrun{
rmacro(system.file('testfiles', 'onemacro.sas', package = 'rawr'),
       args = 'arg1 = 1, arg2 = 2',
       firstArgs = 'options nodate nocenter; x \'cd ~/desktop\';',
       lastArgs = 'endsas;')
       
## options nodate nocenter; 
## x 'cd ~/desktop'; 
## 
## \%include "./.../onemacro.sas";
## \%macro1(arg1 = 1, arg2 = 2);
## endsas; 
## 
## 
## 
## 
## 
## 
## ... will be run. Continue? (y/n): 
}

}
\seealso{
\code{\link{sas_path}}, \code{\link{get_margs}}, \code{\link{r2sas}},
\code{\link{sas_mget}}, \code{\link{source_sas}},
\code{\link{parse_formats}}, \code{\link{sas_catalog}}
}
