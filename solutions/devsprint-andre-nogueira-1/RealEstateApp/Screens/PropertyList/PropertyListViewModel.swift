//
//  PropertyListViewModel.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 23/04/22.
//

import Foundation

protocol PropertyListViewModelProtocol: AnyObject {
    var propertyBind: Bindable<[Property]> { get set }
    func fetchListProperty()
}

final class PropertyListViewModel : PropertyListViewModelProtocol {
    var propertyBind: Bindable<[Property]> = Bindable([])
    private let apiClient: RealEstateAPIPropertyProtocol
    
    init(apiClient: RealEstateAPIPropertyProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchListProperty() {
        apiClient.fetchProperties { [weak self] response in
            switch response {
            case .success(let result):
                self?.propertyBind.value = result
            case .failure(let err):
                dump(err)
            }
        }
    }
}
