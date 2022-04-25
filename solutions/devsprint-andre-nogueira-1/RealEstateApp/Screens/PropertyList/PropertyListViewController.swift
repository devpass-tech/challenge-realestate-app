//
//  ViewController.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import UIKit

class PropertyListViewController: UIViewController {

    private let viewModel: PropertyListViewModelProtocol

    private let propertyListView: PropertyListView = {
        let propertyListView = PropertyListView()
        return propertyListView
    }()

    init(viewModel: PropertyListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        configureViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Real Estate App 🏡"

        viewModel.fetchListProperty()
        self.addLoadingView(with: "Searching for listings...")
    }

    override func loadView() {
        self.view = propertyListView
    }
    
    private func configureViewModel() {
        viewModel.didFetch = { [weak self] result in
            DispatchQueue.main.async {
                self?.propertyListView.updateView(with: result)
                self?.removeLoadingView()
            }
        }
    }
}

