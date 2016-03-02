
setRefClass("orionToken", fields = c("client.id", "client.secret",
                                     "token", "expires_in_sec",
                                     "expires_in_date"))

setMethod("print", signature = "orionToken",
          definition = function(x) {
            hidden <- attr(x, "hidden")

            print(x[!names(x) %in% hidden])
          })