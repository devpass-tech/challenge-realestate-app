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
    let listingType: ListingType?
    let createdAt: String?
    let listingStatus: ListingStatus?
    let id: String?
    let parkingSpaces: Int?
    let updatedAt: String?
    let owner: Bool?
    let images: [String]?
    let address: Address?
    let bathrooms, bedrooms: Int?
    let pricingInfos: PricingInfos?

    enum CodingKeys: String, CodingKey {
        case welcomeDescription = "description"
        case usableAreas, listingType, createdAt, listingStatus, id, parkingSpaces, updatedAt, owner, images, address, bathrooms, bedrooms, pricingInfos
    }
}

enum ListingStatus: String, Codable {
    case active = "ACTIVE"
}

enum ListingType: String, Codable {
    case used = "USED"
}
