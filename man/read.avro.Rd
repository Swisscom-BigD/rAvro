\name{read.avro}
\alias{read.avro}

\title{
Avro file loader
}

\usage{
read.avro(file)
}

\arguments{
  \item{file}{
    path to the Avro file which data are to be loaded into R data frame. Each Avro record appears as one row in the output table. 
  }
}

\author{
Michal Rachtan
}

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}

\examples{
df <- read.avro("./part-00000.avro")
head(df)
}

\keyword{ ~Avro }
