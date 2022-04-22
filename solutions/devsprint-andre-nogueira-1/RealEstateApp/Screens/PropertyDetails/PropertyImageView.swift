//
//  PropertyImageView.swift
//  RealEstateApp
//
//  Created by Douglas Biagi Grana on 14/04/22.
//

import UIKit

class PropertyImageView: UIView, ViewCodable {
    lazy var propertyImage: UIImageView = {
        let i = UIImageView()
        i.translatesAutoresizingMaskIntoConstraints = false
        i.contentMode = .scaleToFill
        return i
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpHierarchy() {
        addSubview(propertyImage)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            propertyImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            propertyImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            propertyImage.leadingAnchor.constraint(equalTo: leftAnchor),
            propertyImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            propertyImage.heightAnchor.constraint(equalToConstant: 400),
        ])
    }
}