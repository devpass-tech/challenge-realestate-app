//
//  AccountView.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 11/04/22.
//

import UIKit

final class AccountView: UIView {
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Account"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let loginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Login with your account"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var emailText: UITextField = {
        let textField = UITextField(frame: .zero)
        
        textField.placeholder = "Email"
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textAlignment = .left
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var passwordText: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Password"
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.isSecureTextEntry = true
        textField.autocorrectionType = .no
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Login", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    let forgotButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Forgot Password", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.systemBlue, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    lazy var titleStackView: UIStackView = {
        var stackview = UIStackView(arrangedSubviews: [titleLabel, loginLabel])
        
        stackview.axis = .vertical
        stackview.spacing = 20
        stackview.distribution = .fill
        stackview.backgroundColor = .clear
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    lazy var textStackView: UIStackView = {
        var stackview = UIStackView(arrangedSubviews: [emailText, passwordText])
        
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        stackview.backgroundColor = .clear
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    lazy var buttonStackView: UIStackView = {
        var stackview = UIStackView(arrangedSubviews: [loginButton, forgotButton])
        
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        stackview.backgroundColor = .clear
        stackview.translatesAutoresizingMaskIntoConstraints = false
        
        return stackview
    }()
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        
        self.addSubview(titleStackView)
        self.addSubview(textStackView)
        self.addSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            titleStackView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            titleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            titleStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            textStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 15),
            textStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            textStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            textStackView.heightAnchor.constraint(equalToConstant: 100),
            
            buttonStackView.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 15),
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            buttonStackView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
}

extension AccountView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
