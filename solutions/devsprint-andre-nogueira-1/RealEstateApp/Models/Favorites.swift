//
//  Favorites.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 12/04/22.
//

import Foundation

// MARK: - Favorites
struct Favorites: Codable {
    
    let description: String?
    let usableAreas: Int?
    let listingType, createdAt, listingStatus, id: String?
    let parkingSpaces: Int?
    let updatedAt: String?
    let owner: Bool?
    let images: [String]?
    let address: Address
    let bathrooms, bedrooms: Int?
    let pricingInfos: PricingInfos?
}
