//
//  ProductDetailViewController.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 8/2/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

//    var productViewDetail: UIView?
    var productImageView: UIImageView = UIImageView()
    var labelProductName: UILabel = UILabel()
    var labelProductDescription: UILabel = UILabel()
    var labelRating: UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //Autolayout ProductDetailViewController
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(productImageView)
        view.addSubview(labelProductName)
        view.addSubview(labelProductDescription)
        view.addSubview(labelRating)
        
        //Autolayout productImageView
        productImageView.translatesAutoresizingMaskIntoConstraints = false
        productImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        productImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
        productImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 2.0/3.0).isActive = true
        
        //Autolayout labelProductName
        labelProductName.translatesAutoresizingMaskIntoConstraints = false
        labelProductName.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 60).isActive = true
        labelProductName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        labelProductName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        labelProductName.font = UIFont.boldSystemFont(ofSize: 20)
        
        //Autolayout labelProductDescription
        labelProductDescription.translatesAutoresizingMaskIntoConstraints = false
        labelProductDescription.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 90).isActive = true
        labelProductDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        labelProductDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
        labelProductDescription.font = UIFont.systemFont(ofSize: 15)
        
        //Autolayout labelRating
        labelRating.translatesAutoresizingMaskIntoConstraints = false
        labelRating.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20).isActive = true
        labelRating.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        labelRating.widthAnchor.constraint(equalToConstant: 110).isActive = true
        labelRating.font = UIFont.systemFont(ofSize: 20)
        labelRating.textColor = .systemYellow
    }
}
