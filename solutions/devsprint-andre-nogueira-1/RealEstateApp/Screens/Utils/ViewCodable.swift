//
//  Protocols.swift
//  RealEstateApp
//
//  Created by Douglas Biagi Grana on 14/04/22.
//

import Foundation

protocol ViewCodable {
    func setUpConstraints()
    func setUpHierarchy()
    func setUpViewCode()
}

extension ViewCodable {
    func setUpViewCode() {
        setUpHierarchy()
        setUpConstraints()
    }
}
