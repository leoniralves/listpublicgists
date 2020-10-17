//
//  GistsListCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

class GistsListCoordinator: Coordinator {
    
    private let presenter: NavigationControllerProtocol
    
    private lazy var gistsListViewModel: GistsListViewModelProtocol = {
        GistsListViewModel()
    }()
    
    private lazy var gistsListViewController: GistsListViewController = {
        GistsListViewController(viewModel: gistsListViewModel)
    }()
    
    init(presenter: NavigationControllerProtocol) {
        self.presenter = presenter
    }
    
    func start() {
        presenter.show(gistsListViewController, sender: nil)
    }
}
