//
//  String+Extensions.swift
//  RealEstateApp
//
//  Created by Rodrigo Borges on 25/03/22.
//

import Foundation

extension String {

    static func formattedPrice(with condominium: Int, and iptu: Int) -> String {

        return "Condomínio R$ \(condominium)   IPTU R$ \(iptu)"
    }

    static func formattedAmenities(_ area: Int, _ bedrooms: Int, _ bathrooms: Int, parkingSpots: Int) -> String {

        return "\(area) m²   \(bedrooms) quartos   \(bathrooms) banheiros   \(parkingSpots) vagas"
    }
}
