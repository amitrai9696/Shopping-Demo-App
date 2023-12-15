//
//  products.swift
//
//
//  Created by amit on 25/11/23.
//  Copyright © 2023 amit. All rights reserved.
//

import Foundation

struct Product: Decodable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Decodable {
    let rate: Double
    let count: Int
}
