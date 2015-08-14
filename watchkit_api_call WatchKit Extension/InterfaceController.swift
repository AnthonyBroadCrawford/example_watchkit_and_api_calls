//
//  InterfaceController.swift
//  watchkit_api_call WatchKit Extension
//
//  Created by Anthony on 8/13/15.
//  Copyright (c) 2015 anthonybroadcrawford. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {

    @IBOutlet var button: WKInterfaceButton!
    @IBOutlet var label: WKInterfaceLabel!
    @IBOutlet var image: WKInterfaceImage!
    
    var timesCalled = 0
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
    }
    
    @IBAction func retrieveRemoteData() {
        let request = ["request":"app_data"]

        WKInterfaceController.openParentApplication(request, reply: { (reply, error) -> Void in
            if let payload = reply["response"] as? NSDictionary {
                if let currently = payload["currently"] as? NSDictionary {
                    
                    if let summary = currently["summary"] as? String {
                        self.label.setText(summary)
                    }
                    
                    if let icon = currently["icon"] as? String {
                        var imageName = "Frowney Face"
                        
                        if(icon == "clear-day" || icon == "clear-night"){
                           imageName = "Smiley Face"
                        }
                        
                        self.image.setImageNamed(imageName)
                    }
                }
            }
        })
    }
}
