//
//  HomeLoginViewController.swift
//  RecommendFoodApp
//
//  Created by Nguyen Thanh Long on 8/6/20.
//  Copyright © 2020 Nguyen Thanh Long. All rights reserved.
//

import UIKit

class HomeLoginViewController: UIViewController {
    @IBOutlet weak var buttonSignUp: UIButton!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements()  {
        
        Utilities.styleFilledButton(buttonLogin)
        Utilities.styleFilledButton(buttonSignUp)
    }

}
