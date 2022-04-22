//
//  Address.swift
//  RealEstateApp
//
//  Created by Douglas Biagi Grana on 14/04/22.
//

import Foundation

struct Address: Codable {
    let city: City?
    let neighborhood: String?
    let geoLocation: GeoLocation?
}

enum City: String, Codable {
    case empty = ""
    case sãoPaulo = "São Paulo"
}

struct GeoLocation: Codable {
    let precision: Precision?
    let location: Location?
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
