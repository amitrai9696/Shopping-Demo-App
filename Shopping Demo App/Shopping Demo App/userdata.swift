//
//  userdata.swift
//  UI screen
//
//  Created by amit on 24/11/23.
//  Copyright © 2023 amit. All rights reserved.
//
import Foundation


struct Products: Decodable {
      let id: Int
     let  title: String
    let description: String
    let price : Float
    let image : String
       let rating :[Rate]
       let category : String
}
struct Rate {
    let rate: Float
    let count : Int
    
}
