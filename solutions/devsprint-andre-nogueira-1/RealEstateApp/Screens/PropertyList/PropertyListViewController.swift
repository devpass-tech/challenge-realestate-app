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
    
    private lazy var button: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.title = "Settings"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Real Estate App "
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(handleButton))
        

        self.view.backgroundColor = .white

        fetchProperties()
    }

    override func loadView() {
        self.view = propertyListView
    }
    
    

    func fetchProperties() {

        apiClient.fetchProperties { properties in

            DispatchQueue.main.async {

                self.propertyListView.updateView(with: properties)
            }
        }
    }
    
    @objc func handleButton() {
        print("click")
    }
}

