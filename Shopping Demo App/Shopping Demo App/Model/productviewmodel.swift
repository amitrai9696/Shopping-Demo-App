//
//  productviewmodel.swift
//  
//
//  Created by amit on 25/11/23.
//  Copyright © 2023 amit. All rights reserved.
//

import Foundation
final class productviewmodel{
    var product :[Product] = [ ]
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fachproduct()  {
        self.eventHandler?(.loading)
           productAPIManager.shared.fatchproduct{ response in
            self.eventHandler?(.stopLoading)
            switch response {
                 case .success(let products):
                    self.product = products
                    self.eventHandler?(.dataLoaded)
                 case .failure(let error):
                    self.eventHandler?(.error(error))
                 }
             }
    }
}
extension productviewmodel {
    
    enum Event  {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
