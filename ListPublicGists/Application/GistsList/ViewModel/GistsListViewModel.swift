//
//  GistsListViewModel.swift
//  ListPublicGists
//
//  Created by Leonir Alves Deolindo on 11/10/20.
//

import Foundation

protocol GistsListViewModelProtocol {
    
    var gists: [Gist] { get }
    var gistsStatus: Observable<RequestStates<[Gist]>> { get }
    var currentPage: Int { set get }
    var numberOfItems: Int { set get }
    
    func getGistsList()
}

class GistsListViewModel: GistsListViewModelProtocol {
    
    // MARK: Private Properties
    private(set) var gists: [Gist] = []
    private let repository: GistsListRepositoryProtocol
    private(set) var gistsStatus: Observable<RequestStates<[Gist]>> = Observable(.initializer)
    
    // MARK: Public Properties
    var currentPage = 1
    var numberOfItems = 30
    
    // MARK: Initializer
    init(repository: GistsListRepositoryProtocol = GistsListRepository()) {
        self.repository = repository
    }
    
    // MARK: Public Methods
    func getGistsList() {
        gistsStatus.value = .loading
        repository.getGistsList(page: currentPage,
                                items: numberOfItems) { (result) in
            switch result {
            case .success(let gists):
                self.gistsStatus.value = .load(gists)
            case .failure(let error):
                self.gistsStatus.value = .error(error)
            }
        }
    }
}

