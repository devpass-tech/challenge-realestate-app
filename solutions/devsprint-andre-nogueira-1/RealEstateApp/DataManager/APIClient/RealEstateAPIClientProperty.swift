//
//  APIClient.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//

import Foundation

protocol RealEstateAPIPropertyProtocol: AnyObject {
    func fetchProperties(completion: @escaping (Result<[Property], ErrorRequest>) -> Void)
}

public final class RealEstateAPIClientProperty: RealEstateAPIPropertyProtocol {
    private let urlString: ManagerGetURL
    
    init(url: ManagerGetURL) {
        urlString = url
    }
    
    func fetchProperties(completion: @escaping (Result<[Property], ErrorRequest>) -> Void) {
        guard let url = URL(string: urlString.getPropertiesURL()) else {
            completion(.failure(ErrorRequest.urlNotValid))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                completion(.failure(ErrorRequest.invalidJson))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Property].self, from: data)
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(ErrorRequest.noData))
            }
        }
        task.resume()
    }
}
