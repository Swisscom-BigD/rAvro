\name{ravro-package}
\alias{ravro-package}
\alias{ravro}
\docType{package}
\title{
Avro utilities for R envinronment 
}
\description{
Package integrates Java implementation of Avro utilities into R envinronment. Provides parsing of Avro files and data loading into R native data frames.
}
\author{
Michal Rachtan
}

\examples{
df <- read.avro("./part-00000.avro")
head(df)
}
