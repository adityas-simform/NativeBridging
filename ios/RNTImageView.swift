//  RNTImageManager.swift
//  NativeBridging
//
//  Created by Aditya Solanki on 08/10/24.

import Foundation
import UIKit
import React

@objc(RNTImageView)
class RNTImageView: RCTViewManager {
    // Custom implementation for handling the "src" property
    @objc func setSrc(_ sources: NSArray, forImageView view: UIImageView) {
        if let firstSource = sources.firstObject as? [String: Any],
           let uri = firstSource["uri"] as? String,
           let imageURL = URL(string: uri) {
            
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: imageURL),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        view.image = image
                    }
                }
            }
        }
    }

    // Custom implementation for handling "borderRadius"
    @objc func setBorderRadius(_ radius: CGFloat,forImageView view: UIImageView) {
        view.layer.cornerRadius = radius
        view.clipsToBounds = true
    }

  // Custom implementation for handling "resizeMode"
      @objc func setResizeMode(_ mode: String,forImageView view: UIImageView) {
          switch mode {
          case "cover":
              view.contentMode = .scaleAspectFill
          case "contain":
              view.contentMode = .scaleAspectFit
          case "stretch":
              view.contentMode = .scaleToFill
          case "center":
              view.contentMode = .center
          default:
              view.contentMode = .scaleToFill
          }
      }

    // Custom implementation for handling "width"
    @objc func setWidth(_ width: CGFloat,forImageView view: UIImageView) {
        var frame = view.frame
        frame.size.width = width
        view.frame = frame
    }

    // Custom implementation for handling "height"
    @objc func setHeight(_ height: CGFloat,forImageView view: UIImageView) {
        var frame = view.frame
        frame.size.height = height
        view.frame = frame
    }

    // Specify the properties to be exported
    override static func requiresMainQueueSetup() -> Bool {
        return true
    }
}
