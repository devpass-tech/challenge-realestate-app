//
//  PropertyListView.swift
//  RealEstateApp
//
//  Created by Rodrigo Borges on 25/03/22.
//

import UIKit

final class PropertyListView: BaseView {

    private var listItems: [Property] = []
    
    override func setupSubviews() {
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }
    
    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PropertyTableViewCell.self, forCellReuseIdentifier: PropertyTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
}

private extension PropertyListView {
 
    func configureSubviews() {
        self.addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.topAnchor.constraint(equalTo: self.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
}

extension PropertyListView {

    func updateView(with repositories: [Property]) {
            self.listItems = repositories
            self.tableView.reloadData()
    }
}

extension PropertyListView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.listItems.count
    }

<<<<<<< HEAD
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let propertyCell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier, for: indexPath) as? PropertyTableViewCell else { return UITableViewCell() }
        
        propertyCell.setup(property: listItems[indexPath.row])
        
        return propertyCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
=======
<<<<<<< Updated upstream
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier)!
//        cell.textLabel?.text = self.listItems[indexPath.row]
        return cell
=======
<<<<<<< Updated upstream
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let propertyCell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier, for: indexPath) as? PropertyTableViewCell else { return UITableViewCell() }
        
        propertyCell.setup(property: listItems[indexPath.row])
        
        return propertyCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
=======
<<<<<<< Updated upstream
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier)!
//        cell.textLabel?.text = self.listItems[indexPath.row]
        return cell
=======
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let propertyCell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier, for: indexPath) as? PropertyTableViewCell else { return UITableViewCell() }
        
        propertyCell.setup(property: listItems[indexPath.row])
        
        return propertyCell
    }
}

extension PropertyListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itens = listItems[indexPath.row]
        let propertyDetailsFactory = PropertyDetailsFactory.createPropertyDetails()
        
        //TODO: - row do indexpath
        //obter o item da listitems na posicao row
        //chamar o factory da propertydetails e se nao tiver, criar
        //no factory chamar metodo setup obtendo a viewcontroller
        //em seguida fazer push nessa viewcontroller e passar o item da listitens para a prox view controller
        //na proxima vc preencher a view com o resultado
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> Stashed changes
>>>>>>> b5259ed (Cria PropertyDetailsFactory)
    }
}
