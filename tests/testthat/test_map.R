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
  expect_error(map(adsets = adsets, ads = ads, audiences = audiences))
  expect_error(map(campaigns = campaigns, ads = ads, audiences = audiences))
  expect_error(map(campaigns = campaigns, adsets = adsets,
                   audiences = audiences))
  expect_error(map(campaigns = campaigns, adsets = adsets, ads = ads))
})