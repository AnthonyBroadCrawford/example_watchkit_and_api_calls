//
//  GlanceController.swift
//  watchkit_api_call WatchKit Extension
//
//  Created by Anthony Broad-Crawford on 8/13/15.
//  Copyright (c) 2015 anthonybroadcrawford. All rights reserved.
//
//  Created by Anthony Broad-Crawford on 8/13/15.
//  Copyright (c) 2015 anthonybroadcrawford. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import WatchKit
import Foundation

class GlanceController: WKInterfaceController {

    @IBOutlet var forecastLabel: WKInterfaceLabel!
    @IBOutlet var forecastMoodImage: WKInterfaceImage!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let request = ["request":"glance_data"]

        WKInterfaceController.openParentApplication(request, reply: { (reply, error) -> Void in
            
            // For production code, please inspect
            //  1 - The background job timedout or was killed by the operating system
            //  2 - The call to the http api (Darksky) failed for any reason
            //
            // lastly, I kept the code very "procedural" to remove indirection and keep the example simple
            // vs. extracting the responsibilities into a class or two.
            
            self.displayForecast(reply)
        })
    }
    
    private func displayForecast(response:NSDictionary){
        if let payload = response["response"] as? NSDictionary {
            if let data = payload["data"] as? NSDictionary {
                if let currently = data["currently"] as? NSDictionary{
                    if let summary = currently["summary"] as? String {
                        self.forecastLabel.setText(summary)
                    }
                    
                    if let icon = currently["icon"] as? String {
                        var imageName = "Frowney Face"
                        
                        if(icon == "clear-day" || icon == "clear-night"){
                            imageName = "Smiley Face"
                        }
                        
                        self.forecastMoodImage.setImageNamed(imageName)
                    }
                }
            }
        }
    }
}