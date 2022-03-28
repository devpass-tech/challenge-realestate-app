//
//  APIClient.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 29/09/21.
//


import Foundation

public final class RealEstateAPIClient {

    public func fetchProperties(completion: @escaping ([String]) -> ()) {

        completion(["Apartamento com 3 quartos e 2 banheiros",
                    "Casa com 2 quartos e 1 banheiro",
                    "Apartamento com 1 quarto e 1 banheiro"])
    }
}
