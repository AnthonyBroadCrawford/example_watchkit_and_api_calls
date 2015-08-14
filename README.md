###Why I created this example

I recently had to build a WatchKit app that connected to the parent app to retrieve data. This should be a very simple and well documented scenario via Apple given that almost 100% of WatchKit apps will do this. Unfortunately, what I found out, is that is indeed not the case.

Now having built a few apps that do this, I felt it would be nice to document a working solution (Xcode 6.4 & iOS 8.4) that shows how to

- Properly prepare your iOS app to make a remote http api call when requested by the WatchKit app
- Properly handle errors on both the iOS app and WatchKit sides of the call
- What this example includes

### This example covers the following use-cases

- Glance interface requesting remote data from iOS parent
- Watch app requesting remote data from iOS parent
- AppDelegate handleWatchKitExtensionRequest properly orchestrating a remote http api calls
- I've additionally thrown in some XCTTests' for the code in the project.

### Alamofire

- To simplify what this codebase must do, I've leveraged Alamofire for making the necessary HTTP calls to a remove service.

### Authors and Contributors

At the moment, it's just me Anthony Broad-Crawford however, if you want to contribute feel free to do so.

### Support or Contact

If you have any questions please don't hesitate to contact me via Twitter at @broadcrawford or via email.
