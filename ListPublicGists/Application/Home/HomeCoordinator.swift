//
//  HomeCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    // MARK: Private properties
    private let presenter: NavigationControllerProtocol
    private var homeViewModel: HomeViewModelProtocol
    
    // MARK: Initializer
    init(presenter: NavigationControllerProtocol,
         homeViewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.presenter = presenter
        
        self.homeViewModel = homeViewModel
        self.homeViewModel.delegate = self
    }
    
    // MARK: Public Methods
    func start() {
        let homeViewController = HomeViewController(viewModel: homeViewModel)
        presenter.show(homeViewController, sender: nil)
    }
}

// MARK: HomeViewModelDelegate
extension HomeCoordinator: HomeViewModelDelegate {
    func homeViewModelDidShowPublicGists(_ viewModel: HomeViewModel) {
        print(">> homeViewModelDidShowPublicGists")
    }
}
