//
//  File.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 13/04/22.
//

import Foundation

struct ManagerGetURL {
    
    public static func getFavoritesURL() -> String {
        
        let baseURL = InfoPlistBaseURL.getStringValue(forKey: "BaseURL")
        let favorites = InfoPlistBaseURL.getStringValue(forKey: "FavoritesRequestEndPoint")
        let urlString = baseURL + favorites
        
        return urlString
    }
    
    public static func getPropertiesURL() -> String {
        
        let baseURL = InfoPlistBaseURL.getStringValue(forKey: "BaseURL")
        let properties = InfoPlistBaseURL.getStringValue(forKey: "PropertyRequestEndPoint")
        let urlString = baseURL + properties
        
        return urlString
    }
    
}
