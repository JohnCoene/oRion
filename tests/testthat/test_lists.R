library(oRion)

context("lists")

test_that("all", {
  
  cred <- get(load("cred.RData"))
  
  orionOAuth(client.id = cred$id, client.secret = cred$secret)
  
  expect_less_than(nrow(listAds(n = 100)), 101)
  
  expect_less_than(nrow(listAdsets(n = 50)), 51)
  
  expect_less_than(nrow(listCampaigns(n = 50)), 51)
  
  expect_less_than(nrow(listAudiences()), 1000)
  
  expect_less_than(nrow(listImages(n = 100)), 101)
})