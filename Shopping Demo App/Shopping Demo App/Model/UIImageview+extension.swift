//
//  UIImageview+extension.swift
//
//
//  Created by amit on 25/11/23.
//  Copyright © 2023 amit. All rights reserved.
//

import UIKit
import Kingfisher
extension UIImageView {
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
