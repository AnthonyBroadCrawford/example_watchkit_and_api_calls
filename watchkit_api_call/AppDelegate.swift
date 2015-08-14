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
            reply(["response":"SOME_ERROR_CODE"])
        })
        
        request(.GET, "http://www.google.com").responseString(encoding: nil) { (request, response, content, error) -> Void in
            
            reply(["response":"hello world :)"])
            application.endBackgroundTask(backgroundProcessingToken)
        }
    }
}