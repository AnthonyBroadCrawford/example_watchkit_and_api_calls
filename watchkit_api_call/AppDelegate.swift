//
//  AppDelegate.swift
//  watchkit_api_call
//
//  Created by Anthony on 8/13/15.
//  Copyright (c) 2015 anthonybroadcrawford. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        return true
    }

    func application(application: UIApplication, handleWatchKitExtensionRequest userInfo: [NSObject : AnyObject]?, reply: (([NSObject : AnyObject]!) -> Void)!) {
        let backgroundProcessingToken = application.beginBackgroundTaskWithName("backgroundApiCall", expirationHandler: { () -> Void in
            reply(["response":"SOME_ERROR_CODE_INDICATING_TIMEOUT"])
        })
        
        request(.GET, "https://api.forecast.io/forecast/fed39bad3a28923641421a6d602e75fb/37.8267,-122.423").responseJSON(options: NSJSONReadingOptions.AllowFragments, completionHandler:{request, response, data, error in
            reply(["response":(data as! NSDictionary)])
            application.endBackgroundTask(backgroundProcessingToken)
        })
    }
}