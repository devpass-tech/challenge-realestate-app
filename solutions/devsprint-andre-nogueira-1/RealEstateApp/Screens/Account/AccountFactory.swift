//
//  AccountFactory.swift
//  RealEstateApp
//
//  Created by Andre Nogueira on 13.04.22.
//

import Foundation

struct AccountFactory {
    
    static func createAccount() -> AccountViewController {
        let viewModel = AccountViewModel()
        let viewController = AccountViewController(viewModel: viewModel)
        return viewController
    }
}
