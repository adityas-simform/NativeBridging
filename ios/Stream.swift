//
//  Stream.swift
//  NativeBridging
//
//  Created by Aditya Solanki on 04/10/24.
//

import Foundation
import React

@objc(Stream)
class Stream: RCTEventEmitter {
  
  var timer: Timer?

  // Required method: Define the events that will be emitted to JavaScript
  override func supportedEvents() -> [String]! {
    return ["onTimerChange"]
  }

  // Method to start the timer
  @objc
  func startStreaming() {
    print("Starting data stream from native module")
    
    // Create a timer to send events every 2 seconds
    DispatchQueue.main.async {
            print("Starting data stream from native module")
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.sendEventToReactNative), userInfo: nil, repeats: true)
        }
  }

  // Method to stop the timer
  @objc
  func stopStreaming() {
    print("Stopping data stream from native module")
    
    // Invalidate and clear the timer
    timer?.invalidate()
    timer = nil
  }

  // Method to send event to React Native
  @objc
  func sendEventToReactNative() {
    let data = "time change"; // Sending current time as data
    print("inside")
    // Send event to JavaScript with data
    sendEvent(withName: "onTimerChange", body: data)
  }
  
  // Required method: You can return false if you don’t use constants
  override static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
