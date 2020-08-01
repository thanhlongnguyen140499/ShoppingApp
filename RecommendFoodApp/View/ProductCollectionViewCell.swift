 //
//  ProductCollectionViewCell.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 7/30/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit

 protocol ProductCollectionCellDelegate: class {
    func openProductDetail(indexPath: IndexPath)
 }
 
class ProductCollectionViewCell: UICollectionViewCell {
    
    var stackView: UIStackView = UIStackView()
    var imageView: UIImageView = UIImageView()
    var labelProductName: UILabel = UILabel()
    var labelProductDescription: UILabel = UILabel()
    var buttonBuy: UIButton = UIButton()
    
    var indexPath: IndexPath = IndexPath(item: 0, section: 0)
    weak var delagate: ProductCollectionCellDelegate?
    
    func autoLayoutCell() {
        self.backgroundColor = .white
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false //cho phep auto layout
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        //autolayout imageView
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 2.0/3.0).isActive = true
        //autolayout labelProductName
        labelProductName.translatesAutoresizingMaskIntoConstraints = false
        labelProductName.text = "Product name"
        labelProductName.font = UIFont.boldSystemFont(ofSize: 10)
        stackView.addArrangedSubview(labelProductName)
        //autolayout labelProductDescription
        labelProductDescription.translatesAutoresizingMaskIntoConstraints = false
        labelProductDescription.text = "Label Product Description"
        labelProductDescription.font = UIFont.systemFont(ofSize: 10)
        stackView.addArrangedSubview(labelProductDescription)
        //autolayout buttonBuy
        buttonBuy.translatesAutoresizingMaskIntoConstraints = false
        buttonBuy.backgroundColor = .green
        buttonBuy.tintColor = .red
        buttonBuy.addTarget(self, action:#selector(openProductDetail), for: .touchUpInside)
        stackView.addArrangedSubview(buttonBuy)
        
        //stackview setting
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.spacing = 15
    }
    var product: Product!{
        didSet{
            imageView.image = UIImage(named: product.imageName!)
            labelProductName.text = product.productName ?? ""
            labelProductDescription.text = product.productDescription ?? ""
        }
    }
    
    @objc func openProductDetail() {
        print("Open")
        delagate?.openProductDetail(indexPath: indexPath)
    }
}
