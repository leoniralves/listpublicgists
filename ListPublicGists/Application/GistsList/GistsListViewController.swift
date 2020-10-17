//
//  GistsListViewController.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import UIKit

class GistsListViewController: UIViewController {
    
    // MARK: Private Properties
    private var viewModel: GistsListViewModelProtocol
    private let gistsListView: GistsListView = GistsListView()
    
    // MARK: Initializer
    init(viewModel: GistsListViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle View
    override func loadView() {
        super.loadView()
        view = gistsListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = GistsListStrings.Controller.title
        
        gistsListView.delegate = self
        
        viewModel.gistsStatus.didChange = { [weak self] state in
            self?.gistsListView.configure(state: state)
        }
        viewModel.getGistsList()
    }
    
    deinit {
        print(">>> \(String(describing: Self.self)) deinit")
    }
}

extension GistsListViewController: GistsListViewDelegate {
    func gistListRetry(_ gistListView: GistsListView) {
        viewModel.getGistsList()
    }
    
    func gistListViewPrefetchGists(_ gistListView: GistsListView) {
        viewModel.getGistsList()
    }
}
