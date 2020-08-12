//
//  ProductTableViewCell.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 7/28/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageViewProduct: UIImageView?
    @IBOutlet weak var lblProductName: UILabel?
    @IBOutlet weak var lblNumberOfRating: UILabel?
    @IBOutlet weak var lblProductDescription: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
