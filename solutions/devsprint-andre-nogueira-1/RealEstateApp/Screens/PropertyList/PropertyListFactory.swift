//
//  PropertyListFactory.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 23/04/22.
//

import Foundation

struct PropertyListFactory {
    static func createPropertyList() -> PropertyListViewController {
        let apiClient = RealEstateAPIClient()
        let propertyList = PropertyListViewModel(apiClient: apiClient)
        let viewController = PropertyListViewController(viewModel: propertyList)
        return viewController
    }
}
