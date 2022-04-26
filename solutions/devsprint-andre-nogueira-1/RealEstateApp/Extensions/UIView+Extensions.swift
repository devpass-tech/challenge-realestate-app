//
//  UIView+Extensions.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 21/04/22.
//

import UIKit

extension UIView {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        self.endEditing(true)
    }
}
