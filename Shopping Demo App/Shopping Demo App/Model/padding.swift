//
//  padding.swift
// 
//
//  Created by amit on 28/09/23.
//  Copyright © 2023 amit. All rights reserved.
//

import Foundation
import UIKit
class padding: UITextField {
    static let custam = padding()
    func leftImage(image: UIImage?, imageWidth: CGFloat, padding: CGFloat) {
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: padding, y: 0, width: imageWidth, height: frame.height)
        imageView.contentMode = .center
        
        let containerView = UIView(frame: CGRect(x: 0, y: 0, width: imageWidth + 2 * padding, height: frame.height))
        containerView.addSubview(imageView)
        leftView = containerView
        leftViewMode = .always
    }
    
}

