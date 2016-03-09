library(oRion)

context("getReport")

test_that("error", {
  
  cred <- get(load("cred.RData"))
  
  oauth <- orionOAuth(client.id = cred$id, client.secret = cred$secret)
  
  expect_error(getReport())
  
  expect_error(getReport(column = c("impression"), 
                         group.by = c("datetime", "campaign"), 
                         start = Sys.Date() - 7))
  
  expect_error(getReport(column = c("impression", "conversion"), 
                         group.by = c("datetime"), 
                         start = Sys.Date() - 7))
  
  expect_error(getReport(column = c("impression"), 
                         group.by = c("datetime"), 
                         start = Sys.Date() - 7))
})

test_that("documentation examples", {
  
  cred <- get(load("cred.RData"))
  
  oauth <- orionOAuth(client.id = cred$id, client.secret = cred$secret)
  
  # get daily campaign impressions and conversions for the past 7 days
  dat <- getReport(column = c("impression", "conversion"), 
                   group.by = c("datetime", "campaign"), 
                   start = Sys.Date() - 7)
                     
  # get daily adset ratios for the past 30 days by age and gender
  dat <- getReport(column = c("ctr", "cpm", "cpc"), 
                   group.by = c("datetime", "adset", "age", "gender"), 
                   start = Sys.Date() - 30)
                    
  # get impressions and clicks for January 2016's ads
  dat <- getReport(column = c("impression", "click"), 
                   group.by = c("datetime", "ad"), start = "2016-01-01", 
                   end = "2016-02-01")
})