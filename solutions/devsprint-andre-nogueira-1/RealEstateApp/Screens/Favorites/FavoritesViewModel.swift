//
//  FavoritesViewModel.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 12/04/22.
//

import Foundation

class FavoritesViewModel {
    
    weak var delegate: RealEstateAPIClientFavoritesProtocol?
    
    init(delegate: RealEstateAPIClientFavoritesProtocol) {
        self.delegate = delegate
    }
}
