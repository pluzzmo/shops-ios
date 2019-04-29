//
//  ShopCell.swift
//  Shops
//
//  Created by Ramzi BOUKERI on 29/04/2019.
//  Copyright © 2019 Ramzi BOUKERI. All rights reserved.
//

import UIKit
import AlamofireImage

class ShopCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var offerLabel: UILabel!
    @IBOutlet var logoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
