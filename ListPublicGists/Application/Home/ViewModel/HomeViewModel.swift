//
//  HomeViewModel.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 10/10/20.
//

import Foundation

class HomeViewModel: HomeViewModelProtocol {
    
    // MARK: Public Properties
    weak var delegate: HomeViewModelDelegate?
    
    // MARK: Public Methods
    func showPublicGists() {
        delegate?.homeViewModelDidShowPublicGists(self)
    }
}
