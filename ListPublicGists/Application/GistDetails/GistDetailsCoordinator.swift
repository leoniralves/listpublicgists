//
//  GistDetailsCoordinator.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import Foundation

class GistDetailsCoordinator: Coordinator {
    
    // MARK: Private Properties
    private var router: RouterType
    private var gistDetailsViewModel: GistDetailsViewModel
    
    // MARK: Private Lazy Properties
    private lazy var gistDetailsViewController: GistDetailsViewController = {
        GistDetailsViewController(viewModel: gistDetailsViewModel)
    }()
    
    // MARK: Initializer
    init(router: RouterType, gist: Gist) {
        self.router = router
        
        gistDetailsViewModel = GistDetailsViewModel(gist: gist)
    }
    
    // MARK: Public Methods
    func start(completion: (() -> Void)?) {
        router.show(gistDetailsViewController, completion: completion)
    }
}
