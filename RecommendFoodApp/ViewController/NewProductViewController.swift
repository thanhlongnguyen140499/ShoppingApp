//
//  NewProductViewController.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 8/4/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit

class NewProductViewController: UIViewController,
    UITextFieldDelegate,
    UIImagePickerControllerDelegate,
    UINavigationControllerDelegate
    {

    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var txtProductName: UITextField!
    
    var products: [Product] = []
    var newProduct = Product()
    
    func getData() {
        products = DataManager.shared.getProducts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        //tap to imageProduct
        let tapGestureToImageView = UITapGestureRecognizer(target: self, action: #selector(tapToImageProduct(sender:)))
        tapGestureToImageView.numberOfTouchesRequired = 1  //number of Tap
        imageProduct.isUserInteractionEnabled = true  //accept to gesture
        imageProduct.addGestureRecognizer(tapGestureToImageView)

        //Tap to labelRating
        let tapGestureToLabelRating = UITapGestureRecognizer(target: self, action: #selector(panToLabelRating(sender:)))
        tapGestureToLabelRating.numberOfTouchesRequired = 1
        labelRating.addGestureRecognizer(tapGestureToLabelRating)
        
        //Pan in labelRating
        labelRating.textColor = .systemYellow
        let panGestureToLabelRating = UIPanGestureRecognizer(target: self, action: #selector(panToLabelRating(sender:)))
        labelRating.isUserInteractionEnabled = true
        labelRating.addGestureRecognizer(panGestureToLabelRating)
        
    }
    @IBAction func btnSave(_ sender: Any) {
        print("press Save !")
        if (newProduct.image == nil || newProduct.numberOfRating ?? 0 < 1 || newProduct.productName?.count == 0) {
            let alertController = UIAlertController(title: "Alert", message: "Please set product's name, choose image, rating for it", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            }
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            //Add newProduct to foods array
            products.append(newProduct)
            navigationController?.popViewController(animated: true)
            let mainViewController = self.navigationController?.topViewController as! MainViewController
            mainViewController.tableView.reloadData()
        }
    }
    
    @objc func tapToImageProduct(sender: UITapGestureRecognizer){
        print("Tap to imageView")
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    // MARK -- UINavigationControllerDelegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let chosenImage:UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        imageProduct!.image = chosenImage
        newProduct.image = chosenImage
        picker.dismiss(animated: true, completion: nil)
    }

    
    @objc func panToLabelRating(sender: UIPanGestureRecognizer){
        let locationInView = sender.location(in: self.view) // your finger location
        let newLabelRatingFrame = self.view.convert(labelRating.frame, from: labelRating.superview)
        let starFrame1 = CGRect(x: newLabelRatingFrame.origin.x,
                                y: newLabelRatingFrame.origin.y,
                                width: newLabelRatingFrame.size.width / 5,
                                height: newLabelRatingFrame.size.height)
        let starFrame2 = CGRect(x: newLabelRatingFrame.origin.x,
                                y: newLabelRatingFrame.origin.y,
                                width: 2 * newLabelRatingFrame.size.width / 5,
                                height: newLabelRatingFrame.size.height)
        let starFrame3 = CGRect(x: newLabelRatingFrame.origin.x,
                                y: newLabelRatingFrame.origin.y,
                                width: 3 * newLabelRatingFrame.size.width / 5,
                                height: newLabelRatingFrame.size.height)
        let starFrame4 = CGRect(x: newLabelRatingFrame.origin.x,
                                y: newLabelRatingFrame.origin.y,
                                width: 4 * newLabelRatingFrame.size.width / 5,
                                height: newLabelRatingFrame.size.height)

        let starFrame5 = newLabelRatingFrame

        if (starFrame1.contains(locationInView)) {
            labelRating.text = "★☆☆☆☆"
            newProduct.numberOfRating = 1
        }else if (starFrame2.contains(locationInView)) {
            labelRating.text = "★★☆☆☆"
            newProduct.numberOfRating = 2
        }else if (starFrame3.contains(locationInView)) {
            labelRating.text = "★★★☆☆"
            newProduct.numberOfRating = 3
        }else if (starFrame4.contains(locationInView)) {
            labelRating.text = "★★★★☆"
            newProduct.numberOfRating = 4
        }else if (starFrame5.contains(locationInView)) {
            labelRating.text = "★★★★★"
            newProduct.numberOfRating = 5
        }
    }
    //MARK -- UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("press return")
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        newProduct.productName = textField.text ?? ""
        textField.resignFirstResponder()
    }
}
