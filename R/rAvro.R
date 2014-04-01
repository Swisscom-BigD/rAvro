simplifyJavaObj <- function (o) {
  if (!inherits(o, "jobjRef") && !inherits(o, "jarrayRef")) 
    return(o)
  cn <- .jclass(o, true = TRUE)
  if (cn == "java.lang.Boolean") 
    .jcall(o, "Z", "booleanValue")
  else if (cn == "java.lang.Integer" || cn == "java.lang.Short" || 
             cn == "java.lang.Character" || cn == "java.lang.Byte") 
    .jcall(o, "I", "intValue")
  else if (cn == "java.lang.Number" || cn == "java.lang.Double" || 
             cn == "java.lang.Long" || cn == "java.lang.Float") 
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