//
//  PropertyListView.swift
//  RealEstateApp
//
//  Created by Rodrigo Borges on 25/03/22.
//

import UIKit

struct ListViewConfiguration {

    let listItems: [String]
}

final class PropertyListView: UIView {

    private let listViewCellIdentifier = "ListViewCellIdentifier"

    private var listItems: [String] = []

    private lazy var tableView: UITableView = {

        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PropertyTableViewCell.self, forCellReuseIdentifier: PropertyTableViewCell.identifier)
        tableView.dataSource = self
        return tableView
    }()
    
    init() {

        super.init(frame: .zero)

        self.setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PropertyListView {

    func setupViews() {
        self.backgroundColor = .white
        self.configureSubviews()
        self.configureSubviewsConstraints()
    }

    func configureSubviews() {

        addSubview(self.tableView)
    }

    func configureSubviewsConstraints() {

        NSLayoutConstraint.activate([

            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            
        ])
    }
}

extension PropertyListView {

    func updateView(with repositories: [String]) {

        self.listItems = repositories
        self.tableView.reloadData()
    }
}

extension PropertyListView: UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.listItems.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyTableViewCell.identifier)!
//        cell.textLabel?.text = self.listItems[indexPath.row]
        return cell
    }
}


