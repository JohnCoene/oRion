library(oRion)

context("lists")

test_that("all", {
  
  cred <- get(load("cred.RData"))
  
  oauth <- orionOAuth(client.id = cred$id, client.secret = cred$secret)
  
  expect_equal(nrow(listAds(n = 100)), 100)
  
  expect_equal(nrow(listAdsets(n = 50)), 50)
  
  expect_equal(nrow(listCampaigns(n = 50)), 50)
  
  expect_equal(nrow(listAudiences()), 3)
  
  expect_equal(nrow(listImages()), 1)
})