//
//  GistsListCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

class GistsListCoordinator: Coordinator {
    
    private let presenter: NavigationControllerProtocol
    private let gistsListViewModel: GistsListViewModelProtocol
    
    init(presenter: NavigationControllerProtocol) {
        self.presenter = presenter
        gistsListViewModel = GistsListViewModel()
    }
    
    func start() {
        let gistsListViewController = GistsListViewController(viewModel: gistsListViewModel)
        presenter.show(gistsListViewController, sender: nil)
    }
}
