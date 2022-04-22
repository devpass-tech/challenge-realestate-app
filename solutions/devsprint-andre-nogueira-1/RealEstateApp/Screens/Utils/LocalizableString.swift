//
//  LocalizableString.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 21/04/22.
//

import Foundation

enum LocalizableString {
    static func resolve(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
    static var loremipsum: String {
        return resolve(key: "Loremipsum")
    }
    
    static var value: String {
        return resolve(key: "Value")
    }
    
    static var condominium: String {
        return resolve(key: "Condominium")
    }
    
    static var iptu: String {
        return resolve(key: "IPTU")
    }
    
    static var size: String {
        return resolve(key: "Size")
    }
    
    static var rooms: String {
        return resolve(key: "Rooms")
    }
    
    static var baths: String {
        return resolve(key: "Baths")
    }
    
    static var parks: String {
        return resolve(key: "Parks")
    }
    
    static var address: String {
        return resolve(key: "Address")
    }
    
    static var descriptions: String {
        return resolve(key: "Descriptions")
    }
    
    static var seeMore: String {
        return resolve(key: "SeeMore")
    }
    
    static var interest: String {
        return resolve(key: "Interest")
    }
    
    static var name: String {
        return resolve(key: "Nome")
    }
    
    static var email: String {
        return resolve(key: "Email")
    }
    
    static var contact: String {
        return resolve(key: "Enviar contato")
    }
    
    static var hide: String {
        return resolve(key: "Hide")
    }
}
