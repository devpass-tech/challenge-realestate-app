//
//  UIViewController+Extensions.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 13/04/22.
//

import UIKit

extension UIViewController {
    func addLoadingView(with text: String) {
        let loadingView = LoadingView(with: text)
        loadingView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(loadingView)
        
        NSLayoutConstraint.activate([
            loadingView.topAnchor.constraint(equalTo: self.view.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            loadingView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            loadingView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
        ])
    }
    
    func removeLoadingView() {
        for subview in view.subviews {
            if let subview = subview as? LoadingView {
                subview.removeFromSuperview()
            }
        }
    }
    
    func presentAlertWithTitleOneButton(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        
        self.present(alert, animated: true)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
