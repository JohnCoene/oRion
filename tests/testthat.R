library(testthat)
library(oRion)

if (!identical(get("credentials", envir=cred_env), "")) {
  test_check("oRion")
}
