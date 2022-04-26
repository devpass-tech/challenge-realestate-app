//
//  DynamicBind.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 25/04/22.
//

import Foundation

class Bindable<T> {
    var bind: (T?) -> () = { _ in }
    
    var value: T? {
        didSet {
            bind(value)
        }
    }
    
    init(_ v: T) {
        value = v
    }
}
