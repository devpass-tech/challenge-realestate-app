//
//  Pricing.swift
//  RealEstateApp
//
//  Created by Douglas Biagi Grana on 14/04/22.
//

import Foundation

struct PricingInfos: Codable {
    let yearlyIptu, price: String?
    let businessType: BusinessType?
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
