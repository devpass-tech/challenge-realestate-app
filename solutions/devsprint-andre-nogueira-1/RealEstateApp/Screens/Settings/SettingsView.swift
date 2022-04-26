//
//  SettingsView.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 22/04/22.
//

import Foundation
import UIKit

final class SettingsView: UIView {
    
    private let titleVersionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "APP VERSION"
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let versionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "   Version 1.0"
        label.backgroundColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let navigationIten: UINavigationItem = {
        let item = UINavigationItem(title: "Settings")
        
        return item
    }()
    
    init() {
        super.init(frame: .zero)
        setupSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSubViews() {
        self.addSubview(titleVersionLabel)
        self.addSubview(versionLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        NSLayoutConstraint.activate([
            titleVersionLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100.0),
        titleVersionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        titleVersionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        
        versionLabel.topAnchor.constraint(equalTo: titleVersionLabel.bottomAnchor, constant: 5),
        versionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
        versionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
        versionLabel.heightAnchor.constraint(equalToConstant: 44),
        
        ])
    }
    
}
