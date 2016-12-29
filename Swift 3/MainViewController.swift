//
//  ViewController.swift
//  
//
//  Created by Thiago Orniz on 15/12/16.
//  Copyright © 2016 Thiago Orniz. All rights reserved.
//

import UIKit


class MainViewController: UIViewController{
    
   
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextFields()
    
        
    }
    
    private func setupTextFields(){
        
        // Swift can't pass nil, so we create an empty UITextField with placeholder valued "-1"
        // We will use this placeholder to check if it's the last text field
        let emptyTextField = UITextField()
        emptyTextField.placeholder = "-1"
        
        emailTextField.inputAccessoryView = emailTextField.setAccessoryView(textField: emailTextField, nextTextField: passwordTextField)
        
        passwordTextField.inputAccessoryView = passwordTextField.setAccessoryView(textField: passwordTextField, nextTextField:emptyTextField )
    }   
}


