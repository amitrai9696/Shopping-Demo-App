//
//  cartTableViewCell.swift
//  
//
//  Created by amit on 04/01/24.
//

import UIKit

class cartTableViewCell: UITableViewCell {
  @IBOutlet weak var productimage: UIImageView!
      @IBOutlet weak var price: UILabel!
      @IBOutlet weak var producttitlelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
