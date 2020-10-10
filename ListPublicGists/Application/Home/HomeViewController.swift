//
//  HomeViewController.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: Private Properties
    let viewModel: HomeViewModelProtocol
    let homeView: HomeView = HomeView()
    
    // MARK: Initializer
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle View
    override func loadView() {
        super.loadView()
        view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = HomeStrings.Controller.title
        
        homeView.delegate = self
    }
}

// MARK: HomeViewDelegate
extension HomeViewController: HomeViewDelegate {
    func homeViewDidShowPublicGistisList(_ view: HomeView) {
        viewModel.showPublicGists()
    }
}
