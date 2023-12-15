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
  
    func productDetailConfiguration(){
          producttitlelabel.text = Title
          productCategorylabel.text = category
          discription.text = Description
          price.text = "$\(Price)"
          ratingbutton.setTitle("\(rating)", for: .normal)
          productimage.setImage(with: image)
          
      }

}

 
  
