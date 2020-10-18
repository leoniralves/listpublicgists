//
//  HomeCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    // MARK: Private Properties
    private let presenter: NavigationControllerProtocol
    private var homeViewModel: HomeViewModelProtocol
    
    // MARK: Private Lazy Properties
    private lazy var homeViewController: HomeViewController = {
        HomeViewController(viewModel: homeViewModel)
    }()
    
    private lazy var gistsListCoordinator: GistsListCoordinator = {
        GistsListCoordinator(presenter: presenter)
    }()
    
    // MARK: Initializer
    init(presenter: NavigationControllerProtocol,
         homeViewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.presenter = presenter
        
        self.homeViewModel = homeViewModel
        self.homeViewModel.delegate = self
    }
    
    // MARK: Public Methods
    func start() {
        presenter.show(homeViewController, sender: nil)
    }
    
    // MARK: Private Methods
    private func showGistsList() {
        gistsListCoordinator.start()
    }
}

// MARK: HomeViewModelDelegate
extension HomeCoordinator: HomeViewModelDelegate {
    func homeViewModelDidShowPublicGists(_ viewModel: HomeViewModelProtocol) {
        showGistsList()
    }
}
