library(oRion)

context("show family")

test_that("error", {
  skip_on_cran()
  cred <- readRDS("cred.RDS")
  orionOAuth(client.id = cred$client.id, client.secret = cred$clien.secret)
  expect_error(showAdset())
  expect_error(showCampaign())
  expect_error(showAd())
  expect_error(showObject())
})

test_that("tests", {
  skip_on_cran()
  cred <- readRDS("cred.RDS")
  orionOAuth(client.id = cred$client.id, client.secret = cred$clien.secret)
  # ads
  ads <- listAds(n = 50)
  ad <- showAd(ad.id = sample(ads$id, 1))
  expect_equal(nrow(ad), 1)
  # adset
  adsets <- listAdsets(n = 50)
  adset <- showAdset(adset.id = sample(adsets$id, 1))
  expect_equal(nrow(adset), 1)
  aud <- showAdsetAudience(adset.id = sample(adsets$id, 1))
  expect_equal(nrow(aud), 1)
  # campaign
  campaigns <- listCampaigns(n = 50)
  campaign <- showCampaign(campaign.id = sample(campaigns$id, 1))
  expect_equal(nrow(campaign), 1) 
  # audience
  audiences <- listAudiences()
  id <- sample(audiences$id, 1)
  audience <- showAudience(audience.id = id)
  expect_equal(nrow(audience), 1)
  object <- showObject("audience", id)
  expect_identical(object, audience)
  # object
  expect_error(showObject(object = "error", id = sample(adsets$id, 1)))
  expect_error(showObject(id = sample(adsets$id, 1)))
})