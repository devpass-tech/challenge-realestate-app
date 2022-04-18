//
//  PropertyDetailsView.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 17/04/22.
//

import UIKit
import MapKit

public class PropertyDetailsView: UIView {
    
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
        label.text = "R$ 405.000"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let condLabel: UILabel = {
        let label = UILabel()
        label.text = "Condomínio R$ 495"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let iptuLabel: UILabel = {
        let label = UILabel()
        label.text = "IPTU R$ 0"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "69 m²"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roomsLabel: UILabel = {
        let label = UILabel()
        label.text = "3 quartos"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bathLabel: UILabel = {
        let label = UILabel()
        label.text = "2 banheiros"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let parkLabel: UILabel = {
        let label = UILabel()
        label.text = "1 vagas"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Sem endereço"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor.gray
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
        label.text = "Descrição"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id elit sit amet mauris bibendum feugiat. Aenean blandit ut diam id placerat. Quisque aliquet luctus lacus quis rhoncus. Proin id scelerisque diam. Aenean vehicula vel ipsum in vestibulum. Integer aliquet sollicitudin est. Donec commodo lobortis nulla, sed lobortis sapien efficitur ut. Phasellus vitae condimentum nibh, vel pellentesque sem. Nam in nulla semper, pharetra dui non, rutrum justo. Nulla eu ornare dui. Nullam pretium libero sit amet porta dignissim. Nulla consectetur convallis turpis eget pulvinar. Curabitur suscipit eget nisi et feugiat. Cras sollicitudin fermentum est, nec pellentesque lacus fringilla non. In id quam volutpat, placerat odio et, consequat leo. Aliquam dolor eros, suscipit et elit vel, gravida aliquam tortor. Maecenas pharetra laoreet bibendum. Proin in efficitur justo, vel varius justo. In hac habitasse platea dictumst. Aenean id elit augue. Ut vitae rhoncus odio. Nam dignissim lectus neque. Sed ut ante ultrices, posuere nunc et, convallis mauris. Aliquam justo purus, commodo eu facilisis eget, elementum ut dolor. Maecenas feugiat eleifend tellus quis congue. Fusce accumsan mauris sit amet tellus eleifend, non lobortis tellus viverra. Nulla tristique, lorem nec tristique tempor, nisi magna consequat mi, et maximus leo lectus ut tortor. Mauris rhoncus gravida tortor ac fermentum. Praesent fringilla eleifend nunc, et blandit dui sollicitudin vel. Fusce at venenatis metus. Nulla interdum felis vitae tempus porta. Nunc in nisl vel felis hendrerit consequat. Fusce at dictum magna. Maecenas sed bibendum nulla. Pellentesque ut dignissim turpis, non iaculis sapien. Mauris finibus sapien quam, et pellentesque arcu semper in. Integer odio dui, pulvinar nec est a, venenatis tincidunt tortor. Fusce sagittis nisl vitae rutrum pharetra. Pellentesque accumsan, ante ac vehicula finibus, elit magna consequat dui, at interdum tellus mi sed diam. Vivamus lacinia, sapien eu viverra imperdiet, libero eros laoreet orci, eget imperdiet ligula arcu et sapien. Donec et semper dui. Suspendisse potenti. Donec sed orci ante. Nunc malesuada laoreet velit sed venenatis. Nullam efficitur justo a nulla pellentesque, eu aliquam lectus aliquet. Ut ut consectetur quam. In erat justo, cursus ut sem iaculis, faucibus placerat metus. Aenean a lacus non purus finibus fringilla nec vitae metus. Nulla varius turpis sit amet enim consequat, eu lacinia lectus suscipit. Duis lorem diam, blandit at urna at, vulputate ornare arcu. Mauris ultricies, velit at hendrerit accumsan, turpis ipsum imperdiet metus, sit amet convallis massa purus at sem. "
        label.font = UIFont.systemFont(ofSize: 16)
        label.sizeToFit()
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var constraintDescriptionHeightMin = NSLayoutConstraint()
    private var constraintDescriptionHeightMax = NSLayoutConstraint()
    
    private lazy var  seeMoreOrHideButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Ver mais", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.addTarget(self, action: #selector(seeMoreOrHidePressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let interestLabel: UILabel = {
        let label = UILabel()
        label.text = "Tem interesse?"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nameText: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = "Nome"
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textAlignment = .left
        textField.keyboardType = .default
        textField.autocapitalizationType = .words
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
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
    
    lazy var  sendContactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Enviar contato", for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 6
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .white
        
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubviews() {
        self.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(propertyImageView)
        contentView.addSubview(valueLabel)
        contentView.addSubview(condLabel)
        contentView.addSubview(iptuLabel)
        contentView.addSubview(sizeLabel)
        contentView.addSubview(roomsLabel)
        contentView.addSubview(bathLabel)
        contentView.addSubview(parkLabel)
        contentView.addSubview(addressLabel)
        contentView.addSubview(mapView)
        contentView.addSubview(descriptionTitleLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(seeMoreOrHideButton)
        contentView.addSubview(interestLabel)
        contentView.addSubview(nameText)
        contentView.addSubview(emailText)
        contentView.addSubview(sendContactButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        constraintDescriptionHeightMin =             descriptionLabel.heightAnchor.constraint(equalToConstant: 200)
        constraintDescriptionHeightMax =  descriptionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 200)
        parkLabel.setContentHuggingPriority(UILayoutPriority.fittingSizeLevel, for: .horizontal)

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
            parkLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
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
            seeMoreOrHideButton.setTitle("Ver Mais", for: .normal)
        } else {
            seeMoreOrHideButton.setTitle("Esconder", for: .normal)
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
