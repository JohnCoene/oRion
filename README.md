![Developped by Cheetah Mobile](https://upload.wikimedia.org/wikipedia/en/f/f9/Cheetah_Mobile_Logo.png)

[![Build status](https://ci.appveyor.com/api/projects/status/duk4v6xyx3sntq5w/branch/master?svg=true)](https://ci.appveyor.com/project/JohnCoene/orion-j5f71/branch/master)
[![Travis-CI Build Status](https://travis-ci.org/JohnCoene/oRion.svg?branch=master)](https://travis-ci.org/JohnCoene/oRion)
[![Coverage Status](https://img.shields.io/codecov/c/github/JohnCoene/oRion/master.svg)](https://codecov.io/github/JohnCoene/oRion?branch=master)
[![Coverage Status](https://img.shields.io/coveralls/JohnCoene/oRion.svg)](https://coveralls.io/r/JohnCoene/oRion?branch=master)

# oRion #

Interact with [Cheetah Mobile](https://www.cmcm.com/en-us/) Orion [platform](http://manager.ori.cmcm.com/) from your R console via its API: 
[Rigel](api.ori.cmcm.com/doc/).

### Get Started ###

Visit the official [documentation](http://api.ori.cmcm.com/doc/#api-Auth-access_token) to get access to the API.

```
# Install
install.packages("oRion")

# Examples and functions
help("oRion")
```

### Documentation ###

* [Manual](http://johncoene.github.io/projects/docs/oRion.pdf)
* [Vignette](http://johncoene.github.io/projects/html/vignette.html)

### functions ###

##### OAuth #####

* `orionOAuth`

##### Map #####

* `map`

##### GET family #####

* `getReport`

##### Show family #####

* `showObject`
* `showAd`
* `showAdset`
* `showCampaign`
* `showAdsetAudience`

##### Dict family #####

* `dictCity`
* `dictCountry`
* `dictDevice`
* `dictInterest`
* `dictLanguage`
* `dictOS`
* `dictState`

##### List family #####

* `listCampaigns`
* `listAdsets`
* `listAds`
* `listImages`
* `listAudiences`
* `listObjects`

##### Create family #####

* `createObject`
* `createAd`
* `createAdset`
* `createCampaign`
* `createAudience`
* `createImage`

##### Delete family #####

* `deleteObject`
* `deleteAd`
* `deleteAdset`
* `deleteAudience`
* `deleteCampaign`

##### Update family #####

* `updateObject`
* `updateAd`
* `updateAdset`
* `updateCampaign`

##### Helpers #####

* `budgetType`
* `objective`
* `appType`
* `webType`
* `deliveryType`
* `landingPage`
* `bidType`
* `appShowType`
* `gender`
* `age`
* `netType`
* `buttonText`
* `switchIt`

### Contributors ###

* Author and maintainer: John Coene <john.coene@cmcm.com>
