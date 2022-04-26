import UIKit

class PropertyInfoView: BaseView, ViewCodable {
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = " R$ 405.000"
        label.font = .systemFont(ofSize: 20)
        label.tintColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buildingLabel: UILabel = {
        let label = UILabel()
        label.text = "Condomínio R$ 495 IPTU R$ 0"
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "69 m² 3 quartos 2 banheiros 1 vaga"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var addressLabel: UILabel = {
        let label = UILabel()
        label.text = "Sem endereço"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.lightGray.withAlphaComponent(0.9)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setUpHierarchy() {
        [priceLabel, buildingLabel, infoLabel, addressLabel].forEach {
            addSubview($0)
        }
    }
   
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            priceLabel.topAnchor.constraint(equalTo: bottomAnchor, constant: 10),
            priceLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            priceLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            buildingLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 10),
            buildingLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            buildingLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            infoLabel.topAnchor.constraint(equalTo: buildingLabel.bottomAnchor, constant: 10),
            infoLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            infoLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            addressLabel.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 10),
            addressLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            addressLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            
            bottomAnchor.constraint(equalTo: addressLabel.bottomAnchor, constant: 10)
        ])
    }
}
