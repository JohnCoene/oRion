library(oRion)

context("lists")

test_that("all", {
  skip_on_cran()
  cred <- readRDS("cred.RDS")
  orionOAuth(client.id = cred$client.id, client.secret = cred$clien.secret)
  expect_less_than(nrow(listAds(n = 100)), 101)
  expect_less_than(nrow(listAdsets(n = 50)), 51)
  expect_less_than(nrow(listCampaigns(n = 50)), 51)
  expect_less_than(nrow(listAudiences()), 1000)
  expect_less_than(nrow(listImages(n = 100)), 101)
})