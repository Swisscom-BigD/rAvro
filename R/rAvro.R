simplifyJavaObj <- function (o) {
  if (!inherits(o, "jobjRef") && !inherits(o, "jarrayRef")) 
    return(o)
  cn <- .jclass(o, true = TRUE)
  if (is.jnull(o))
    NA
  else if (cn == "java.lang.Boolean") 
    .jcall(o, "Z", "booleanValue")
  else if (cn %in% c("java.lang.Integer", "java.lang.Short", 
                     "java.lang.Character", "java.lang.Byte")) 
    .jcall(o, "I", "intValue")
  else if (cn %in% c("java.lang.Number", "java.lang.Double",
                     "java.lang.Long", "java.lang.Float"))
    .jcall(o, "D", "doubleValue")
  else if (cn %in% c("java.lang.String", "org.apache.avro.util.Utf8")) 
    .jstrVal(.jcast(o, "java/lang/String"))
  else o
}

read.avro <- function (file) {
  rdr <- .jnew("io/kvant/r/ravro/AvroLoader")
  df <- rdr$load(file)
  cols <- df$getNames()  
  
  out <- data.frame(
    sapply(cols, function(col) {
      aaply(as.list(df$getColumn(col)), 1, simplifyJavaObj)}))
  
  return(out)
}