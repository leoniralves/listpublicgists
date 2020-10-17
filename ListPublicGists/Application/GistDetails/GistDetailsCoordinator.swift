//
//  GistDetailsCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

class GistDetailsCoordinator: Coordinator {
    
    // MARK: Private Properties
    private let presenter: NavigationControllerProtocol
    private var gistDetailsViewModel: GistDetailsViewModel
    
    // MARK: Private Lazy Properties
    private lazy var gistDetailsViewController: GistDetailsViewController = {
        GistDetailsViewController(viewModel: gistDetailsViewModel)
    }()
    
    // MARK: Initializer
    init(presenter: NavigationControllerProtocol, gist: Gist) {
        self.presenter = presenter
        
        gistDetailsViewModel = GistDetailsViewModel(gist: gist)
    }
    
    // MARK: Public Methods
    func start() {
        presenter.show(gistDetailsViewController, sender: nil)
    }
}
