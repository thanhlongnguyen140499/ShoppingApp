//
//  DataManager.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 8/2/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private init() {
        
    }
    
    // MARK: - Helper func get products
    
    private var products = [
        Product(imageName:"uniqlo1", productName:"uniqlo1", numberOfRating:1, productDescription:"Good Product", productPrice: "89.0"),
        Product(imageName:"uniqlo2", productName:"uniqlo2", numberOfRating:2, productDescription:"Good Product", productPrice: "89.0"),
        Product(imageName:"uniqlo3", productName:"uniqlo3", numberOfRating:3, productDescription:"Good Product", productPrice: "100"),
        Product(imageName:"uniqlo4", productName:"uniqlo4", numberOfRating:4, productDescription:"Good Product", productPrice: "56.0"),
        Product(imageName:"uniqlo5", productName:"uniqlo5", numberOfRating:5, productDescription:"Good Product", productPrice: "100"),
        Product(imageName:"uniqlo6", productName:"uniqlo6", numberOfRating:5, productDescription:"Good Product", productPrice: "78.0"),
        Product(imageName:"uniqlo7", productName:"uniqlo7", numberOfRating:5, productDescription:"Good Product", productPrice: "100"),
        Product(imageName:"uniqlo8", productName:"uniqlo8", numberOfRating:5, productDescription:"Good Product", productPrice: "100"),
        Product(imageName:"uniqlo9", productName:"uniqlo9", numberOfRating:5, productDescription:"Good Product", productPrice: "69.0"),
        Product(imageName:"uniqlo10", productName:"uniqlo10", numberOfRating:5, productDescription:"Good Product", productPrice: "100")
    ]
    
    func getProducts() -> [Product] {
        return products
    }
}

