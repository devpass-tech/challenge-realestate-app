//
//  APIClient.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//


import Foundation

enum ResultError: Error {
    case badURL, noData, invalidJSON
}

public final class RealEstateAPIClient {
    struct Constants {
        static let url = URL(string: "https://raw.githubusercontent.com/devpass-tech/challenge-realestate-app/main/api/listings.json")
    }
    func fetchProperties(completion: @escaping (Result<[Property], ResultError>) -> Void) {
        guard let url = Constants.url else {
            completion(.failure(.badURL))
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let response = response as? HTTPURLResponse, response.statusCode == 200, let data = data else {
                completion(.failure(.invalidJSON))
                return
            }
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode([Property].self, from: data)
                completion(.success(result))
            } catch {
                print(error)
                completion(.failure(.noData))
            }
        }
        task.resume()
    }
}
