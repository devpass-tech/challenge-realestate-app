//
//  AccountView.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 11/04/22.
//

import UIKit

final class AccountView: BaseView {
    
    private let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Account"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Login with your account"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        label.numberOfLines = 3
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailText: UITextField = {
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
    
    private lazy var passwordText: UITextField = {
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
    
    private let labelStackView: UIStackView = {
        var stackview = UIStackView(frame: .zero)
        stackview.axis = .vertical
        stackview.spacing = 20
        stackview.distribution = .fill
        stackview.backgroundColor = .clear
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let textStackView: UIStackView = {
        var stackview = UIStackView(frame: .zero)
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        stackview.backgroundColor = .clear
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    private let buttonStackView: UIStackView = {
        var stackview = UIStackView(frame: .zero)
        stackview.axis = .vertical
        stackview.spacing = 10
        stackview.distribution = .fillEqually
        stackview.backgroundColor = .clear
        stackview.translatesAutoresizingMaskIntoConstraints = false
        return stackview
    }()
    
    override func setupSubviews() {
        labelStackView.addArrangedSubview(titleLabel)
        labelStackView.addArrangedSubview(loginLabel)
        textStackView.addArrangedSubview(emailText)
        textStackView.addArrangedSubview(passwordText)
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(forgotButton)
        self.addSubview(labelStackView)
        self.addSubview(textStackView)
        self.addSubview(buttonStackView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 15),
            labelStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            labelStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            
            textStackView.topAnchor.constraint(equalTo: labelStackView.bottomAnchor, constant: 15),
            textStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            textStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            textStackView.heightAnchor.constraint(equalToConstant: 100),
            
            buttonStackView.topAnchor.constraint(equalTo: textStackView.bottomAnchor, constant: 15),
            buttonStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            buttonStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            buttonStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

extension AccountView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
