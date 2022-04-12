//
//  AccountViewModel.swift
//  RealEstateApp
//
//  Created by Caio Alcântara on 11/04/22.
//

import UIKit

protocol AccountViewModelProtocol: AnyObject{
    var didLogin: (String) -> () { get set }
    var didForgot: (String) -> () {get set }
    
    func doLogin()
    func doForgot()
}

final class AccountViewModel: AccountViewModelProtocol{
    var didLogin: (String) -> () = {_ in }
    var didForgot: (String) -> () = {_ in }

    
    func doLogin() {
        self.didLogin("Login Success!")
    }
    
    func doForgot() {
        self.didLogin("Forgot Success!")
    }
}
