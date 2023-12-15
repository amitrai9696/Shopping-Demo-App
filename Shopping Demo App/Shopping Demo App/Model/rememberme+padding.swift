//
//  rememberme+padding.swift
//  UI screen
//
//  Created by amit on 11/12/23.
//  Copyright © 2023 amit. All rights reserved.
//

import Foundation
import UIKit
class remembermeandpadding: UITextField {
    static let custam = remembermeandpadding()
    func leftImage(image: UIImage?, imageWidth: CGFloat, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: padding, y: 0, width: imageWidth, height: frame.height)
        imageView.contentMode = .center
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageWidth + 2 * padding, height: frame.height))
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = .always
    }
    func rememberme()  {
        if (AgreeIconChick == false) {
            
            (sender as AnyObject).setBackgroundImage((UIImage(named: "check-box")),for: UIControl.State.normal)
            passwordtextfield.isSecureTextEntry = false
            
            AgreeIconChick = true
        }
        else{
            (sender as AnyObject).setBackgroundImage((UIImage(named: "box")),for: UIControl.State.normal)
            AgreeIconChick = false
            passwordtextfield.isSecureTextEntry = true
        }
    }
    
}
