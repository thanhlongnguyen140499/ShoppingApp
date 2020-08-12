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
    var labelPrice: UILabel = UILabel()
    var buttonBuy: UIButton = UIButton()
    
    var indexPath: IndexPath = IndexPath(item: 0, section: 0)
    weak var delagate: ProductCollectionCellDelegate?
    
    func autoLayoutCell() {
        //contentView.backgroundColor = .yellow
        self.backgroundColor = .white
        
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false //accept to autolayout
        stackView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        //autolayout imageView
        stackView.addArrangedSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stackView.heightAnchor, multiplier: 1.7/3.0).isActive = true
        //autolayout labelProductName
        labelProductName.translatesAutoresizingMaskIntoConstraints = false
        labelProductName.text = "Product name"
        labelProductName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelProductName.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelProductName.font = UIFont.boldSystemFont(ofSize: 10)
        stackView.addArrangedSubview(labelProductName)
        //Autolayout labelPrice
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        labelProductName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        labelProductName.widthAnchor.constraint(equalToConstant: 50).isActive = true
        labelPrice.text = "100$"
        labelPrice.font = UIFont.boldSystemFont(ofSize: 10)
        stackView.addArrangedSubview(labelPrice)
        //autolayout buttonBuy
        buttonBuy.translatesAutoresizingMaskIntoConstraints = false
        buttonBuy.backgroundColor = .green
        buttonBuy.tintColor = .red
        buttonBuy.heightAnchor.constraint(equalToConstant: 25).isActive = true
        buttonBuy.widthAnchor.constraint(equalToConstant: 50).isActive = true
        buttonBuy.setTitle("Buy", for: .normal)
        buttonBuy.addTarget(self, action:#selector(openProductDetail), for: .touchUpInside)
        stackView.addArrangedSubview(buttonBuy)
        
        //stackview setting
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
    }
    var product: Product!{
        didSet{
            imageView.image = UIImage(named: product.imageName!)
            labelProductName.text = product.productName ?? ""
            labelPrice.text = product.productPrice ?? ""
            //labelProductDescription.text = product.productDescription ?? ""
        }
    }
    
    @objc func openProductDetail() {
        //print("Open")
        delagate?.openProductDetail(indexPath: indexPath)
    }
 }
