//
//  GistDetailsViewController.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 17/10/20.
//

import UIKit

class GistDetailsViewController: UIViewController {

    private var viewModel: GistDetailsViewModelProtocol
    private lazy var gistDetailsView: GistDetailsView = {
        let gistDetailsView = GistDetailsView()
        gistDetailsView.configure(gist: viewModel.gist)
        return gistDetailsView
    }()
    
    init(viewModel: GistDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = gistDetailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.gist.owner.login
    }
}
