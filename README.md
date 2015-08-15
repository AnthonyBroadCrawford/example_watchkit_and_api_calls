### Why I created this example

I recently had to build a WatchKit app that connected to the parent app to retrieve remote data from an API. This should be a very simple and well documented scenario from Apple given that almost 100% of WatchKit apps will need to do this at some point in time. Unfortunately, what I found out, is that is indeed not the case and a holistic example capturing all the pit-falls is not well documented.

So no one else would have to waste a day or so researching what are the super-set of things you need to do in order to make an API call from within your AppDelegates handleWatchKitExtensionRequest I felt it would be nice to document a working solution (Xcode 6.4 & iOS 8.4).

This solution covers

- Properly prepare your iOS app to make a remote http api call when requested by the WatchKit app
- Properly communicate errors to the WatchKit app

### This example covers the following use-cases
I wanted a real, yet simple, use-case when building out this app.  I chose to have the WatchKit app simply request the current weather from the [DarkSky API](https://developer.forecast.io/docs/forecast) from [Forecast.io](www.forecast.io)

- Glance interface requesting remote data from iOS parent
- Watch app requesting remote data from iOS parent
- AppDelegate handleWatchKitExtensionRequest properly orchestrating a remote http api calls

### Alamofire
To simplify what this codebase must do, I've leveraged Alamofire to make any necessary HTTP calls

### Authors and Contributors

At the moment, it's just me Anthony Broad-Crawford however, if you want to contribute, feel free to do so.

### Support or Contact

If you have any questions please don't hesitate to contact me via Twitter at @broadcrawford or via email.
