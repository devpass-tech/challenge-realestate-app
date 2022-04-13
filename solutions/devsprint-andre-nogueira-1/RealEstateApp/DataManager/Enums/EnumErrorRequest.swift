//
//  EnumErrorRequest.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 13/04/22.
//

import Foundation

public enum ErrorRequest: Error {
    case urlNotValid
    case noResponse
    case noData
    case invalidJson
}
