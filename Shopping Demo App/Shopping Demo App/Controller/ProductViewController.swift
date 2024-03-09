//
//  ProductViewController.swift
//
//  Created by amit on 06/12/23.
//  Copyright © 2023 amit. All rights reserved.
//
import UIKit
class ProductViewController: UIViewController {
    @IBOutlet weak var probuctbackgroundview: UIView!
     @IBOutlet weak var productimage: UIImageView!
     @IBOutlet weak var producttitlelabel: UILabel!
     @IBOutlet weak var productCategorylabel: UILabel!
     @IBOutlet weak var ratingbutton: UIButton!
     @IBOutlet weak var discription: UILabel!
     @IBOutlet weak var price: UILabel!
    var Title : String!
    var category : String!
    var Description: String!
    var Price : Double!
    var rating :Double!
    var image : String!
    override func viewDidLoad() {
        super.viewDidLoad()
        probuctbackgroundview.clipsToBounds = false
             probuctbackgroundview.layer.cornerRadius = 15
             productimage.layer.cornerRadius = 10
             self.probuctbackgroundview.backgroundColor = .systemGray6
          productDetailConfiguration()
    }
    @IBAction func cartbutton(_ sender: UIButton) {
        let VC = self.storyboard?.instantiateViewController(withIdentifier: "cartViewController") as! cartViewController
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    @IBAction func addcartButton(_ sender: UIButton) {
         if isProductAlreadyInCart() {
                   showAlert(message: "Product is already in the cart!")
               } else {
                   // Save product details to UserDefaults
                   saveToUserDefaults()
               }
    }
    func productDetailConfiguration(){
          producttitlelabel.text = Title
          productCategorylabel.text = category
          discription.text = Description
          price.text = "$\(Price!)"
      
          ratingbutton.setTitle("\(rating)", for: .normal)
          productimage.setImage(with: image)
      }
    func isProductAlreadyInCart() -> Bool {
           let cartProducts = UserDefaults.standard.array(forKey: "cartProducts") as? [[String: Any]] ?? []
           
           let productDetails: [String: Any] = [
                 "Title": Title,
                "Price": Price,
                "image": image
           ]

           // Check if the product with the same details is already in the cart
          return cartProducts.contains { dict in
            return NSDictionary(dictionary: dict).isEqual(to: productDetails)}
       }
    func saveToUserDefaults() {
           var cartProducts: [[String: Any]] = UserDefaults.standard.array(forKey: "cartProducts") as? [[String: Any]] ?? []
           
           let productDetails: [String: Any] = [
               "Title": Title,
               "Price": Price,
               "image": image
           ]
           
           cartProducts.append(productDetails)
           UserDefaults.standard.set(cartProducts, forKey: "cartProducts")
           
           // Optionally, you can show an alert or perform any other UI update
           showAlert(message: "Product added to cart!")
       }
       func showAlert(message: String) {
           let alertController = UIAlertController(title: "Cart", message: message, preferredStyle: .alert)
           alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alertController, animated: true, completion: nil)
       }

}
