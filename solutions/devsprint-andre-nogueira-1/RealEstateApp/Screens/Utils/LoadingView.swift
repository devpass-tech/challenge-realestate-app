//
//  LoadingView.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 13/04/22.
//

import UIKit

final class LoadingView: UIView {
    
    private let textLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Loading..."
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loadingActivityIndicator: UIActivityIndicatorView = {
        var activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .lightGray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
    }()

    init(with text: String) {
        super.init(frame: .zero)
        
        backgroundColor = .white
        textLabel.text = text
        loadingActivityIndicator.startAnimating()

        setupSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubViews() {
        addSubview(textLabel)
        addSubview(loadingActivityIndicator)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor),
            textLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            loadingActivityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loadingActivityIndicator.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 20),
            loadingActivityIndicator.leftAnchor.constraint(equalTo: self.leftAnchor),
            loadingActivityIndicator.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
}
