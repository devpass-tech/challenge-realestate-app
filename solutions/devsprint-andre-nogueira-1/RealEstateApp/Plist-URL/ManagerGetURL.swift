//
//  File.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 13/04/22.
//

import Foundation

public enum EndPointsRequest {
    case favorites
}

struct ManagerGetURL {
    
    public static func ManagerGetURL(endPoint: EndPointsRequest) -> String {
        
        let baseURL = InfoPlistBaseURL.getStringValue(forKey: "BaseURL")
        let favorites = InfoPlistBaseURL.getStringValue(forKey: "FavoritesRequestEndPoint")
        var urlString = ""
        switch endPoint {
        case .favorites:
            urlString = "\(baseURL)\(favorites)"
        }
        
        return urlString
    }
    
}
