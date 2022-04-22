//
//  PropertyDetailsView.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 17/04/22.
//

import UIKit
import MapKit

public class PropertyDetailsView: BaseView {
    
    let scrollView: UIScrollView = {
        var scroll = UIScrollView(frame: .zero)
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    private let contentView: UIView = {
        var view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let propertyImageView: UIImageView = {
        var imageView = UIImageView(image: #imageLiteral(resourceName: "pic9"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.value
        label.font = DesignSystem.Typography.boldL
        label.textColor = DesignSystem.ColorPallet.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let condLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.condominium
        label.font = DesignSystem.Typography.boldM
        label.textColor = DesignSystem.ColorPallet.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iptuLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.iptu
        label.font = DesignSystem.Typography.boldM
        label.textColor = DesignSystem.ColorPallet.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.size
        label.font = DesignSystem.Typography.boldS
        label.textColor = DesignSystem.ColorPallet.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roomsLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.rooms
        label.font = DesignSystem.Typography.boldS
        label.textColor = DesignSystem.ColorPallet.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bathLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.baths
        label.font = DesignSystem.Typography.boldS
        label.textColor = DesignSystem.ColorPallet.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let parkLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.parks
        label.font = DesignSystem.Typography.boldS
        label.textColor = DesignSystem.ColorPallet.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.address
        label.font = DesignSystem.Typography.boldS
        label.textColor = DesignSystem.ColorPallet.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let regionCoordinate: MKCoordinateRegion = {
        let center = CLLocationCoordinate2D(latitude: 43.6109200, longitude: 3.8772300)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        return region
    }()
    
    private lazy var mapView: MKMapView = {
        var map = MKMapView(frame: .zero)
        map.mapType = .standard
        map.isZoomEnabled = false
        map.isScrollEnabled = false
        map.setRegion(regionCoordinate, animated: true)
        map.translatesAutoresizingMaskIntoConstraints = false
        return map
    }()
    
    private let descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.descriptions
        label.font = DesignSystem.Typography.boldL
        label.textColor = DesignSystem.ColorPallet.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = LocalizableString.loremipsum
        label.font = DesignSystem.Typography.m
        label.sizeToFit()
        label.textColor = DesignSystem.ColorPallet.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var constraintDescriptionHeightMin = NSLayoutConstraint()
    private var constraintDescriptionHeightMax = NSLayoutConstraint()
    
    private lazy var  seeMoreOrHideButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(LocalizableString.seeMore, for: .normal)
        button.backgroundColor = DesignSystem.ColorPallet.blue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.titleLabel?.font = DesignSystem.Typography.l
        button.addTarget(self, action: #selector(seeMoreOrHidePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let interestLabel: UILabel = {
        let label = UILabel()
        label.text = LocalizableString.interest
        label.font = DesignSystem.Typography.boldL
        label.textColor = DesignSystem.ColorPallet.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameText: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = LocalizableString.name
        textField.textColor = DesignSystem.ColorPallet.black
        textField.borderStyle = .roundedRect
        textField.font = DesignSystem.Typography.s
        textField.textAlignment = .left
        textField.keyboardType = .default
        textField.autocapitalizationType = .words
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailText: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = LocalizableString.email
        textField.textColor = DesignSystem.ColorPallet.black
        textField.borderStyle = .roundedRect
        textField.font = DesignSystem.Typography.s
        textField.textAlignment = .left
        textField.keyboardType = .emailAddress
        textField.autocapitalizationType = .none
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var  sendContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(LocalizableString.contact, for: .normal)
        button.backgroundColor = DesignSystem.ColorPallet.blue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.titleLabel?.font = DesignSystem.Typography.boldL
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func setupSubviews() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [propertyImageView, valueLabel, condLabel, iptuLabel, sizeLabel, roomsLabel, bathLabel, parkLabel, addressLabel, mapView, descriptionTitleLabel, descriptionLabel, seeMoreOrHideButton, interestLabel, nameText, emailText, sendContactButton].forEach { contentView.addSubview($0) }
        
        setupConstraints()
    }
    
    func setupConstraints() {
        constraintDescriptionHeightMin = descriptionLabel.heightAnchor.constraint(equalToConstant: 200)
        constraintDescriptionHeightMax = descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)

        NSLayoutConstraint.activate([
            scrollView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: self.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: self.rightAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.heightAnchor),
            
            propertyImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            propertyImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            propertyImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            propertyImageView.heightAnchor.constraint(equalToConstant: 200),
            
            valueLabel.topAnchor.constraint(equalTo: propertyImageView.bottomAnchor, constant: 20),
            valueLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            valueLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            valueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            condLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 15),
            condLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            condLabel.heightAnchor.constraint(equalToConstant: 20),
            condLabel.widthAnchor.constraint(equalToConstant: 160),
            
            iptuLabel.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 15),
            iptuLabel.leftAnchor.constraint(equalTo: condLabel.rightAnchor, constant: 10),
            iptuLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            iptuLabel.heightAnchor.constraint(equalToConstant: 20),
            
            sizeLabel.topAnchor.constraint(equalTo: condLabel.bottomAnchor, constant: 10),
            sizeLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            sizeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            roomsLabel.topAnchor.constraint(equalTo: condLabel.bottomAnchor, constant: 10),
            roomsLabel.leftAnchor.constraint(equalTo: sizeLabel.rightAnchor, constant: 15),
            roomsLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bathLabel.topAnchor.constraint(equalTo: condLabel.bottomAnchor, constant: 10),
            bathLabel.leftAnchor.constraint(equalTo: roomsLabel.rightAnchor, constant: 10),
            bathLabel.heightAnchor.constraint(equalToConstant: 20),
            
            parkLabel.topAnchor.constraint(equalTo: condLabel.bottomAnchor, constant: 10),
            parkLabel.leftAnchor.constraint(equalTo: bathLabel.rightAnchor, constant: 10),
            parkLabel.rightAnchor.constraint(lessThanOrEqualTo: contentView.rightAnchor, constant: -15),
            parkLabel.heightAnchor.constraint(equalToConstant: 20),
            
            addressLabel.topAnchor.constraint(equalTo: parkLabel.bottomAnchor, constant: 5),
            addressLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            addressLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            addressLabel.heightAnchor.constraint(equalToConstant: 20),
            
            mapView.topAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 20),
            mapView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            mapView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 200),
            
            descriptionTitleLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 10),
            descriptionTitleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            descriptionTitleLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            descriptionTitleLabel.heightAnchor.constraint(equalToConstant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: descriptionTitleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            constraintDescriptionHeightMin,
            
            seeMoreOrHideButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            seeMoreOrHideButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            seeMoreOrHideButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            seeMoreOrHideButton.heightAnchor.constraint(equalToConstant: 40),

            interestLabel.topAnchor.constraint(equalTo: seeMoreOrHideButton.bottomAnchor, constant: 10),
            interestLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            interestLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            interestLabel.heightAnchor.constraint(equalToConstant: 20),
            
            nameText.topAnchor.constraint(equalTo: interestLabel.bottomAnchor, constant: 10),
            nameText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            nameText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            nameText.heightAnchor.constraint(equalToConstant: 40),
            
            emailText.topAnchor.constraint(equalTo: nameText.bottomAnchor, constant: 10),
            emailText.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            emailText.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            emailText.heightAnchor.constraint(equalToConstant: 40),
            
            sendContactButton.topAnchor.constraint(equalTo: emailText.bottomAnchor, constant: 10),
            sendContactButton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            sendContactButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            sendContactButton.heightAnchor.constraint(equalToConstant: 40),
            sendContactButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func seeMoreOrHidePressed() {
        constraintDescriptionHeightMin.isActive = !constraintDescriptionHeightMin.isActive
        constraintDescriptionHeightMax.isActive = !constraintDescriptionHeightMin.isActive
       
        if (constraintDescriptionHeightMin.isActive) {
            seeMoreOrHideButton.setTitle(LocalizableString.seeMore, for: .normal)
        } else {
            seeMoreOrHideButton.setTitle(LocalizableString.hide, for: .normal)
        }
      
        UIView.animate(withDuration: 0.3, animations: {
            self.layoutIfNeeded()
        })
    }
}

extension PropertyDetailsView: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
