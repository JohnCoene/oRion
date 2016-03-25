library(oRion)

context("map")

test_that("init", {
  cred <- readRDS("cred.RDS")
  orionOAuth(client.id = cred$client.id, client.secret = cred$clien.secret)
  adsets <- listAdsets()
  ads <- listAds()
  campaigns <- listCampaigns()
  audiences <- listAudiences()
  map <- map(campaigns, adsets, ads, audiences)
  expect_equal(names(map), c("source.id", "target.id", "source.name",
                             "target.name", "source.object", "target.object"))
  expect_error(map(campaigns, adsets, ads))
  expect_error(map(campaigns, adsets, audiences))
  expect_error(map(campaigns, ads, audiences))
  expect_error(map(adsets, ads, audiences))
  expect_error(map(adsets, campaigns, ads, audiences))
})