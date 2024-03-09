//
//  cartViewController.swift
//  Shopping Demo App
//
//  Created by amit on 11/01/24.
//  Copyright © 2024 amit. All rights reserved.
//

import UIKit

class cartViewController: UIViewController {

    @IBOutlet weak var carttableview: UITableView!
    var cartProducts: [[String: Any]] = []

        override func viewDidLoad() {
            super.viewDidLoad()
            carttableview.delegate = self
            carttableview.dataSource = self
            carttableview.register(UINib(nibName: "cartTableViewCell", bundle: nil), forCellReuseIdentifier: "cartCell")
            cartProducts = UserDefaults.standard.array(forKey: "cartProducts") as? [[String: Any]] ?? []
        }
    }
extension cartViewController : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartProducts.count
    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)as! cartTableViewCell
        
        let product = cartProducts[indexPath.row]
        
        cell.producttitlelabel.text = product["Title"] as? String
        cell.price.text = "$\(product["Price"] as? Double ?? 0.0)"
        cell.productimage.image = product["image"] as? UIImage

        return cell
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            cartProducts.remove(at: indexPath.row)

UserDefaults.standard.set(cartProducts, forKey: "cartProducts")

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    
}
