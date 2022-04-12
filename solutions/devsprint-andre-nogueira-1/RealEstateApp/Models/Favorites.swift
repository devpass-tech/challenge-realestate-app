//
//  Favorites.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 12/04/22.
//

import Foundation

// MARK: - Favorites
struct Favorites: Codable {
    
    let description: String
    let usableAreas: Int
    let listingType, createdAt, listingStatus, id: String
    let parkingSpaces: Int
    let updatedAt: String
    let owner: Bool
    let images: [String]
    let address: Address
    let bathrooms, bedrooms: Int
    let pricingInfos: PricingInfos

}

// MARK: - Address
struct Address: Codable {
    let city, neighborhood: String
    let geoLocation: GeoLocation
}

// MARK: - GeoLocation
struct GeoLocation: Codable {
    let precision: String
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let lon, lat: Double
}

// MARK: - PricingInfos
struct PricingInfos: Codable {
    let yearlyIptu, price, businessType, monthlyCondoFee: String
    let period, rentalTotalPrice: String?
}
