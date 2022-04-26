//
//  PropertyTableViewCell.swift
//  RealEstateApp
//
//  Created by Paolo Prodossimo Lopes on 13/04/22.
//

import UIKit

final class PropertyTableViewCell: UITableViewCell {
    
    static var identifier: String {String.init(describing: Self.self)}
    
    private lazy var announcementImageView: UIImageView = {
        let imageView = UIImageView()
        let announcement = UIImage(named: "pic9")
        imageView.image = announcement
        imageView.contentMode = .scaleAspectFill
        imageView.tintColor = .blue
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var adDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = " R$ 405.000"
        label.font = .systemFont(ofSize: 20)
        label.tintColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var condominium: UILabel = {
        let label = UILabel()
        label.text = "Condomínio R$ 495 IPTU R$ 0"
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var characteristics: UILabel = {
        let label = UILabel()
        label.text = "69 m² 3 quartos 2 banheiros 1 vaga"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionAddress: UILabel = {
        let label = UILabel()
        label.text = "Sem endereço"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commomInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commomInit() {
        configureHierarchy()
        configureViewConstraints()
    }
    
    func configureHierarchy() {
        [announcementImageView,adDescriptionLabel,condominium, characteristics,descriptionAddress].forEach {
            addSubview($0)
        }
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            announcementImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            announcementImageView.rightAnchor.constraint(equalTo: rightAnchor),
            announcementImageView.leftAnchor.constraint(equalTo: leftAnchor),
            announcementImageView.heightAnchor.constraint(equalToConstant: 200),
            
            adDescriptionLabel.topAnchor.constraint(equalTo: announcementImageView.bottomAnchor, constant: 10),
            adDescriptionLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            adDescriptionLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            condominium.topAnchor.constraint(equalTo: adDescriptionLabel.bottomAnchor, constant: 10),
            condominium.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            condominium.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            characteristics.topAnchor.constraint(equalTo: condominium.bottomAnchor, constant: 10),
            characteristics.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            characteristics.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            descriptionAddress.topAnchor.constraint(equalTo: characteristics.bottomAnchor, constant: 10),
            descriptionAddress.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            descriptionAddress.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            bottomAnchor.constraint(equalTo: descriptionAddress.bottomAnchor, constant: 10)
        ])
    }
    
    func setup(property: Property) {
        adDescriptionLabel.text = "R$ \(property.pricingInfos?.price ?? "")"
        condominium.text = "Condomínio R$ \(property.pricingInfos?.monthlyCondoFee ?? "") IPTU R$ \(property.pricingInfos?.yearlyIptu ?? "")"
        characteristics.text = "\(property.usableAreas ?? 0) m² \(property.bedrooms ?? 0) quartos \(property.bathrooms ?? 0) banheiros \(property.parkingSpaces ?? 0) vaga"
        descriptionAddress.text = "\(property.address?.neighborhood ?? "")"
    }
}
