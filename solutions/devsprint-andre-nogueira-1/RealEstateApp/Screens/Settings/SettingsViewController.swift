//
//  Settings.swift
//  ViewCodeChallenge-RealEstate
//
//  Created by Rodrigo Borges on 06/12/21.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Settings"
        setUpViewConfiguration()
    }
    
    override func loadView() {
        self.view = SettingsView()
        view.backgroundColor = .lightGray
    }
    
    func setUpViewConfiguration(){
        navigationController?.title = "Settings"
    }
    
}
