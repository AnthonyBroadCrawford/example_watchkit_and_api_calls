### Why I created this example

I recently had to build a WatchKit app that connected to its parent app to retrieve remote data from an API. This should be a very simple and well documented use-case from Apple given almost 100% of WatchKit apps will do this. Unfortunately, what I found out, is that clear and concise documentation is lacking and there are a few pitfalls.  

So no one else would have to waste a day or so researching what you need to do in order to make an API call from within your AppDelegates handleWatchKitExtensionRequest, I felt it would be nice to document a working solution (Xcode 6.4 & iOS 8.4).

### This solution covers
The Watchkit app covers

- Properly preparing your iOS app to make a remote http api call when requested to do so via the WatchKit app
- Properly communicate errors and data to the WatchKit app

### This solution doesn't cover
Thread safety and multiple concurrent requests from the WatchKit app to the iOS parent via handleWatchKitExtensionRequest

### The use-case
I wanted a real, yet simple, use-case when building out this app.  I chose to have the WatchKit app simply request the current weather forecaes from the [DarkSky API](https://developer.forecast.io/docs/forecast) via [Forecast.io](www.forecast.io)

The Watchkit app simply has a
- Glance interface requesting remote data from iOS parent
- Watch app requesting remote data from iOS parent

### Alamofire
To simplify what this codebase must do, I've leveraged Alamofire to make any necessary HTTP calls

### Authors and Contributors

At the moment, it's just me Anthony Broad-Crawford however, if you want to contribute, feel free to do so.

### Support or Contact

If you have any questions please don't hesitate to contact me via Twitter at @broadcrawford or via email.
