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
    
    var products = [
        Product(imageName:"uniqlo1",productName:"uniqlo1",numberOfRating:1,productDescription:"Good Product"),
        Product(imageName:"uniqlo2",productName:"uniqlo2",numberOfRating:2,productDescription:"Good Product"),
        Product(imageName:"uniqlo3",productName:"uniqlo3",numberOfRating:3,productDescription:"Good Product"),
        Product(imageName:"uniqlo4",productName:"uniqlo4",numberOfRating:4,productDescription:"Good Product"),
        Product(imageName:"uniqlo5",productName:"uniqlo5",numberOfRating:5,productDescription:"Good Product"),
        Product(imageName:"uniqlo6",productName:"uniqlo6",numberOfRating:5,productDescription:"Good Product"),
        Product(imageName:"uniqlo7",productName:"uniqlo7",numberOfRating:5,productDescription:"Good Product"),
        Product(imageName:"uniqlo8",productName:"uniqlo8",numberOfRating:5,productDescription:"Good Product"),
        Product(imageName:"uniqlo9",productName:"uniqlo9",numberOfRating:5,productDescription:"Good Product"),
        Product(imageName:"uniqlo10",productName:"uniqlo10",numberOfRating:5,productDescription:"Good Product")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
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
        for _ in 1...(product.numberOfRating ?? 1) {
            cell.lblNumberOfRating?.text = (cell.lblNumberOfRating?.text ?? "") + "★"
        }
        cell.lblProductDescription?.text = product.productDescription
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath : \(indexPath.row)")
        
    }
}
