//
//  Network services.swift
//  UI screen
//
//  Created by amit on 22/11/23.
//  Copyright © 2023 amit. All rights reserved.
//
 
import Foundation
import  UIKit
class Networkservice : UIViewController{
    static let shaird = Networkservice()
    func login(username: String, password: String) {
        // Specify the URL for the login API
        guard let url = URL(string: "https://dummyjson.com/auth/login") else {
            print("Invalid URL")
            return
        }

        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        // Set the request body with the login credentials
        let parameters: [String: Any] = [
            "username": username,
            "password": password
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Error encoding parameters: \(error)")
            return
        }

        // Set the request headers
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        // Create a URLSession task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Check for errors
            if let error = error {
                print("Error: \(error)")
                return
            }

            // Check if there is data
            guard let data = data else {
                print("No data received")
                return
            }

            // Parse the response JSON
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print("Response: \(json)")
                self.navigationVC()
                // You can handle the response data here
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }

        // Resume the task to make the request
        task.resume()
    }

            
    func navigationVC() {
    
          let vc = storyboard?.instantiateViewController(identifier: "HomeViewController") as! HomeViewController
           navigationController?.pushViewController(vc, animated: true)
            
        }
    }

