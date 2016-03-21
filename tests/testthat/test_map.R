library(oRion)

context("map")

test_that("init", {
  adsets <- listAdsets(n = 500)
  ads <- listAds(n = 500)
  campaigns <- listCampaigns(n = 500)
  audiences <- listAudiences(n = 500)
  
  map <- map(campaigns, adsets, ads, audiences)
  
  expect_equal(names(map), c("source.id", "target.id", "source.name", 
                             "target.name", "source.object", "target.object"))
  
  expect_error(map(campaigns, adsets, ads))
  expect_error(map(campaigns, adsets, audiences))
  expect_error(map(campaigns, ads, audiences))
  expect_error(map(adsets, ads, audiences))
  
  expect_error(map(adsets, campaigns, ads, audiences))
})