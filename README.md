![Developped by Cheetah Mobile](https://upload.wikimedia.org/wikipedia/en/f/f9/Cheetah_Mobile_Logo.png)

# oRion #

Fetch data on [Cheetah Mobile](https://www.cmcm.com/en-us/) [Orion](http://manager.ori.cmcm.com/) platform via its [API](http://api.ori.cmcm.com/doc/).

### Get Started ###

```
# Install
devtools::install_bitbucket("JohnCheetah/orion", auth_user = "your_login", password = "your_password")

# Examples
package?oRion
```

### Documentation ###

See [download section](https://bitbucket.org/JohnCheetah/orion/downloads/oRion.pdf) for the manual.

### functions ###

##### OAuth #####

* `orionOAuth`

##### GET family #####

* `getReport`

##### Show family #####

* `showObject`
* `showAd`
* `showAdset`
* `showCampaign`

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

### Contributors ###

* John Coene <john.coene@cmcm.com>