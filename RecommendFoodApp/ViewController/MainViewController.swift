//
//  MainViewController.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 7/28/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        products = DataManager.shared.getProducts()
    }
    
    //MARK - UITableViewDelegate,UITableViewDataSource
    //So hang trong bang - nhieu section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    //Hang thu i trong table view chi tiet la gi
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") as! ProductTableViewCell
        let product:Product = products[indexPath.row]
        cell.imageViewProduct?.image = UIImage(named: product.imageName!)
        cell.lblProductName?.text = product.productName
        cell.lblNumberOfRating?.text = ""
        for _ in 1...(product.numberOfRating ?? 5) {
            cell.lblNumberOfRating?.text = (cell.lblNumberOfRating?.text ?? "") + "★"
        }
        cell.lblProductDescription?.text = product.productDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath : \(indexPath.row)")
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let productDetail = mainStoryboard.instantiateViewController(identifier: "ProductDetailViewController") as! ProductDetailViewController
        self.present(productDetail, animated: true, completion: nil)
        let product:Product = products[indexPath.row]
        productDetail.productImageView.image = UIImage(named: product.imageName!)
        productDetail.labelProductName.text = product.productName
        productDetail.labelProductDescription.text = product.productDescription
        productDetail.labelRating.text = ""
        for _ in 1...(product.numberOfRating ?? 5) {
            productDetail.labelRating.text = (productDetail.labelRating.text ?? "") + "★"
        }
    }
}
