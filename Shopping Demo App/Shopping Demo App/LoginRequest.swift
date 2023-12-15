//
//  LoginRequest.swift
//  UI screen
//
//  Created by amit on 05/12/23.
//  Copyright © 2023 amit. All rights reserved.
//

import Foundation

struct LoginRequest: Codable {
    let username: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
    // Add other properties as needed
}
