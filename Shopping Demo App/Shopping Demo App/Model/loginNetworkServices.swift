//
//  loginNetworkServices.swift
//  
//
//  Created by amit on 24/11/23.
//  Copyright © 2023 amit. All rights reserved.

import Foundation
import  UIKit
class Networkservice : UIViewController {
    static let shared = Networkservice()


  func login(username:String, password:String, completion: @escaping (Bool) -> Void){
 
        guard let url = URL(string: Constant.API.loginURL) else {
            
            return
        }
        
  
        let parameters: [String: String] = [
            "username": username,
            "password": password
        ]
        print(url)
        print(parameters)
        guard let body = try? JSONSerialization.data(withJSONObject: parameters) else {
            return
        }
   
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
//            let a = try? JSONSerialization.jsonObject(with: data ?? Data())
//            print(a)
 if let error = error {
                print("Error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                print("Invalid response")
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    if let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) {
//                        if loginResponse.id == 15 {
                            print("Login successful!")
                            print("Token: \(loginResponse.token)")
                            print("UserID: \(loginResponse.id)")
                          print("status code - \(httpResponse.statusCode)")
//                            UserDefaults.standard.set(true, forKey: loginResponse.token)
                  
                        
                    }
                    
                }
            completion(true)
            
            } else {
                // Handle other status codes (e.g., show an alert to the user)
                print("Error: Invalid status code - \(httpResponse.statusCode)")
                completion(false)
            }
        }
        task.resume()
    } 

}
