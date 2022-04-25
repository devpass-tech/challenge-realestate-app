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

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let propertyCell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier, for: indexPath) as? PropertyTableViewCell else { return UITableViewCell() }
        
        propertyCell.property = listItems[indexPath.row]
        
        return propertyCell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
