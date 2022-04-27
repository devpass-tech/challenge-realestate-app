//
//  PropertyDetailsViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyDetailsViewController: UIViewController {
    
    let propertyInfoView = PropertyInfoView()
    
    private lazy var propertyDetailsView: PropertyDetailsView = {
        let view = PropertyDetailsView()
        view.sendContactButton.addTarget(self, action: #selector(sendContactForm), for: .touchUpInside)
        return view
    }()
    
    override func loadView() {
        self.view = propertyDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detalhes da Propriedade"
        self.handleKeyboardPresentation()
        self.view.backgroundColor = .white
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.removeHandleKeyboardPresentation()
    }
    
    private func handleKeyboardPresentation() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let userInfo = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardSize = userInfo.cgRectValue
            
            self.propertyDetailsView.scrollView.contentInset.bottom = (keyboardSize.height) - 40
            self.propertyDetailsView.scrollView.scrollIndicatorInsets = self.propertyDetailsView.scrollView.contentInset
        }
    }
    
    @objc private func keyboardWillHide(notification: NSNotification) {
        self.propertyDetailsView.scrollView.contentInset = UIEdgeInsets.zero
        self.propertyDetailsView.scrollView.scrollIndicatorInsets = self.propertyDetailsView.scrollView.contentInset
    }
    
    private func removeHandleKeyboardPresentation() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: self.view.window)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: self.view.window)
    }
    
    @objc private func sendContactForm() {
        self.view.endEditing(true)
        self.presentAlertWithTitleOneButton(title: "Contato", message: "Seu contato foi enviado com sucesso!", buttonTitle: "Ok")
    }
}
