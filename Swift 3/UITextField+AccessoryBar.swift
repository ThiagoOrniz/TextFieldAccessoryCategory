//
//  UITextField+AccessoryBar.swift
//
//  Created by Thiago Orniz Martin on 28/12/16.
//  Copyright © 2017 Thiago Orniz Martin. All rights reserved.
//

import UIKit

private var nextTextFieldKey: UInt8 = 0

extension UITextField {
    
    var nextTextField: UITextField! {
        get {
            return objc_getAssociatedObject(self, &nextTextFieldKey) as? UITextField
        }
        set {
            objc_setAssociatedObject(self, &nextTextFieldKey, newValue, objc_AssociationPolicy(rawValue:1)!)
        }
    }
    
    func setAccessoryBar(with nextTextField: UITextField?) {
        
        self.nextTextField = nextTextField
        self.inputAccessoryView = createToolbar()
    }
    
    func doneBarButtonItemTouched() {
        
        if self.nextTextField == nil {
            self.resignFirstResponder()

        } else {
            self.nextTextField.becomeFirstResponder()
        }
    }
    
    private func createToolbar() -> UIView {
        
        let toolbar = UIToolbar()
        let rect = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: UIScreen.main.bounds.size.width, height: 44)
        toolbar.frame = rect
        toolbar.backgroundColor = .white
        
        let title:UILabel = self.setLabelWithTitle(title: self.placeholder ?? "")
        
        let doneBarButtonItem: UIBarButtonItem = UIBarButtonItem()
        doneBarButtonItem.target = self
        doneBarButtonItem.action = #selector(doneBarButtonItemTouched)
        doneBarButtonItem.title = nextTextField == nil ? "Next" : "Done"
        
        let flexible:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        var items = [UIBarButtonItem]()
        items.append(flexible)
        items.append(doneBarButtonItem)
        
        toolbar.items = items
        toolbar.addSubview(title)
        toolbar.sizeToFit()
        
        return toolbar
    }
    
    private func setLabelWithTitle(title: String) -> UILabel {
        
        let titleLabel:UILabel = UILabel()
        let rect = CGRect(x: 16, y: 0, width: 200, height: 40)
        
        titleLabel.frame = rect
        titleLabel.text = title
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.textColor = .darkGray
        
        return titleLabel
    }
}