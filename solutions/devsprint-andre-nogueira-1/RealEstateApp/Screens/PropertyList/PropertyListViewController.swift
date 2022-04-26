//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {

    let propertyListView: PropertyListView = {

        let propertyListView = PropertyListView()
        return propertyListView
    }()

    let apiClient = RealEstateAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Real Estate App 🏡"

        self.view.backgroundColor = .white

        fetchProperties()
        setButtonItem()
    }

    override func loadView() {
        self.view = propertyListView
    }

    func fetchProperties() {
        apiClient.fetchProperties { [weak self] result in
            guard let self = self else { return }
            //passar os dados para a PropertyListView
        }
    }
    
    private func setButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(openSettings))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .done, target: self, action: #selector(openSettings))
        navigationItem.rightBarButtonItem?.isEnabled = true
    }
    
    @objc private func openSettings() {
        navigationController?.present(SettingsViewController(), animated: true)
    }
}

