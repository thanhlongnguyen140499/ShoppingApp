//
//  SignUpViewController.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 8/6/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassWord: UITextField!
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var labelError: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElement()
    }

    func setUpElement(){
        
        //Hide the error label
        labelError.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(txtFieldFirstName)        
        Utilities.styleTextField(txtFieldLastName)
        Utilities.styleTextField(txtFieldEmail)
        Utilities.styleTextField(txtFieldPassWord)
        Utilities.styleFilledButton(buttonSignUp)
    }
    
    func validateFields() -> String? {
        // check that all fields are filled in
        if txtFieldFirstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtFieldLastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtFieldEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            txtFieldPassWord.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in the fields."
        }
        
        // check if the password is secure
        let cleanedPassword = txtFieldPassWord.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Passwork isn't secure enough
            return "Please make sure your passwork is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @IBAction func signUpTapped(_ sender: Any) {
        //Validate the fields
        let error = validateFields()
        
        if error != nil {
            // There's something wrong with the fields
            showError(error!)
        }
        else{
        
        // Create cleaned versions of data
            let firstName = txtFieldFirstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = txtFieldLastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtFieldEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtFieldPassWord.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
        // Create the user
        Auth.auth().createUser(withEmail: email, password: password){
            (result, err) in
            // check for errors
            if err != nil {
                // There was an error creating user
                self.showError("Error creating user")
                
            }else {
                // User was created successfully
                let db = Firestore.firestore()
                
                db.collection("users").addDocument(data: ["firstname":firstName,"lastname":lastName,"uid":result!.user.uid]) { (error) in
                    
                    if error != nil {
                        // Show error message
                        self.showError("Error using data")
                        
                        
                    }
                }
                // Transition to home screen
                self.transitionToHome()
            }
        }
        
      }
    }
    
    func showError(_ message: String){
        labelError.text = message
        labelError.alpha = 1
    }
    
    func transitionToHome() {
        
        let homViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? LoginHomeViewController
        
        view.window?.rootViewController = homViewController
        view.window?.makeKeyAndVisible()
    }
}
