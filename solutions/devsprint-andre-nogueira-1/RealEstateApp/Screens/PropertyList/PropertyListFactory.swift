//
//  PropertyListFactory.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 23/04/22.
//

import Foundation

struct PropertyListFactory {
    static func createPropertyList() -> PropertyListViewController {
        let managerUrl = ManagerGetURL()
        let apiClientProperty = RealEstateAPIClientProperty(url: managerUrl)
        let propertyList = PropertyListViewModel(apiClient: apiClientProperty)
        let viewController = PropertyListViewController(viewModel: propertyList)
        return viewController
    }
}
