![Developped by Cheetah Mobile](https://upload.wikimedia.org/wikipedia/en/f/f9/Cheetah_Mobile_Logo.png)

[![Build status](https://ci.appveyor.com/api/projects/status/wap3t6wx2n80ccwp/branch/master?svg=true)](https://ci.appveyor.com/project/JohnCoene/orion/branch/master)
[![Build Status](https://travis-ci.org/JohnCoene/oRion.svg?branch=master)](https://travis-ci.org/JohnCoene/oRion)
[![Coverage Status](https://img.shields.io/codecov/c/github/JohnCoene/oRion/master.svg)](https://codecov.io/github/JohnCoene/oRion?branch=master)

# oRion #

Interact with [Cheetah Mobile](https://www.cmcm.com/en-us/) Orion [platform](http://manager.ori.cmcm.com/) from your R console via its API: 
[Rigel](api.ori.cmcm.com/doc/).

### Get Started ###

Visit the [documentation](http://api.ori.cmcm.com/doc/#api-Auth-access_token) to get access to the API.

```
# Install
devtools::install_bitbucket("JohnCheetah/orion")

# Examples and functions
help("oRion")
```

### Documentation ###

See the downlaod section: 

* [Manual](https://bitbucket.org/JohnCheetah/orion/downloads/oRion.pdf)
* [Vignette](https://bitbucket.org/JohnCheetah/orion/downloads/vignette.html)

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
* `deleteAd`
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