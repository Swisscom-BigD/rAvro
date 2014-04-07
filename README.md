ravro
=====

Integration of Avro Java utilities into R envinronment. Provides parsing and **loading** Avro files into native R data frames.

# Instalation 
````
install.packages("devtools")
library(devtools)
install_github("ravro", "Swisscom-BigD")
````

# Usage
Avro loading:
````
library("ravro")
df <- read.avro("avro_file.avro")
head(df)
````


