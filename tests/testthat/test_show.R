library(oRion)

context("show family")

test_that("error", {
  
  expect_error(showAdset())
  
  expect_error(showCampaign())
  
  expect_error(showAd())
  
  expect_error(showObject())
  
})

test_that("tests", {
  
  cred <- get(load("cred.RData"))
  
  orionOAuth(client.id = cred$id, client.secret = cred$secret)
  
  # ads
  ads <- listAds(n = 50)
  
  ad <- showAd(ad.id = sample(ads$id, 1))
  
  expect_equal(nrow(ad), 1)
  
  # adset
  adsets <- listAdsets(n = 50)
  
  adset <- showAdset(adset.id = sample(adsets$id, 1))
  
  expect_equal(nrow(adset), 1)
  
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
})