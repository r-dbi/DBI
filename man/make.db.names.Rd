% $Id$
\name{make.db.names}
\alias{make.db.names}
\alias{make.db.names,DBIObject,character-method}
\alias{SQLKeywords}
\alias{SQLKeywords,DBIObject-method}
\alias{SQLKeywords,missing-method}
\alias{isSQLKeyword}
\alias{isSQLKeyword,DBIObject,character-method}
\title{
  Make R/Splus identifiers into legal SQL identifiers
}
\description{
  Produce legal SQL identifiers from a character vector.
}
\usage{
  make.db.names(dbObj, snames, keywords, unique=TRUE, allow.keywords=TRUE, ...)
  SQLKeywords(dbObj, ...)
  isSQLKeyword(dbObj, name, keywords=.SQL92Keywords, 
                  case=c("lower", "upper", "any")[3], ...)
}
\arguments{
\item{dbObj}{
  any DBI object (e.g., \code{DBIDriver}).
  }
\item{snames}{
  a character vector of R/Splus identifiers (symbols) from which
  we need to make SQL identifiers.
  }
\item{name}{
  a character vector with database identifier candidates we need to
  determine whether they are legal SQL identifiers or not.
  }
\item{unique}{
  logical describing whether the resulting set of SQL names should
  be unique.  Its default is \code{TRUE}.  Following the SQL 92
  standard, uniqueness of SQL identifiers is determined regardless
  of whether letters are upper or lower case.
  }
\item{allow.keywords }{
  logical describing whether SQL keywords should be allowed in the
  resulting set of SQL names.  Its default is \code{TRUE}
  }
\item{keywords}{
  a character vector with SQL keywords, by default it's 
  \code{.SQL92Keywords} defined by the DBI.
  }
\item{case}{
  a character string specifying whether to make the comparison
  as lower case, upper case, or any of the two.
  it defaults to \code{any}.
  }
\item{\dots}{
  any other argument are passed to the driver implementation.
}
}
\value{
  \code{make.db.names} returns a character vector of legal SQL 
  identifiers corresponding to its \code{snames} argument.
 
  \code{SQLKeywords} returns a character vector of all known 
  keywords for the database-engine associated with \code{dbObj}.

  \code{isSQLKeyword} returns a logical vector parallel to
  \code{name}.
}
\details{
  The algorithm in \code{make.db.names} first invokes \code{make.names}
  and then replaces each occurrence of a dot ``.'' by an underscore
  ``\_''.  If \code{allow.keywords} is \code{FALSE} and identifiers
  collide with SQL keywords, a small integer is appended to the
  identifier in the form of \code{"_n"}.

  The set of SQL keywords is stored in the character
  vector \code{.SQL92Keywords} and reflects the SQL ANSI/ISO 
  standard as documented
  in "X/Open SQL and RDA", 1994, ISBN 1-872630-68-8.
  Users can easily override or update this vector.
}
\section{Bugs}{
  The current mapping is not guaranteed to be fully reversible: some 
  SQL identifiers that get mapped into S identifiers with \code{make.names}
  and then back to SQL with \code{\link{make.db.names}}
  will not be equal to the original SQL identifiers (e.g., compound
  SQL identifiers of the form \code{username.tablename} will 
  loose the dot ``.'').
}
\references{
  The set of SQL keywords is stored in the character vector
  \code{.SQL92Keywords} and reflects the SQL ANSI/ISO standard as
  documented in "X/Open SQL and RDA", 1994, ISBN 1-872630-68-8.
  Users can easily override or update this vector.

  See the Database Interface definition document
  \code{DBI.pdf} in the base directory of this package
  or \url{http://developer.r-project.org/db}.
}
\seealso{
  \code{\link{dbReadTable}},
  \code{\link{dbWriteTable}},
  \code{\link{dbExistsTable}},
  \code{\link{dbRemoveTable}},
  \code{\link{dbListTables}}.
}
\examples{\dontrun{
# This example shows how we could export a bunch of data.frames
# into tables on a remote database.

con <- dbConnect("Oracle", user="iptraffic", pass = pwd)

export <- c("trantime.email", "trantime.print", "round.trip.time.email")
tabs <- make.db.names(export, unique = T, allow.keywords = T)

for(i in seq(along = export) )
   dbWriteTable(con, name = tabs[i],  get(export[i]))

# Oracle's extensions to SQL keywords
oracle.keywords <- c("CLUSTER", "COLUMN", "MINUS", "DBNAME")
isSQLKeyword(nam, c(.SQL92Keywords, oracle.keywords))
[1]  T  T  T  F
}
}
\keyword{interface}
\keyword{database}
% vim: syntax=tex
