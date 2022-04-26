//
//  TabBarViewController.swift
//  RealEstateApp
//
//  Created by Bruno Vieira Souza on 12/04/22.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

//MARK: Private extension - used to store private methods
private extension UITabBarController{
    func setupUI(){
        self.view.backgroundColor = .systemBackground
        self.tabBar.tintColor = .systemBlue
        
        let homeVc = UINavigationController(rootViewController: PropertyListFactory.createPropertyList())
        let favoritesVc = UINavigationController(rootViewController: FavoritesViewController())
        let accountVc = UINavigationController(rootViewController: AccountFactory.createAccount())
        
        homeVc.tabBarItem.image = UIImage(systemName: "house")
        favoritesVc.tabBarItem.image = UIImage(systemName: "heart")
        accountVc.tabBarItem.image = UIImage(systemName: "person")
        
        homeVc.title = "Real Estate App"
        favoritesVc.title = "Favorites"
        accountVc.title = "Account"
        
        setViewControllers([homeVc,favoritesVc, accountVc], animated: true)
    }
}
