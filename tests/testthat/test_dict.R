library(oRion)

context("dict family")

test_that("locations", {
  
  country <- dictCountry()
  
  expect_equal(nrow(country), 249)
  
  states <- dictState(country.code = "US")
  
  expect_equal(nrow(states), 54)
  
  set.seed(19880525)
  
  cities <- dictCity(state.code = sample(states$code, 1))
  
  expect_equal(nrow(cities), 539)
  
  set.seed(25051988)
  
  cities <- dictCity(state.code = sample(states$code, 1))
  
  expect_equal(nrow(cities), 399)
})

test_that("other", {
  
  expect_equal(nrow(dictBehaviour()), 11)
  
  expect_equal(nrow(dictDevice()), 47)
  
  expect_equal(nrow(dictLanguage()), 178)
  
  expect_more_than(nrow(dictOS()), 13)
  
  expect_equal(nrow(dictInterest()), 180)
  
})