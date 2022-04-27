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

        self.view.backgroundColor = .white

        fetchProperties()
        setButtonItem()
        self.addLoadingView(with: "Searching for listings...")
    }

    override func loadView() {
        self.view = propertyListView
    }
    
    private func configureViewModel() {
        viewModel.fetchListProperty()
        viewModel.propertyBind.bind = { result in
            guard let result = result else { return }
            
            DispatchQueue.main.async {
                self.propertyListView.updateView(with: result)
                self.removeLoadingView()
            }
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
