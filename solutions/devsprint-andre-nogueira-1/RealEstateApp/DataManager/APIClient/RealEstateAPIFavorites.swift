//
//  File.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 12/04/22.
//

import Foundation

protocol RealEstateAPIClientFavoritesProtocol: AnyObject {
    func fetchFavorites(completion: @escaping (Result<[Favorites], ErrorRequest>) -> (Void))
}

class RealEstateAPIClientFavorites: RealEstateAPIClientFavoritesProtocol {
    
    func fetchFavorites(completion: @escaping (Result<[Favorites], ErrorRequest>) -> (Void)) {
        
        let urlStrings = ManagerGetURL.ManagerGetURL(endPoint: .favorites)
        
        guard let url = URL(string: urlStrings) else {
            completion(.failure(ErrorRequest.urlNotValid))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data else {
                completion(.failure(ErrorRequest.noData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let favorites = try decoder.decode([Favorites].self, from: data)
                completion(.success(favorites))
            } catch {
                completion(.failure(ErrorRequest.invalidJson))
            }
        } .resume()
        
    }
    
}
