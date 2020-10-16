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
            DispatchQueue.main.async {
                switch state {
                case .loading:
                    print("loading")
                case .load(let gists):
                    self?.gistsListView.configure(gists: gists)
                case .error(let error):
                    print(error)
                default: break
                }
            }
        }
        viewModel.getGistsList()
    }
}

extension GistsListViewController: GistsListViewDelegate {
    func gistListViewPrefetchGists(_ gistListView: GistsListView) {
        print(">> load more gists from controller")
        viewModel.currentPage += 1
        viewModel.getGistsList()
    }
}
