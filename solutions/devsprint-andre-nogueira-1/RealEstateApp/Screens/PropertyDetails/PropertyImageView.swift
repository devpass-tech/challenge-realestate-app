//
//  PropertyImageView.swift
//  RealEstateApp
//
//  Created by Douglas Biagi Grana on 14/04/22.
//

import UIKit

class PropertyImageView: BaseView, ViewCodable {
    lazy var propertyImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
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
