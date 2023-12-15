//
//  ProductAPIManager.swift
//  
//
//  Created by amit on 24/11/23.
//  Copyright © 2023 amit. All rights reserved.
//

import Foundation
import  UIKit
enum DataError : Error {
    case invalidResponse
    case invalidURL
    case invalidData
    case Network(Error?)
}

final class productAPIManager {
    static let shared  = productAPIManager()
    func fatchproduct(completion: @escaping(Result<[Product],DataError>) -> Void)  {
        guard let url = URL(string: Constant.API.productURL) else{return}
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data,error == nil else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse,
                200 ... 299 ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
                    
            }
            do {
                let product = try JSONDecoder().decode([Product].self, from: data)
                completion(.success(product))
            } catch{
                completion(.failure(.Network(error)))
            }
        }.resume()
    }
}
