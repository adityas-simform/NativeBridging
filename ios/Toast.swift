//
//  Toast.swift
//  NativeBridging
//
//  Created by Aditya Solanki on 03/10/24.
//

import Foundation
import UIKit


@objc
public class Toast: NSObject {
    var someProperty: String = "Hello from Swift!"

    @objc
    public func doSomething() {
        print("Doing something in Swift")
      DispatchQueue.main.async {
                 if let topController = UIApplication.shared.keyWindow?.rootViewController {
                     topController.showToast(message: "Swift Toast!")
                 }
             }
    }
  
}

extension UIViewController {

    func showToast(message: String, duration: Double = 2.0) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 150, y: self.view.frame.size.height-100, width: 300, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 0.5, delay: duration, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: { _ in
            toastLabel.removeFromSuperview()
        })
    }
}

