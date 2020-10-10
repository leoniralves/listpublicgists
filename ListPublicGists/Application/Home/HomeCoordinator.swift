//
//  HomeCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    private var presenter: UINavigationController
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    func start() {
        let homeViewController = HomeViewController()
        presenter.show(homeViewController, sender: nil)
        
    }
}
