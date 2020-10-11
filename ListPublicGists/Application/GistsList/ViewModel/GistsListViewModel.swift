//
//  GistsListViewModel.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

protocol GistsListViewModelProtocol {
    
    var gists: [Gist] { get }
    
    func getGistsList()
}

class GistsListViewModel: GistsListViewModelProtocol {
    
    private(set) var gists: [Gist] = []
    private let repository: GistsListRepositoryProtocol
    
    enum Status {
        case loading
        case finished
        case error(NetworkError)
    }
    
    
    
    init(repository: GistsListRepositoryProtocol = GistsListRepository()) {
        self.repository = repository
    }
    
    func getGistsList() {
        repository.getGistsList { (result) in
            switch result {
            case .success(let gists):
                self.gists = gists
            case .failure(_):
                break
            }
        }
    }
}
