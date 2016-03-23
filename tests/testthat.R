library(testthat)
library(oRion)

if (file.exists(".orionToken")) {
  test_check("oRion")
}
