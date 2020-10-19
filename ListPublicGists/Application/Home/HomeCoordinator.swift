//
//  HomeCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    // MARK: Private Properties
    private var router: RouterType
    private var homeViewModel: HomeViewModelProtocol
    
    // MARK: Private Lazy Properties
    private lazy var homeViewController: HomeViewController = {
        HomeViewController(viewModel: homeViewModel)
    }()
    
    // MARK: Initializer
    
    init(router: RouterType,
         homeViewModel: HomeViewModelProtocol = HomeViewModel()) {
        self.router = router
        
        self.homeViewModel = homeViewModel
        self.homeViewModel.delegate = self
    }
    
    // MARK: Public Methods
    func start(completion: (() -> Void)?) {
        router.show(homeViewController, completion: completion)
    }
    
    // MARK: Private Methods
    private func showGistsList() {
        var gistsListCoordinator: GistsListCoordinator? = GistsListCoordinator(router: router)
        gistsListCoordinator?.start() {
            gistsListCoordinator = nil
        }
    }
}

// MARK: HomeViewModelDelegate
extension HomeCoordinator: HomeViewModelDelegate {
    func homeViewModelDidShowPublicGists(_ viewModel: HomeViewModelProtocol) {
        showGistsList()
    }
}
