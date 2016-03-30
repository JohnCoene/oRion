library(oRion)

context("test OAuth")

test_that("error", {
  skip_on_cran()
  cred <- readRDS("cred.RDS")
  expect_error(orionOAuth(client.secret = cred$clien.secret))
  expect_error(orionOAuth(client.id = cred$client.id))
  expect_error(orionOAuth(client.id = cred$client.id,
                          client.secret = cred$clien.secret,
                          grant.type = "error"))
})