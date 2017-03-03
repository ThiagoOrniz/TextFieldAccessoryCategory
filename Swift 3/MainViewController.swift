//
//  ViewController.swift
//  
//
//  Created by Thiago Orniz on 15/12/16.
//  Copyright © 2016 Thiago Orniz. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextFields()  
    }
    
    private func setupTextFields(){
        emailTextField.setAccessoryBar(with: passwordTextField)
        //the last one is nil so the accessory bar can have "done" as the button title
        passwordTextField.setAccessoryBar(with: nil)   
    }
}
