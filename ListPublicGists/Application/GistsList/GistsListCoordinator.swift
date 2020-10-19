//
//  GistsListCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import UIKit

class GistsListCoordinator: Coordinator {
    
    // MARK: Private Properties
    private var router: RouterType
    private var gistsListViewModel: GistsListViewModelProtocol
    
    // MARK: Private Lazy Properties
    private lazy var gistsListViewController: GistsListViewController = {
        GistsListViewController(viewModel: gistsListViewModel)
    }()
    
    // MARK: Initializer
    init(router: RouterType,
         gistsListViewModel: GistsListViewModelProtocol = GistsListViewModel()) {
        self.router = router
        
        self.gistsListViewModel = gistsListViewModel
        self.gistsListViewModel.delegate = self
    }
    
    
    // MARK: Public Methods
    func start(completion: (()->Void)?) {
        router.show(gistsListViewController, completion: completion)
    }
    
    // MARK: Private Methods
    private func showGistDetails(gist: Gist) {
        var gistDetailsCoordinator: GistDetailsCoordinator? = GistDetailsCoordinator(router: router,
                                                                                     gist: gist)
        gistDetailsCoordinator?.start {
            gistDetailsCoordinator = nil
        }
    }
}

// MARK: GistsListViewModelDelegate
extension GistsListCoordinator: GistsListViewModelDelegate {
    func gistsListViewModel(_ viewModel: GistsListViewModelProtocol,
                            didSelectGist gist: Gist) {
        showGistDetails(gist: gist)
    }
}
