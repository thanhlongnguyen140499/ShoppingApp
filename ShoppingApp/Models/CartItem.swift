//
//  CartItem.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 8/9/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import Foundation

class CarItem {
    var quantity : Int = 1
    var product : Product
    
    var subTotal : Float {
        get {
            let numberFormatter = NumberFormatter()
            let number = numberFormatter.number(from: product.productPrice!)
            let numberFloatValue = number!.floatValue
            return (numberFloatValue * Float(quantity))
        }
        
    }
    
    init(product: Product) {
        self.product = product
    }
    
}
