//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class ResultsVC: UIViewController {

}

class PropertyListViewController: UIViewController, UISearchResultsUpdating {

    let propertyListView: PropertyListView = {

        let propertyListView = PropertyListView()
        return propertyListView
    }()

    let apiClient = RealEstateAPIClient()
    
    let searchController = UISearchController(searchResultsController: ResultsVC())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSetupView()
        fetchProperties()
    }

    override func loadView() {
        self.view = propertyListView
    }
    
    func configureSetupView() {
        navigationItem.title = "Real Estate App "
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(handleButton))
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Type a city or neighborhood "
        navigationItem.searchController = searchController
         self.view.backgroundColor = .white
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        
       let vc = searchController.searchResultsController as? ResultsVC
        vc?.view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        print(text)
    }
    
    func fetchProperties() {
        apiClient.fetchProperties { [weak self] result in
            guard let self = self else { return }
            //passar os dados para a PropertyListView
        }
    }
    @objc func handleButton() {
        print("click")
    }
}

