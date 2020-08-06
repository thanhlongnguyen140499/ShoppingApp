//
//  LoginViewController.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 8/6/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var buttonLogin: UIButton!
    @IBOutlet weak var labelError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        // Hide the error label
        labelError.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(txtFieldEmail)
        Utilities.styleTextField(txtFieldPassword)
        Utilities.styleFilledButton(buttonLogin)
        
    }
    
    @IBAction func loginTapped(_ sender: Any) {
        
        //Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = txtFieldEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = txtFieldPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Singin in the users
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                //Coundn't sign in
                self.labelError.text = error!.localizedDescription
                self.labelError.alpha = 1
            }else{
                let homViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? LoginHomeViewController
                
                self.view.window?.rootViewController = homViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
}
