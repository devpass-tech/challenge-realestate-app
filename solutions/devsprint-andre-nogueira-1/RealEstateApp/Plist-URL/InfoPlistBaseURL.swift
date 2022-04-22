//
//  InfoPlistBaseURL.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 13/04/22.
//

import Foundation

struct InfoPlistBaseURL {
    
    static func getStringValue(forKey key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
            fatalError("invalid \(key)")
        }
        return value
    }
}
