//
//  DesignSystem.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 21/04/22.
//

import UIKit

public enum DesignSystem {
    enum Typography {
        static let boldL = UIFont.boldSystemFont(ofSize: 18)
        static let boldM = UIFont.boldSystemFont(ofSize: 16)
        static let boldS = UIFont.boldSystemFont(ofSize: 14)
        static let l = UIFont.systemFont(ofSize: 18)
        static let m = UIFont.systemFont(ofSize: 16)
        static let s = UIFont.systemFont(ofSize: 14)
    }
    
    enum ColorPallet {
        static let black = UIColor.black
        static let gray = UIColor.gray
        static let blue = UIColor.systemBlue
    }    
}
