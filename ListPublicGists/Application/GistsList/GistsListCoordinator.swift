//
//  GistsListCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

class GistsListCoordinator: Coordinator {
    
    // MARK: Private Properties
    private let presenter: NavigationControllerProtocol
    private var gistsListViewModel: GistsListViewModelProtocol
    private var gistDetailsCoordinator: GistDetailsCoordinator?
    
    // MARK: Private Lazy Properties
    private lazy var gistsListViewController: GistsListViewController = {
        GistsListViewController(viewModel: gistsListViewModel)
    }()
    
    // MARK: Initializer
    init(presenter: NavigationControllerProtocol,
         gistsListViewModel: GistsListViewModelProtocol = GistsListViewModel()) {
        self.presenter = presenter
        
        self.gistsListViewModel = gistsListViewModel
        self.gistsListViewModel.delegate = self
    }
    
    // MARK: Public Methods
    func start() {
        presenter.show(gistsListViewController, sender: nil)
    }
}

// MARK: GistsListViewModelDelegate
extension GistsListCoordinator: GistsListViewModelDelegate {
    func gistsListViewModel(_ viewModel: GistsListViewModel,
                            didSelectGist gist: Gist) {
        gistDetailsCoordinator = GistDetailsCoordinator(presenter: presenter,
                                                        gist: gist)
        gistDetailsCoordinator?.start()
    }
}
