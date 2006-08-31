\name{summary-methods}
\docType{methods}
\alias{summary-methods}
\alias{summary,DBIObject-method}
\title{Summarize a DBI object}
\description{Prints metadata information for a DBI object}
\section{Methods}{\describe{

\item{object = "DBIObject"}{
   Provides relevant metadata information on \code{object}, 
   for instance, the DBMS server the object is connected to, the
   SQL statement associated with a result set, etc.  
   For details see individual driver's implementation.
   }
}
}
\keyword{methods}
\keyword{database}
\keyword{interface}
% vim: syntax=tex
