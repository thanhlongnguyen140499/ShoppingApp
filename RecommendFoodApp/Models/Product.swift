//
//  Product.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 7/28/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import Foundation

class Product {
    var imageName: String?
    var productName: String?
    var numberOfRating: Int?
    var productDescription: String?
    var productPrice: String?
    convenience init(imageName: String, productName: String, numberOfRating: Int, productDescription: String, productPrice: String) {
        self.init()
        self.imageName = imageName
        self.productName = productName
        self.numberOfRating = numberOfRating
        self.productDescription = productDescription
        self.productPrice = productPrice
    }
}


