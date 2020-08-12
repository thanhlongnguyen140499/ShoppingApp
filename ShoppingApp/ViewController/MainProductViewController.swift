//
//  MainProductViewController.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 7/30/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit

class MainProductViewController: UIViewController,
    UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView?
    let cellId = "ExampleCell"
    let cellSpacing:CGFloat = 10

    // read data
    var products:[Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        
        view.backgroundColor = .red
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewLayout())
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView!)
        collectionView?.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView?.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView?.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView?.backgroundColor = .white
        //collectionView settings
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        collectionView?.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        collectionViewFlowLayout.scrollDirection = .vertical
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: cellSpacing, bottom: 0, right: cellSpacing)
        collectionViewFlowLayout.minimumInteritemSpacing = 10
        collectionViewFlowLayout.minimumLineSpacing = 10

        collectionView?.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
    }
    
    func getData() {
        products = DataManager.shared.getProducts()
    }
    
    //UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count 
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ProductCollectionViewCell
//        cell.backgroundColor = indexPath.row % 2 == 0 ? .cyan: .orange
//        cell.selectedBackgroundView = UIView()
//        cell.selectedBackgroundView?.backgroundColor = .red
        cell.autoLayoutCell()
        cell.product = products[indexPath.row]
        cell.indexPath = indexPath
        cell.delagate = self
        return cell
    }
    //UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //return CGSize(width: 100, height: 100)

        let width = (UIScreen.main.bounds.size.width - 3 * cellSpacing) / 2
        let height = width + 25
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Index: \(indexPath)")
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

extension MainProductViewController: ProductCollectionCellDelegate {
    func openProductDetail(indexPath: IndexPath) {
        //press button
        print("ttt \(indexPath.row)")
    }
}
