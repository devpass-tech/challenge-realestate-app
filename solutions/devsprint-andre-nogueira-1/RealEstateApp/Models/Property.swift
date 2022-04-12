//
//  Property.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import Foundation

struct Property: Codable {
    let welcomeDescription: String?
    let usableAreas: Int?
    let listingType: ListingType
    let createdAt: String?
    let listingStatus: ListingStatus
    let id: String?
    let parkingSpaces: Int?
    let updatedAt: String?
    let owner: Bool?
    let images: [String]?
    let address: Address
    let bathrooms, bedrooms: Int?
    let pricingInfos: PricingInfos

    enum CodingKeys: String, CodingKey {
        case welcomeDescription = "description"
        case usableAreas, listingType, createdAt, listingStatus, id, parkingSpaces, updatedAt, owner, images, address, bathrooms, bedrooms, pricingInfos
    }
}

struct Address: Codable {
    let city: City
    let neighborhood: String?
    let geoLocation: GeoLocation
}

enum City: String, Codable {
    case empty = ""
    case sãoPaulo = "São Paulo"
}

// MARK: - GeoLocation
struct GeoLocation: Codable {
    let precision: Precision
    let location: Location
}

struct Location: Codable {
    let lon, lat: Double?
}

enum Precision: String, Codable {
    case geometricCenter = "GEOMETRIC_CENTER"
    case noGeocode = "NO_GEOCODE"
    case rangeInterpolated = "RANGE_INTERPOLATED"
    case rooftop = "ROOFTOP"
}

enum ListingStatus: String, Codable {
    case active = "ACTIVE"
}

enum ListingType: String, Codable {
    case used = "USED"
}

struct PricingInfos: Codable {
    let yearlyIptu, price: String?
    let businessType: BusinessType
    let monthlyCondoFee: String?
    let period: Period?
    let rentalTotalPrice: String?
}

enum BusinessType: String, Codable {
    case rental = "RENTAL"
    case sale = "SALE"
}

enum Period: String, Codable {
    case monthly = "MONTHLY"
}
