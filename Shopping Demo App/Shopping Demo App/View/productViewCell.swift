//
//  productViewCell.swift

//
//  Created by amit on 25/11/23.
//  Copyright © 2023 amit. All rights reserved.
//

import UIKit

class productViewCell: UITableViewCell {

    @IBOutlet weak var probuctbackgroundview: UIView!
    @IBOutlet weak var productimage: UIImageView!
    @IBOutlet weak var producttitlelabel: UILabel!
    @IBOutlet weak var productCategorylabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var ratingbutton: UIButton!
    @IBOutlet weak var discription: UILabel!
    @IBOutlet weak var price: UILabel!
    var product :Product?{
        didSet {
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        probuctbackgroundview.clipsToBounds = false
        probuctbackgroundview.layer.cornerRadius = 15
        productimage.layer.cornerRadius = 10
        self.probuctbackgroundview.backgroundColor = .systemGray6
        buyButton.layer.cornerRadius = 15
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func productDetailConfiguration(){
        guard let product = product else{return}
        producttitlelabel.text = product.title
        productCategorylabel.text = product.category
        discription.text = product.description
        price.text = "$\(product.price)"
        ratingbutton.setTitle("\(product.rating.rate)", for: .normal)
        productimage.setImage(with: product.image)
        
    }
}
