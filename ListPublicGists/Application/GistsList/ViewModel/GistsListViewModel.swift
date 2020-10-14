//
//  GistsListViewModel.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

protocol GistsListViewModelProtocol {
    
    var gists: [Gist] { get }
    var gistsStatus: Observable<RequestStates<[Gist]>> { set get }
    
    func getGistsList()
}

class GistsListViewModel: GistsListViewModelProtocol {
    
    private(set) var gists: [Gist] = []
    private let repository: GistsListRepositoryProtocol
    
    var gistsStatus: Observable<RequestStates<[Gist]>> = Observable(.initializer)
    
    init(repository: GistsListRepositoryProtocol = GistsListRepository()) {
        self.repository = repository
    }
    
    func getGistsList() {
        gistsStatus.value = .loading
        repository.getGistsList { (result) in
            switch result {
            case .success(let gists):
                self.gistsStatus.value = .load(gists)
            case .failure(let error):
                self.gistsStatus.value = .error(error)
            }
        }
    }
}

